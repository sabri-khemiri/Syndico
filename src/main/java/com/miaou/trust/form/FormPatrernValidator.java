package com.miaou.trust.form;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class FormPatrernValidator {
    private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";  
    private static final String MOBILE_PATTERN = "[0-9]{10}";  
    
    public static boolean emailIsValid(String v){
        return isValid(EMAIL_PATTERN, v);
    }
    
    public static boolean phoneIsValid(String v){
        return isValid(MOBILE_PATTERN, v);
    }
    
    private static boolean isValid(String c, String v){
        Pattern pattern = Pattern.compile(c);  
        Matcher matcher = pattern.matcher(v);  
        return matcher.matches();
    }
    
}
