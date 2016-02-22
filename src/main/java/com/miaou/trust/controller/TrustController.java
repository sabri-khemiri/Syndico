package com.miaou.trust.controller;

import com.miaou.trust.dao.TrustDao;
import com.miaou.trust.form.TrusteeFormValidator;
import com.miaou.trust.model.Trust;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TrustController {
    
    @Autowired
    private TrustDao trustDao;
    
    @RequestMapping(value = {"/createTrust"}, method = RequestMethod.GET)
    public ModelAndView createTrusteePage() {
        ModelAndView model = new ModelAndView();
        Trust trust = new Trust();
        model.addObject("trust", trust);
        model.setViewName("trust/addTrust");
        return model;
    }

    @RequestMapping(value = {"/subCreateTrust"}, method = RequestMethod.POST)
    public ModelAndView subCreateTrust(Trust t, BindingResult result) {
        ModelAndView model = new ModelAndView();
        TrusteeFormValidator fv = new TrusteeFormValidator();
        fv.validate(t, result);

        if (result.hasErrors()) {
            model.addObject("errors", result.getAllErrors().toString());
            model.addObject("trust", t);
            model.setViewName("trust/addTrust");
        } else {
            trustDao.add(t);
            model.setViewName("hello");
        }

        return model;
    }
}
