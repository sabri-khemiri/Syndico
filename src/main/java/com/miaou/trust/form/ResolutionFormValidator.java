/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miaou.trust.form;

import com.miaou.meeting.model.Meeting;
import com.miaou.meeting.model.Resolution;
import com.miaou.trust.model.CoOwnership;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author Sabri
 */
public class ResolutionFormValidator implements Validator{  
    
    @Override
    public boolean supports(Class<?> type) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void validate(Object o, Errors errors) {
        Resolution m = (Resolution) o;        
        if(m.getTitle()== null || m.getTitle().trim().length() == 0)
            errors.rejectValue("title", "title.required");
        if(m.getContents()== null || m.getContents().trim().length() == 0)
            errors.rejectValue("content", "content.required");
    }
    
}

