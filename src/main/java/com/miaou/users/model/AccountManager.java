package com.miaou.users.model;

import com.miaou.trust.model.CoOwnership;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@DiscriminatorValue("MANAGER")
@Table(name = "account_manager", catalog = "test")
public class AccountManager extends Account {
    protected static final String ROLE = "ROLE_MANAGER";
    
    private CoOwnership coOwnership;

    public AccountManager(){
        super();
    }
    
    public AccountManager(String username, String password){
        super(username, password);
    }
    
    public AccountManager(String username, String password, CoOwnership coOwnership){
        super(username, password);
        this.coOwnership = coOwnership;
    }
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "manager_co_ownership_id")  
    public CoOwnership getCoOwnership() {
        return coOwnership;
    }

    public void setCoOwnership(CoOwnership coOwnership) {
        this.coOwnership = coOwnership;
    }
    
    @Transient
    public String getRole(){
        return ROLE;
    }
}
