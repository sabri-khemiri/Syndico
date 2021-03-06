package com.miaou.trust.controller;

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
import com.miaou.trust.form.NewsFormValidator;
import com.miaou.trust.form.TrustFormValidator;
import com.miaou.trust.model.CoOwnership;
import com.miaou.trust.model.Trust;
import com.miaou.users.dao.AccountDao;
import com.miaou.users.model.Account;
import com.miaou.users.model.AccountManager;
import com.miaou.users.model.AccountTrust;
import java.io.File;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TrustController {
    private String pathView = "back/trust/";

    @Autowired
    private AccountDao accountDao;

    @Autowired
    private CoOwnershipDao coOwnershipDao;
    
    @Autowired
    private MessageDao messageDao;
    
    @Autowired
    private NewsDao newsDao;
    
    @Autowired
    private TrustDao trustDao;

    @RequestMapping(value = {"/trust**"}, method = RequestMethod.GET)
    public ModelAndView homeTrustPage() {
        return getMinModel(getAccount(), "home");
    }
    
    /**************************************************************************/
    /****************DEBUT DES PAGES DE GESTION DE CO-OWNERSHIPS***************/
    /**************************************************************************/
    @RequestMapping(value = {"/trust/co_ownership/all"}, method = RequestMethod.GET)
    public ModelAndView coOwnershipViewAllPage() {
        return getMinModel(getAccount(), "co_ownership_all");
    }
    
    @RequestMapping(value = {"/trust/co_ownership/view/{someID}"}, method = RequestMethod.GET)
    public @ResponseBody ModelAndView viewCoOwnershipPage(@PathVariable(value="someID") int id) {
        AccountTrust account = getAccount();
        CoOwnership coOwnership = isGranted(account, id);
        
        if (coOwnership == null)
            return new ModelAndView("redirect:/404");
        
        ModelAndView model = getMinModel(account, "co_ownership_view");
        model.addObject("coOwnership", coOwnership);
        return model;
    }

    @RequestMapping(value = {"/trust/co_ownership/add"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView addCoOwnershipPage(CoOwnership coOwnership, BindingResult result, HttpServletRequest request) {
        AccountTrust account = getAccount();
        if (request.getMethod() == "POST") {
            CoOwnershipFormValidator fv = new CoOwnershipFormValidator();
            fv.validate(coOwnership, result);

            if (result.hasErrors()) {
                ModelAndView model = getMinModel(account, "co_ownership_add_update");
                model.addObject("errors", result);
                model.addObject("coOwnership", coOwnership);
                return model;
            } else {
                coOwnership.setTrust(account.getTrust());
                coOwnershipDao.addCoOwnership(coOwnership);
                
                News news = new News();
                news.setAccount(account);
                news.setTitle("Cr�ation de la copropri�t� sur notre site.");
                news.setContents("Bonjours � tous. Syndico vous souhaite la bienvenue."
                        + "Voil� la cr�ation de la copropri�t� " + coOwnership.getName() + " sur notre site. "
                        + "Pour une aide vous pouvez aller sur la rubrique aide ou-bien prenez contact avec votre syndic "
                        + coOwnership.getTrust().getName() + ". A bient�t");
                news.setCoOwnership(coOwnership);
                news.setType(NewsType.NEW_CO_OWNERSHIP);
                newsDao.addNews(news);
                
                return new ModelAndView("redirect:/trust/co_ownership/all");
            }
        } 
        else {
            ModelAndView model = getMinModel(account, "co_ownership_add_update");
            model.addObject("coOwnership", new CoOwnership());
            return model;
        }
    }

    @RequestMapping(value = {"/trust/co_ownership/update/{someID}"}, method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody ModelAndView updateCoOwnershipPage(@PathVariable(value="someID") int id, CoOwnership coOwnership, BindingResult result, HttpServletRequest request) {
        AccountTrust account = getAccount();
        CoOwnership tmpCoOwnership = isGranted(account, id);
        
        if (tmpCoOwnership == null)
            return new ModelAndView("redirect:/404");

        if (request.getMethod() == "POST") {
            CoOwnershipFormValidator fv = new CoOwnershipFormValidator();
            fv.validate(coOwnership, result);

            if (result.hasErrors()) {
                ModelAndView model = getMinModel(account, "co_ownership_add_update");
                model.addObject("errors", result);
                model.addObject("coOwnership", coOwnership);
                return model;
            } else {
                coOwnership.setTrust(account.getTrust());
                coOwnershipDao.updateCoOwnership(coOwnership);
                
                return new ModelAndView("redirect:/trust/co_ownership/view/"+coOwnership.getId());
            }
        } else {
            ModelAndView model = getMinModel(account, "co_ownership_add_update");
            model.addObject("coOwnership", tmpCoOwnership);
            return model;
        }
    }
    
    @RequestMapping(value = {"/trust/co_ownership/update/image/{someID}"}, method = RequestMethod.GET)
    public @ResponseBody ModelAndView coOwnershipUpdateImageViewpage(HttpServletRequest request, @PathVariable(value="someID") int id) {
        AccountTrust account = getAccount();
        ModelAndView model = getMinModel(account, "co_ownership_image");
        model.addObject("id", id);
        return model;
    }

    @RequestMapping(value = {"/trust/co_ownership/update/image/upload"}, method = RequestMethod.POST)
    public ModelAndView coOwnershipImageUpload(HttpServletRequest request, @RequestParam CommonsMultipartFile[] fileUpload) throws Exception {
        if (fileUpload.length < 0) {
            return new ModelAndView("redirect:/trust/co_ownership/all");
        }
        int id = Integer.parseInt(request.getParameter("id"));
        AccountTrust a = (AccountTrust) accountDao.findByUsername(getAccount().getUsername());

        if (fileUpload != null && fileUpload.length > 0) {
            for (CommonsMultipartFile aFile : fileUpload) {
                if (!aFile.getOriginalFilename().equals("")) {
                    String[] s = aFile.getOriginalFilename().split(Pattern.quote("."));
                    aFile.transferTo(new File("E:/Users/Desktop/Projet/Syndico/src/main/webapp/resources/images/co_ownership/" + id + "." + s[1]));
                    CoOwnership c = coOwnershipDao.getById(id);
                    c.setImage("." + s[1]);
                    coOwnershipDao.updateCoOwnership(c);
                }
            }
        }

        return new ModelAndView("redirect:/trust/co_ownership/all");
    }

    @RequestMapping(value = {"/trust/co_ownership/delete/{someID}"}, method = RequestMethod.GET)
    public @ResponseBody ModelAndView deleteCoOwnershipPage(@PathVariable(value="someID") int id) {
        AccountTrust account = getAccount();
        CoOwnership coOwnership = isGranted(account, id);
        
        if (coOwnership == null)
            return new ModelAndView("redirect:/404");

        coOwnershipDao.removeCoOwnership(coOwnership);
        
        return new ModelAndView("redirect:/trust/co_ownership/all");
    }
    
    @RequestMapping(value = {"/trust/add_manager**"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView addManagerPage(HttpServletRequest request) {
        AccountTrust at = (AccountTrust) accountDao.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        CoOwnership coOwnership = isGranted(at, Integer.parseInt(request.getParameter("idCownership")));
        int nbAccount = Integer.parseInt(request.getParameter("nbAccount"));

        for (int i = 0; i < nbAccount; i++) {
            String username;
            String password;
            do {
                username = new RandomAlphaNum(10).nextString();
                password = new RandomAlphaNum(10).nextString();
            } while (accountDao.findByUsername(username) != null);
            accountDao.addAccount(new AccountManager(username, password, coOwnership));
        }
        return new ModelAndView("redirect:/trust/co_ownership/all");
    }
    /**************************************************************************/
    /*****************FIN DES PAGES DE GESTION DE CO-OWNERSHIPS****************/
    /**************************************************************************/
    
    /**************************************************************************/
    /**************************DEBUT DES PAGES MESSAGE*************************/
    /**************************************************************************/ 
    
    @RequestMapping(value = {"/trust/message"}, method = RequestMethod.GET)
    public ModelAndView MessagePage() {
        return getMinModel(getAccount(), "message");
    }
    
    @RequestMapping(value = {"/trust/message/view/{someID}"}, method = RequestMethod.GET)
    public @ResponseBody ModelAndView MessageViewPage(@PathVariable(value="someID") int id) {
        AccountTrust account = getAccount();
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
    
    @RequestMapping(value = {"/trust/message/new"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView sendMessagePage(Message message, BindingResult result, HttpServletRequest request) {
        AccountTrust account = getAccount();

        if (request.getMethod() == "POST") {
            MessageFormValidato fv = new MessageFormValidato();
            fv.validate(message, result);
            
            if (result.hasErrors()) {
                Map<Integer, String> listAccount = new LinkedHashMap<Integer, String>();
                for (Account a : account.getTrust().getAccountTrusts()) {
                    listAccount.put(a.getId(), a.getFirstName()+ " " + a.getLastName());
                }
                for(CoOwnership co : account.getTrust().getCoOwnerships()){
                    for (Account a : co.getOwners()) {
                        listAccount.put(a.getId(), a.getFirstName()+ " " + a.getLastName());
                    }
                    for (Account a : co.getManagers()) {
                        listAccount.put(a.getId(), a.getFirstName()+ " " + a.getLastName());
                    }
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
                return new ModelAndView("redirect:/trust/message");
            }
        } 
        else {
            Map<Integer, String> listAccount = new LinkedHashMap<Integer, String>();
            for (Account a : account.getTrust().getAccountTrusts()) {
                listAccount.put(a.getId(), a.getFirstName()+ " " + a.getLastName());
            }
            for(CoOwnership co : account.getTrust().getCoOwnerships()){
                for (Account a : co.getOwners()) {
                    listAccount.put(a.getId(), a.getFirstName()+ " " + a.getLastName());
                }
                for (Account a : co.getManagers()) {
                    listAccount.put(a.getId(), a.getFirstName()+ " " + a.getLastName());
                }
            }
            ModelAndView model = getMinModel(account, "message_new");
            model.addObject("list", listAccount);
            model.addObject("message", message);
            return model;
        }
    }
    
     @RequestMapping(value = {"/trust/message/delete"}, method = RequestMethod.GET)
    public ModelAndView messageDeletePage() {
        return getMinModel(getAccount(), "message_delete");
    }
    
    @RequestMapping(value = {"/trust/message/delete/{someID}"}, method = RequestMethod.GET)
    public @ResponseBody
    ModelAndView messageDeletePage(@PathVariable(value = "someID") int id) {
        AccountTrust account = getAccount();
        Message m = messageDao.getById(id);

        if (m != null && !m.getSender().getUsername().equals(account.getUsername()) && !m.getRecipient().getUsername().equals(account.getUsername())) {
            return new ModelAndView("redirect:/404");
        }

        m.setStatus(MessageStatus.DELETE);
        messageDao.updateMessage(m);
        return new ModelAndView("redirect:/trust/message");
    }
    
    /**************************************************************************/
    /***************************FIN DES PAGES MESSAGE**************************/
    /**************************************************************************/

    /**************************************************************************/
    /***************************DEBUT DES PAGES RPOFIL*************************/
    /**************************************************************************/
    @RequestMapping(value = {"/trust/profil"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView profilPage(Account faccount, BindingResult result, HttpServletRequest request) {
        AccountTrust account = getAccount();

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
                
                return new ModelAndView("redirect:/trust/profil");
            }
        } else {
            ModelAndView model = getMinModel(account, "profil");
            model.addObject("faccount", account);
            return model;
        }
    }
    
        @RequestMapping(value = {"/trust/profil/image/"}, method = RequestMethod.GET)
    public ModelAndView profilUpdateImageViewpage(HttpServletRequest request) {
        AccountTrust account = getAccount();
        ModelAndView model = getMinModel(account, "profil_image");
        return model;
    }

    @RequestMapping(value = {"/trust/profil/image/upload"}, method = RequestMethod.POST)
    public ModelAndView profilImageUpload(HttpServletRequest request, @RequestParam CommonsMultipartFile[] fileUpload) throws Exception {
        if (fileUpload.length < 0) {
            return new ModelAndView("redirect:/trust/profil/image/");
        }

        AccountTrust a = (AccountTrust) accountDao.findByUsername(getAccount().getUsername());

        if (fileUpload != null && fileUpload.length > 0) {
            for (CommonsMultipartFile aFile : fileUpload) {
                if (!aFile.getOriginalFilename().equals("")) {
                    String[] s = aFile.getOriginalFilename().split(Pattern.quote("."));
                    aFile.transferTo(new File("E:/Users/Desktop/Projet/Syndico/src/main/webapp/resources/images/user/" + a.getId() + "." + s[1]));
                    a.setImage("." + s[1]);
                    accountDao.updateAccount(a);
                }
            }
        }

        return new ModelAndView("redirect:/trust/profil");
    }
    /**************************************************************************/
    /***************************FIN DES PAGES PROFIL***************************/
    /**************************************************************************/
   
    /**************************************************************************/
    /************************DEBUT DES PAGES PROFIL SYNDIC*********************/
    /**************************************************************************/
    @RequestMapping(value = {"/trust/syndic/profil"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView syndicProfilPage(Trust newTrust, BindingResult result, HttpServletRequest request) {
        AccountTrust account = getAccount();

        if (request.getMethod() == "POST") {
            TrustFormValidator fv = new TrustFormValidator();
            fv.validate(newTrust, result);

            if (result.hasErrors()) {
                ModelAndView model = getMinModel(account, "syndic_profil");
                model.addObject("errors", result);
                model.addObject("newTrust", newTrust);
                return model;
            } else {
                Trust t = trustDao.getByName(account.getTrust().getName());
                t.setName(newTrust.getName());
                t.setAddress(newTrust.getAddress());
                t.setDescription(newTrust.getDescription());
                t.setPhone(newTrust.getPhone());
                t.setEmail(newTrust.getEmail());
                t.setLegalInfomation(newTrust.getLegalInfomation());
                t.setWebsite(newTrust.getWebsite());
                t.setFax(newTrust.getFax());
                
                trustDao.updateTrust(t);
                
                return new ModelAndView("redirect:/trust/syndic/profil");
            }
        } else {
            ModelAndView model = getMinModel(account, "syndic_profil");
            model.addObject("newTrust", account.getTrust());
            return model;
        }
    }

            @RequestMapping(value = {"/trust/syndic/profil/image/"}, method = RequestMethod.GET)
    public ModelAndView syndicprofilUpdateImageViewpage(HttpServletRequest request) {
        AccountTrust account = getAccount();
        ModelAndView model = getMinModel(account, "syndic_profil_image");
        return model;
    }

    @RequestMapping(value = {"/trust/syndic/profil/image/upload"}, method = RequestMethod.POST)
    public ModelAndView syndicprofilImageUpload(HttpServletRequest request, @RequestParam CommonsMultipartFile[] fileUpload) throws Exception {
        if (fileUpload.length < 0) {
            return new ModelAndView("redirect:/trust/syndic/profil/image/");
        }

        AccountTrust a = (AccountTrust) accountDao.findByUsername(getAccount().getUsername());

        if (fileUpload != null && fileUpload.length > 0) {
            for (CommonsMultipartFile aFile : fileUpload) {
                if (!aFile.getOriginalFilename().equals("")) {
                    String[] s = aFile.getOriginalFilename().split(Pattern.quote("."));
                    aFile.transferTo(new File("E:/Users/Desktop/Projet/Syndico/src/main/webapp/resources/images/trust/" + a.getId() + "." + s[1]));
                    a.setImage("." + s[1]);
                    accountDao.updateAccount(a);
                }
            }
        }

        return new ModelAndView("redirect:/trust/syndic/profil/");
    }

    /**************************************************************************/
    /************************FIN DES PAGES PROFIL SYNDIC***********************/
    /**************************************************************************/
    
    @RequestMapping(value = {"/trust/news/add"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView addNewsPage(News news, BindingResult result, HttpServletRequest request) {
        AccountTrust account = getAccount();

        if (request.getMethod() == "POST") {
            NewsFormValidator fv = new NewsFormValidator();
            fv.validate(news, result);
            
            if (result.hasErrors()) {
                Map<Integer, String> listCoOwnership = new LinkedHashMap<Integer, String>();
                for (CoOwnership coOwnership : account.getTrust().getCoOwnerships()) {
                    listCoOwnership.put(coOwnership.getId(), coOwnership.getName());
                }     
                ModelAndView model = getMinModel(account, "news_add");
                model.addObject("errors", result);
                model.addObject("list", listCoOwnership);
                model.addObject("news", news);
                return model;
            } 
            else {
                news.setType(NewsType.ANNOUNCEMENT);
                news.setAccount(account);
                news.setImage("annonce.png");
                newsDao.addNews(news);
                return new ModelAndView("redirect:/trust/co_ownership/view/" + news.getCoOwnership().getId());
            }
        } 
        else {
            Map<Integer, String> listCoOwnership = new LinkedHashMap<Integer, String>();
                for (CoOwnership coOwnership : account.getTrust().getCoOwnerships()) {
                    listCoOwnership.put(coOwnership.getId(), coOwnership.getName());
                }     
                ModelAndView model = getMinModel(account, "news_add");
                model.addObject("list", listCoOwnership);
                model.addObject("news", news);
                return model;
        }
    }
    
    private CoOwnership isGranted(AccountTrust at, int id) {
        CoOwnership tmp = coOwnershipDao.getById(id);
        if (tmp == null || tmp.getTrust().getId() != at.getTrust().getId()) {
            return null;
        }
        return tmp;
    }
   
    private ModelAndView getMinModel(AccountTrust account){
        ModelAndView model = new ModelAndView();
        model.addObject("account", account);
        model.addObject("trust", account.getTrust());
        return model;
    }
    
    private ModelAndView getMinModel(AccountTrust account, String fileView){
        ModelAndView model = getMinModel(account);
        model.setViewName(this.pathView + fileView);
        return model;
   }
   
   private AccountTrust getAccount(){
       return (AccountTrust) accountDao.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
   } 
}
