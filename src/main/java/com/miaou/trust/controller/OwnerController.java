package com.miaou.trust.controller;

import com.miaou.meeting.dao.MeetingDao;
import com.miaou.meeting.dao.ResolutionDao;
import com.miaou.meeting.model.Meeting;
import com.miaou.meeting.model.Resolution;
import com.miaou.message.dao.MessageDao;
import com.miaou.message.model.Message;
import com.miaou.message.model.MessageStatus;
import com.miaou.news.dao.NewCommentDao;
import com.miaou.news.dao.NewsDao;
import com.miaou.news.model.NewComment;
import com.miaou.news.model.News;
import com.miaou.trust.dao.CoOwnershipDao;
import com.miaou.trust.dao.TrustDao;
import com.miaou.trust.form.AccountFormValidator;
import com.miaou.trust.form.CoOwnershipFormValidator;
import com.miaou.trust.form.MessageFormValidato;
import com.miaou.trust.form.MettingFormValidato;
import com.miaou.trust.form.NewsFormValidator;
import com.miaou.trust.form.WorksFormValidato;
import com.miaou.trust.form.WorksRequestFormValidator;
import com.miaou.trust.model.CoOwnership;
import com.miaou.users.dao.AccountDao;
import com.miaou.users.model.Account;
import com.miaou.users.model.AccountManager;
import com.miaou.users.model.AccountOwner;
import com.miaou.users.model.AccountTrust;
import com.miaou.works.dao.WorksDao;
import com.miaou.works.dao.WorksRequestDao;
import com.miaou.works.model.WorksRequest;
import com.miaou.works.model.WorksSmall;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
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
public class OwnerController {
    private String pathView = "front/owner/";

    @Autowired
    private AccountDao accountDao;

    @Autowired
    private NewCommentDao newCommentDao;

    @Autowired
    private NewsDao newsDao;

    @Autowired
    private WorksRequestDao worksRequestDao;

    @Autowired
    private MeetingDao meetingDao;

    @Autowired
    private ResolutionDao resolutionDao;

    @Autowired
    private MessageDao messageDao;

    @RequestMapping(value = {"/owner"}, method = RequestMethod.GET)
    public ModelAndView homeOwnerPage() {
        return getMinModel(getAccount(), "home");
    }

    @RequestMapping(value = {"/owner/comment/add"}, method = RequestMethod.POST)
    public ModelAndView addCommentPage(HttpServletRequest request) {
        NewComment nc = new NewComment();
        nc.setAuthor(getAccount());
        nc.setNews(newsDao.getById(Integer.parseInt(request.getParameter("idNew"))));
        nc.setContents(request.getParameter("contents"));

        if (nc.getContents() != null && nc.getContents().trim() != "")
            newCommentDao.addNewComment(nc);
        
        return new ModelAndView("redirect:/owner");
    }

    @RequestMapping(value = {"/owner/news/add**"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView addNewsPage(News news, BindingResult result, HttpServletRequest request) {
        AccountOwner account = getAccount();

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
                news.setAccount(account);
                news.setCoOwnership(account.getCoOwnership());
                newsDao.addNews(news);
                
                return new ModelAndView("redirect:/owner");
            }
        } 
        else {
            ModelAndView model = getMinModel(account, "news_add");
            model.addObject("news", new News());
            return model;
        }
    }

    @RequestMapping(value = {"/owner/add_works_request**"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView addWorksRequestPage(WorksRequest wr, BindingResult result, HttpServletRequest request) {
        AccountOwner account = getAccount();

        if (request.getMethod() == "POST") {
            WorksRequestFormValidator fv = new WorksRequestFormValidator();
            fv.validate(wr, result);
            if (result.hasErrors()) {
                ModelAndView model = getMinModel(account, "add_works_request");
                model.addObject("errors", result);
                model.addObject("worksRequest", wr);
                return model;
            } 
            else {
                wr.setOwner(account);
                wr.setStatus("EN ATTENTE");
                worksRequestDao.addWorksRequest(wr);
                
                return new ModelAndView("redirect:/owner");
            }
        } 
        else {
            ModelAndView model = getMinModel(account, "add_works_request");
            model.addObject("worksRequest", new WorksRequest());
            return model;
        }
    }

    @RequestMapping(value = {"/owner/meeting/resolution_add**"}, method = RequestMethod.POST)
    public ModelAndView addResolutionPage(HttpServletRequest request) {
        AccountOwner account = getAccount();
        Resolution r = new Resolution();

        r.setOwner(account);
        r.setMeeting(meetingDao.getById(Integer.parseInt(request.getParameter("id"))));
        r.setContents(request.getParameter("contents"));

        if (r.getContents() != null && r.getContents().trim() != "") {
            resolutionDao.addResolution(r);
        }

        return new ModelAndView("redirect:/owner");
    }
    
        /**************************************************************************/
    /**************************DEBUT DES PAGES MESSAGE*************************/
    /**************************************************************************/ 
    
    @RequestMapping(value = {"/owner/message"}, method = RequestMethod.GET)
    public ModelAndView MessagePage() {
        return getMinModel(getAccount(), "message");
    }
    
    @RequestMapping(value = {"/owner/message/view/{someID}"}, method = RequestMethod.GET)
    public @ResponseBody ModelAndView MessageViewPage(@PathVariable(value="someID") int id) {
        AccountOwner account = getAccount();
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
    
    @RequestMapping(value = {"/owner/message/new"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView sendMessagePage(Message message, BindingResult result, HttpServletRequest request) {
        AccountOwner account = getAccount();

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
                return new ModelAndView("redirect:/owner/message");
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

    @RequestMapping(value = {"/owner/profil"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView profilPage(Account faccount, BindingResult result, HttpServletRequest request) {
        AccountOwner account = getAccount();

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
                
                return new ModelAndView("redirect:/owner/profil");
            }
        } else {
            ModelAndView model = getMinModel(account, "profil");
            model.addObject("faccount", account);
            return model;
        }
    }
    
    private ModelAndView getMinModel(AccountOwner account){
        ModelAndView model = new ModelAndView();
        model.addObject("account", account);
        model.addObject("coOwnership", account.getCoOwnership());
        return model;
    }
    
    private ModelAndView getMinModel(AccountOwner account, String fileView){
        ModelAndView model = getMinModel(account);
        model.setViewName(this.pathView + fileView);
        return model;
   }
   
   private AccountOwner getAccount(){
       return (AccountOwner) accountDao.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
   } 

}
