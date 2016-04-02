/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miaou.trust.form;

import com.miaou.meeting.model.Meeting;
import com.miaou.trust.model.CoOwnership;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author Sabri
 */
public class MeetingCloseFormValidator implements Validator{  
    
    @Override
    public boolean supports(Class<?> type) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void validate(Object o, Errors errors) {
        Meeting m = (Meeting) o;        
        if(m.getReport()== null || m.getReport().trim().length() == 0)
            errors.rejectValue("report", "report.required");
    }
    
}

