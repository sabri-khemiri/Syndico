package com.miaou.users.model;

 import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@DiscriminatorValue("MANAGER")
@Table(name = "account_manager", catalog = "test")
public class AccountManager extends Account {
    protected static final String ROLE = "ROLE_MANAGER";

    public AccountManager(String username, String password){
        super(username, password);
    }
    
    @Transient
    public String getRoles(){
        return ROLE;
    }
}
