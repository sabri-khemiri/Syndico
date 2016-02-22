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
@DiscriminatorValue("OWNER")
@Table(name = "account_owner", catalog = "test")
public class AccountOwner extends Account {
    protected static final String ROLE = "ROLE_OWNER";
    private CoOwnership coOwnership;
    
    public AccountOwner(){
    }
    
    public AccountOwner(String username, String password){
        super(username, password);
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "co_ownership_id")
    public CoOwnership getCoOwnership() {
        return coOwnership;
    }

    public void setCoOwnership(CoOwnership coOwnership) {
        this.coOwnership = coOwnership;
    }
    
    
        
    @Transient
    public String getRoles(){
        return ROLE;
    }
}
