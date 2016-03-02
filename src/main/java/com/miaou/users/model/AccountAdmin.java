package com.miaou.users.model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@DiscriminatorValue("ADMIN")
@Table(name = "account_admin", catalog = "test")
public class AccountAdmin extends Account {
    protected static final String ROLE = "ROLE_ADMIN";

    public AccountAdmin(){
        super();
    }
    
    public AccountAdmin(String username, String password){
        super(username, password);
    }
    
    @Transient
    public String getRoles(){
        return ROLE;
    }
}
