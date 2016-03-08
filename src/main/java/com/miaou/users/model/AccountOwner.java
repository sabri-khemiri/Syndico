package com.miaou.users.model;

import com.miaou.meeting.model.Resolution;
import com.miaou.trust.model.CoOwnership;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@DiscriminatorValue("OWNER")
@Table(name = "account_owner", catalog = "test")
public class AccountOwner extends Account {
    protected static final String ROLE = "ROLE_OWNER";
    
    private String flatNumber;
    
    private CoOwnership coOwnership;
    private Set<Resolution> resolutions = new HashSet<Resolution>();
    
    public AccountOwner(){
        super();
    }
    
    public AccountOwner(String username, String password){
        super(username, password);
    }
    
    public AccountOwner(String username, String password, CoOwnership coOwnership){
        super(username, password);
        this.coOwnership = coOwnership;
    }

    @Column(name = "owner_flat_number")
    public String getFlatNumber() {
        return flatNumber;
    }

    public void setFlatNumber(String flatNumber) {
        this.flatNumber = flatNumber;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "owner_co_ownership_id1")  
    public CoOwnership getCoOwnership() {
        return coOwnership;
    }

    public void setCoOwnership(CoOwnership coOwnership) {
        this.coOwnership = coOwnership;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "owner")
    public Set<Resolution> getResolutions() {
        return resolutions;
    }

    public void setResolutions(Set<Resolution> resolutions) {
        this.resolutions = resolutions;
    }
        
    public void addResolution(Resolution r) {
        this.resolutions.add(r);
    }
    
    public void removeResolution(Resolution r) {
        this.resolutions.remove(r);
    }
    
    @Transient
    public String getRole(){
        return ROLE;
    }
}
