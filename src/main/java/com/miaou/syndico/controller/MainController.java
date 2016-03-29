package com.miaou.syndico.controller;

import com.miaou.trust.model.CoOwnership;
import com.miaou.users.dao.AccountDao;
import com.miaou.users.model.Account;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
    @Autowired
    private AccountDao accountDao;

    @RequestMapping(value = {"/", "/welcome**"}, method = RequestMethod.GET)
    public ModelAndView defaultPage() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            String role = auth.getAuthorities().toArray()[0].toString();
            if(role.equals("ROLE_TRUST"))
                return new ModelAndView("redirect:trust");
            else if(role.equals("ROLE_MANAGER"))
                return new ModelAndView("redirect:manager");
            else
                return new ModelAndView("redirect:owner");
        } else {
            return new ModelAndView("redirect:login");
        }
    }
    
     @RequestMapping(value = {"/firstConnectionPage"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView firstConnectionPage(HttpServletRequest request) {
        Account faccount = new Account();
        faccount.setUsername(request.getParameter("username"));
        faccount.setPassword(request.getParameter("password"));

        
        Account account = accountDao.findByUsername(faccount.getUsername());

        if(request.getMethod() != "POST"){
           ModelAndView model = new ModelAndView();
           model.addObject("account", faccount); 
           model.setViewName("users/first");
           return model;
        }
        else{
            ArrayList<String> errors = new ArrayList<String>();
            
            if(account == null || account.getEnabled() == true || !(account.getUsername().equals(faccount.getUsername()) && account.getPassword().equals(faccount.getPassword())))
                errors.add("username_password");
            if(request.getParameter("newUsername") == null || request.getParameter("newUsername").trim() == "")
                errors.add("newUsername");
            if(request.getParameter("newPassword") == null || request.getParameter("newPassword").trim() == "")
                errors.add("password");
            if(request.getParameter("email") == null || request.getParameter("email").trim() == "")
                errors.add("email");
            if(request.getParameter("firstName") == null || request.getParameter("firstName").trim() == "")
                errors.add("firstName");
            if(request.getParameter("lastName") == null || request.getParameter("lastName").trim() == "")
                errors.add("email");
            
            if(!errors.isEmpty()){
                ModelAndView model = new ModelAndView();
                model.addObject("account", faccount); 
                model.addObject("errors", errors); 
                model.setViewName("users/first");
                return model;
            }
            else{
                account.setUsername(request.getParameter("newUsername"));
                account.setPassword(request.getParameter("newPassword"));
                account.setEmail(request.getParameter("email"));
                account.setFirstName(request.getParameter("firstName"));
                account.setLastName(request.getParameter("lastName"));
                account.setEnabled(true);
                accountDao.updateAccount(account);
            }
        }
         
        return new ModelAndView("redirect:/login");  
    }
}
