package com.miaou.users.model;

import com.miaou.trust.model.Trust;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@DiscriminatorValue("SYNDIC")
@Table(name = "account_syndic", catalog = "test")
public class AccountTrust extends Account {
    protected static final String ROLE = "ROLE_SYNDIC";
    
    private Trust trust;
    
    public AccountTrust(String username, String password){
        super(username, password);
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "trust_id")
    public Trust getTrust() {
        return trust;
    }

    public void setTrust(Trust trust) {
        this.trust = trust;
    }
    
    @Transient
    public String getRoles(){
        return ROLE;
    }

}