package com.miaou.trust.form;


import com.miaou.trust.model.CoOwnership;
import com.miaou.news.model.News;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author Sabri
 */
public class NewsFormValidator implements Validator{  
    
    @Override
    public boolean supports(Class<?> type) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void validate(Object o, Errors errors) {
        News n = (News) o;        
        if(n.getTitle()== null || n.getTitle().trim().length() == 0)
            errors.rejectValue("name", "name.required");
        if(n.getContents()== null || n.getContents().trim().length() == 0)
            errors.rejectValue("address", "address.required");
    }
    
}
