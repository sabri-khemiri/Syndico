package com.miaou.trust.controller;

import com.miaou.trust.dao.CoOwnershipDao;
import com.miaou.trust.dao.TrustDao;
import com.miaou.trust.form.CoOwnershipFormValidator;
import com.miaou.trust.model.CoOwnership;
import com.miaou.users.dao.AccountDao;
import com.miaou.users.model.AccountTrust;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TrustController {
    
    @Autowired
    private TrustDao trustDao;
    
    @Autowired
    private AccountDao accountDao;
    
    @Autowired
    private CoOwnershipDao coOwnershipDao;
    
    @RequestMapping(value = {"/trust**"}, method = RequestMethod.GET)
    public ModelAndView homeTrustPage() {
        ModelAndView model = new ModelAndView();
        AccountTrust at = (AccountTrust)accountDao.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        model.addObject("account", at);
        model.addObject("trust", at.getTrust());
        model.setViewName("trust/home");
        return model;
    }
    
    @RequestMapping(value = {"/trust/co_ownership**"}, method = RequestMethod.GET)
    public ModelAndView coOwnershipViewPage() {
        ModelAndView model = new ModelAndView();
        AccountTrust at = (AccountTrust)accountDao.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        model.addObject("account", at);
        model.addObject("trust", at.getTrust());
        model.setViewName("trust/co_ownership");
        return model;
    }
    
    @RequestMapping(value = {"/trust/add_co_ownership**"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView addCoOwnershipPage(CoOwnership coOwnership, BindingResult result, HttpServletRequest request) {
        AccountTrust at = (AccountTrust)accountDao.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        System.err.println("request.getMethod() " + request.getMethod());
        if(request.getMethod() == "POST"){
            CoOwnershipFormValidator fv = new CoOwnershipFormValidator();
            fv.validate(coOwnership, result);

            if (result.hasErrors()) {
                System.err.println("toto " + result.hasFieldErrors("name"));
                ModelAndView model = new ModelAndView();
                model.addObject("trust", at.getTrust());
                model.addObject("errors", result);
                model.addObject("coOwnership", coOwnership);
                model.setViewName("trust/add_co_ownership");
                return model;
            }
            else{
                coOwnership.setTrust(at.getTrust());
                coOwnershipDao.addCoOwnership(coOwnership);
                return new ModelAndView("redirect:/trust/co_ownership");
            }
        }
        else{
            ModelAndView model = new ModelAndView();
            coOwnership  = new CoOwnership();
            coOwnership.setTrust(at.getTrust());
            model.addObject("trust", at.getTrust());
            model.addObject("coOwnership", coOwnership);
            model.setViewName("trust/add_co_ownership");
            return model;
        }
    }

}
