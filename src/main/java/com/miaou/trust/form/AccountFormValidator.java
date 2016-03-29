package com.miaou.trust.form;


import com.miaou.trust.model.CoOwnership;
import com.miaou.news.model.News;
import com.miaou.users.model.Account;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author Sabri
 */
public class AccountFormValidator implements Validator{  
    
    @Override
    public boolean supports(Class<?> type) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void validate(Object o, Errors errors) {
        Account a = (Account) o;        
        if(a.getLastName()== null || a.getLastName().trim().length() == 0)
            errors.rejectValue("lastName", "lastName.required");
        if(a.getFirstName()== null || a.getFirstName().trim().length() == 0)
            errors.rejectValue("fistName", "fistName.required");
        if(a.getEmail()== null || a.getEmail().trim().length() == 0)
            errors.rejectValue("email", "email.required");
    }
    
}
