package com.miaou.trust.controller;

import com.miaou.meeting.dao.MeetingDao;
import com.miaou.meeting.model.Meeting;
import com.miaou.message.dao.MessageDao;
import com.miaou.message.model.Message;
import com.miaou.message.model.MessageStatus;
import com.miaou.news.dao.NewsDao;
import com.miaou.news.model.News;
import com.miaou.news.model.NewsType;
import com.miaou.trust.dao.CoOwnershipDao;
import com.miaou.trust.dao.TrustDao;
import com.miaou.trust.form.AccountFormValidator;
import com.miaou.trust.form.CoOwnershipFormValidator;
import com.miaou.trust.form.MessageFormValidato;
import com.miaou.trust.form.MettingFormValidato;
import com.miaou.trust.form.NewsFormValidator;
import com.miaou.trust.form.WorksFormValidato;
import com.miaou.trust.model.CoOwnership;
import com.miaou.users.dao.AccountDao;
import com.miaou.users.model.Account;
import com.miaou.users.model.AccountManager;
import com.miaou.users.model.AccountOwner;
import com.miaou.works.dao.WorksDao;
import com.miaou.works.dao.WorksRequestDao;
import com.miaou.works.model.WorksRequest;
import com.miaou.works.model.WorksSmall;

import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManagerController {
    private String pathView = "back/manager/";

    @Autowired
    private TrustDao trustDao;

    @Autowired
    private AccountDao accountDao;

    @Autowired
    private CoOwnershipDao coOwnershipDao;
    
    @Autowired
    private MeetingDao meetingDao;
    
    @Autowired
    private WorksDao worksDao;
    
    @Autowired
    private MessageDao messageDao;
    
    @Autowired
    private NewsDao newsDao;

    @Autowired
    private WorksRequestDao worksRequestDao;

    @RequestMapping(value = {"/manager"}, method = RequestMethod.GET)
    public ModelAndView homeManagerPage() {
        return getMinModel(getAccount(), "home");
    }
    
    /**************************************************************************/
    /****************DEBUT DES PAGES DE GESTION DE CO-OWNERSHIPS***************/
    /**************************************************************************/
    @RequestMapping(value = {"/manager/co_ownership"}, method = RequestMethod.GET)
    public ModelAndView viewCoOwnershipPage() {
        AccountManager account = getAccount();
        ModelAndView model = getMinModel(account, "co_ownership_view");
        model.addObject("coOwnership", account.getCoOwnership());
        return model;
    }
    
    @RequestMapping(value = {"/manager/co_ownership/update/"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView updateCoOwnershipPage(CoOwnership coOwnership, BindingResult result, HttpServletRequest request) {
        AccountManager account = getAccount();

        if (request.getMethod() == "POST") {
            CoOwnershipFormValidator fv = new CoOwnershipFormValidator();
            fv.validate(coOwnership, result);

            if (result.hasErrors()) {
                ModelAndView model = getMinModel(account, "co_ownership_add_update");
                model.addObject("errors", result);
                model.addObject("coOwnership", coOwnership);
                return model;
            } else {
                CoOwnership c = coOwnershipDao.getById(coOwnership.getId());
                c.setAddress(coOwnership.getAddress());
                c.setName(coOwnership.getName());
                c.setDescription(coOwnership.getDescription());
                coOwnershipDao.updateCoOwnership(c);
                
                return new ModelAndView("redirect:/manager/co_ownership/");
            }
        } else {
            ModelAndView model = getMinModel(account, "co_ownership_add_update");
            model.addObject("coOwnership", account.getCoOwnership());
            return model;
        }
    }
    /**************************************************************************/
    /*****************FIN DES PAGES DE GESTION DE CO-OWNERSHIPS****************/
    /**************************************************************************/
    
    @RequestMapping(value = {"/manager/owner/add"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView addOwnerPage(HttpServletRequest request) {
        AccountManager am = (AccountManager) accountDao.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        int nbAccount = Integer.parseInt(request.getParameter("nbAccount"));

        for (int i = 0; i < nbAccount; i++) {
            String username;
            String password;
            do {
                username = new RandomAlphaNum(10).nextString();
                password = new RandomAlphaNum(10).nextString();
            } while (accountDao.findByUsername(username) != null);
            accountDao.addAccount(new AccountOwner(username, password, am.getCoOwnership()));
        }
        return new ModelAndView("redirect:/manager/co_ownership");
    }
    
    @RequestMapping(value = {"/manager/meeting/add"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView addMeetingPage(Meeting meeting, BindingResult result, HttpServletRequest request) {
        AccountManager account = getAccount();
        
        if (request.getMethod() == "POST") {
            MettingFormValidato fv = new MettingFormValidato();
            fv.validate(meeting, result);

            if (result.hasErrors()) {
                ModelAndView model = getMinModel(account, "meeting_add");
                model.addObject("errors", result);
                model.addObject("meeting", meeting);
                return model;
            } 
            else {
                meeting.setCoOwnership(account.getCoOwnership());
                meetingDao.addMeeting(meeting);
                
                News news = new News();
                news.setAccount(account);
                news.setTitle("Assemblée Générale du " + meeting.getMeetingDate());
                news.setContents(meeting.getContents());
                news.setType(NewsType.MEETING);
                news.setImage("meeting.png");
                news.setCoOwnership(account.getCoOwnership());
                newsDao.addNews(news);
                
                return new ModelAndView("redirect:/manager/co_ownership");
            }
        } 
        else {
            ModelAndView model = getMinModel(account, "meeting_add");
            meeting = new Meeting();
            meeting.setCoOwnership(account.getCoOwnership());
            model.addObject("meeting",meeting);
            return model;
        }
    }
    
   
    
    /**************************************************************************/
    /**************************DEBUT DES PAGES MESSAGE*************************/
    /**************************************************************************/ 
    
    @RequestMapping(value = {"/manager/message"}, method = RequestMethod.GET)
    public ModelAndView MessagePage() {
        return getMinModel(getAccount(), "message");
    }
    
    @RequestMapping(value = {"/manager/message/view/{someID}"}, method = RequestMethod.GET)
    public @ResponseBody ModelAndView MessageViewPage(@PathVariable(value="someID") int id) {
        AccountManager account = getAccount();
        Message m = messageDao.getById(id);
        
        if(m != null && !m.getSender().getUsername().equals(account.getUsername()) && !m.getRecipient().getUsername().equals(account.getUsername()))
            return new ModelAndView("redirect:/404");
        
        if(m.getStatus() == MessageStatus.NON_LU){
            m.setStatus(MessageStatus.LU);
            messageDao.updateMessage(m);
        }
        
        ModelAndView model = getMinModel(account, "message_view");
        model.addObject("message", m);
        return model;
    }
    
    @RequestMapping(value = {"/manager/message/new"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView sendMessagePage(Message message, BindingResult result, HttpServletRequest request) {
        AccountManager account = getAccount();

        if (request.getMethod() == "POST") {
            MessageFormValidato fv = new MessageFormValidato();
            fv.validate(message, result);
            
            if (result.hasErrors()) {
                Map<Integer, String> listAccount = new LinkedHashMap<Integer, String>();
                for (Account a : account.getCoOwnership().getTrust().getAccountTrusts()) {
                    listAccount.put(a.getId(), a.getFirstName()+ " " + a.getLastName());
                }
                for (Account a : account.getCoOwnership().getOwners()) {
                    listAccount.put(a.getId(), a.getFirstName()+ " " + a.getLastName());
                }
                for (Account a : account.getCoOwnership().getManagers()) {
                    listAccount.put(a.getId(), a.getFirstName()+ " " + a.getLastName());
                    
                }
                
                ModelAndView model = getMinModel(account, "message_new");
                model.addObject("errors", result);
                model.addObject("list", listAccount);
                model.addObject("message", message);
                return model;
            } 
            else {
                message.setStatus(MessageStatus.NON_LU);
                message.setSender(account);
                messageDao.addMessage(message);
                return new ModelAndView("redirect:/manager/message");
            }
        } 
        else {
            Map<Integer, String> listAccount = new LinkedHashMap<Integer, String>();
            for (Account a : account.getCoOwnership().getTrust().getAccountTrusts()) {
                listAccount.put(a.getId(), a.getFirstName()+ " " + a.getLastName());
            }
            for (Account a : account.getCoOwnership().getOwners()) {
                listAccount.put(a.getId(), a.getFirstName()+ " " + a.getLastName());
            }
            for (Account a : account.getCoOwnership().getManagers()) {
                listAccount.put(a.getId(), a.getFirstName()+ " " + a.getLastName());
            }
            ModelAndView model = getMinModel(account, "message_new");
            model.addObject("list", listAccount);
            model.addObject("message", message);
            return model;
        }
    }

    /**************************************************************************/
    /***************************FIN DES PAGES MESSAGE**************************/
    /**************************************************************************/


    @RequestMapping(value = {"/manager/news/add"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView addNewsPage(News news, BindingResult result, HttpServletRequest request) {
        AccountManager account = getAccount();

        if (request.getMethod() == "POST") {
            NewsFormValidator fv = new NewsFormValidator();
            fv.validate(news, result);
            
            if (result.hasErrors()) {
                ModelAndView model = getMinModel(account, "news_add");
                model.addObject("errors", result);
                model.addObject("news", news);
                return model;
            } 
            else {
                news.setType(NewsType.ANNOUNCEMENT);
                news.setAccount(account);
                news.setCoOwnership(account.getCoOwnership());
                news.setImage("annonce.png");
                newsDao.addNews(news);
                return new ModelAndView("redirect:/manager/co_ownership");
            }
        } 
        else {   
            ModelAndView model = getMinModel(account, "news_add");
            model.addObject("news", news);
            return model;
        }
    }

    
    @RequestMapping(value = {"/manager/profil"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView profilPage(Account faccount, BindingResult result, HttpServletRequest request) {
        AccountManager account = getAccount();

        if (request.getMethod() == "POST") {
            AccountFormValidator fv = new AccountFormValidator();
            fv.validate(faccount, result);

            if (result.hasErrors()) {
                ModelAndView model = getMinModel(account, "profil");
                model.addObject("errors", result);
                model.addObject("faccount", faccount);
                return model;
            } else {
                account.setEmail(faccount.getEmail());
                account.setFirstName(faccount.getFirstName());
                account.setLastName(faccount.getLastName());
                accountDao.updateAccount(account);
                
                return new ModelAndView("redirect:/manager/profil");
            }
        } else {
            ModelAndView model = getMinModel(account, "profil");
            model.addObject("faccount", account);
            return model;
        }
    }
    
    @RequestMapping(value = {"/manager/works/add"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView addWorksPage(WorksSmall works, BindingResult result, HttpServletRequest request) {
        AccountManager account = getAccount();
        
        if (request.getMethod() == "POST") {
            WorksFormValidato fv = new WorksFormValidato();
            fv.validate(works, result);
            if (result.hasErrors()) {
                ModelAndView model = getMinModel(account, "works_add");
                model.addObject("errors", result);
                model.addObject("works", works);
                return model;
            } 
            else {
                works.setCoOwnership(account.getCoOwnership());
                worksDao.addWorks(works);
                
                News news = new News();
                news.setAccount(account);
                news.setTitle("Travaux : " + works.getTitle());
                news.setContents(works.getContents());
                news.setType(NewsType.WORKS);
                news.setImage("works.png");
                news.setCoOwnership(account.getCoOwnership());

                newsDao.addNews(news);
                
                return new ModelAndView("redirect:/manager/co_ownership");
            }
        } 
        else {            
            ModelAndView model = getMinModel(account, "works_add");
            works = new WorksSmall();
            works.setCoOwnership(account.getCoOwnership());
            model.addObject("works", works);
            return model;
        }
    }
    
    @RequestMapping(value = {"/manager/works/add/{id}"}, method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody ModelAndView addWorksRPage(WorksSmall works, BindingResult result, HttpServletRequest request, @PathVariable(value="id") int id) {
        AccountManager account = getAccount();
        
        if (request.getMethod() == "POST") {
            WorksFormValidato fv = new WorksFormValidato();
            fv.validate(works, result);
            if (result.hasErrors()) {
                ModelAndView model = getMinModel(account, "works_add");
                model.addObject("errors", result);
                model.addObject("works", works);
                return model;
            } 
            else {
                works.setCoOwnership(account.getCoOwnership());
                
                worksDao.addWorks(works);
                
                WorksRequest wr = worksRequestDao.getById(id);
                wr.setWorks(works);
                wr.setStatus("OK");
                worksRequestDao.updateWorksRequest(wr);
                
                News news = new News();
                news.setAccount(account);
                news.setTitle("Travaux : " + works.getTitle());
                news.setContents(works.getContents());
                news.setType(NewsType.WORKS);
                news.setImage("works.png");
                news.setCoOwnership(account.getCoOwnership());

                newsDao.addNews(news);
                
                return new ModelAndView("redirect:/manager/co_ownership");
            }
        } 
        else {            
            ModelAndView model = getMinModel(account, "works_add");
            works = new WorksSmall();
            works.setCoOwnership(account.getCoOwnership());
            model.addObject("works", works);
            return model;
        }
    }
    
    @RequestMapping(value = {"/manager/works/refuse/{id}"}, method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody ModelAndView refuseWorksPage(@PathVariable(value="id") int id) {
        WorksRequest wr = worksRequestDao.getById(id);
        wr.setStatus("REFUSE");
        worksRequestDao.updateWorksRequest(wr);
        return new ModelAndView("redirect:/manager/works/requests");
    }
    
    @RequestMapping(value = {"/manager/works/requests"}, method = RequestMethod.GET)
    public ModelAndView worksRequestsPage() {
        return getMinModel(getAccount(), "works_requests");
    }
    
    @RequestMapping(value = {"/manager/works/requests/view/{someID}"}, method = RequestMethod.GET)
    public @ResponseBody ModelAndView worksRequestViewpage(@PathVariable(value="someID") int id) {
        AccountManager account = getAccount();
        WorksRequest r = worksRequestDao.getById(id);
        
        
        
        ModelAndView model = getMinModel(account, "works_request_view");
        model.addObject("request", r);
        return model;
    }
    
    
    
    
    
    private ModelAndView getMinModel(AccountManager account){
        ModelAndView model = new ModelAndView();
        model.addObject("account", account);
        model.addObject("trust", account.getCoOwnership().getTrust());
        return model;
    }
    
    private ModelAndView getMinModel(AccountManager account, String fileView){
        ModelAndView model = getMinModel(account);
        model.setViewName(this.pathView + fileView);
        return model;
   }
   
   private AccountManager getAccount(){
       return (AccountManager) accountDao.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
   } 
    
    
    
    
}
