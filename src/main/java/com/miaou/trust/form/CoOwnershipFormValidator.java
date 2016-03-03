package com.miaou.trust.form;


import com.miaou.trust.model.CoOwnership;
import com.miaou.trust.model.Trust;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author Sabri
 */
public class CoOwnershipFormValidator implements Validator{  
    
    @Override
    public boolean supports(Class<?> type) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void validate(Object o, Errors errors) {
        CoOwnership c = (CoOwnership) o;        
        if(c.getName() == null || c.getName().trim().length() == 0)
            errors.rejectValue("name", "name.required");
        if(c.getAddress() == null || c.getAddress().trim().length() == 0)
            errors.rejectValue("address", "address.required");
    }
    
}
