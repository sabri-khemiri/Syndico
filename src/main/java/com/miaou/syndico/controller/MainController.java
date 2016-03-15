package com.miaou.syndico.controller;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

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
}
