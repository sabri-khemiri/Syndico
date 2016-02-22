package com.miaou.trust.form;


import com.miaou.trust.model.Trust;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author Sabri
 */
public class TrusteeFormValidator implements Validator{  
    
    @Override
    public boolean supports(Class<?> type) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void validate(Object o, Errors errors) {
        Trust t = (Trust) o;        
        if(t.getName() == null || t.getName().trim().length() == 0)
            errors.rejectValue("name", "name.required");
        if(t.getAddress() == null || t.getAddress().trim().length() == 0)
            errors.rejectValue("address", "address.required");
        if(t.getEmail() == null || t.getEmail().trim().length() == 0 || !FormPatrernValidator.emailIsValid(t.getEmail()))
            errors.rejectValue("email", "email.invalid");
    }
    
}
