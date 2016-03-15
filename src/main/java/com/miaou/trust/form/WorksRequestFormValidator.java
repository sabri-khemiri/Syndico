package com.miaou.trust.form;


import com.miaou.trust.model.CoOwnership;
import com.miaou.trust.model.Trust;
import com.miaou.works.model.WorksRequest;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author Sabri
 */
public class WorksRequestFormValidator implements Validator{  
    
    @Override
    public boolean supports(Class<?> type) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void validate(Object o, Errors errors) {
        WorksRequest wr = (WorksRequest) o;        
        if(wr.getContents()== null || wr.getContents().trim().length() == 0)
            errors.rejectValue("name", "name.required");
        if(wr.getTitle() == null || wr.getTitle().trim().length() == 0)
            errors.rejectValue("address", "address.required");
    }
    
}
