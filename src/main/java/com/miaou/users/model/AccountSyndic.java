package com.miaou.users.model;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@DiscriminatorValue("SYNDIC")
@Table(name = "account_syndic", catalog = "test")
public class AccountSyndic extends Account {
    protected static final String ROLE = "ROLE_SYNDIC";
    
    public AccountSyndic(String username, String password){
        super(username, password);
    }
    
    @Transient
    public String getRoles(){
        return ROLE;
    }
}
