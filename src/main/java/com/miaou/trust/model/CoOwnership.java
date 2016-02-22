package com.miaou.trust.model;

import com.miaou.users.model.AccountOwner;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "co_ownership", catalog = "test")
public class CoOwnership implements Serializable {

    private int id;
    private String name;
    private String address;
    private Date creationDate;
    private String description;
    
    private Set<AccountOwner> owners = new HashSet<AccountOwner>();

    public CoOwnership() {
        this.creationDate = new Date();
    }

    public CoOwnership(String name, String address) {
        this();
        this.name = name;
        this.address = address;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getID() {
        return this.id;

    }

    public void setID(int id) {
        this.id = id;

    }
    
    @Column(name = "name", unique = true, nullable = false)
    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "adresse")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Column(name = "creation_date", nullable = false)
    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "coOwnership")
    public Set<AccountOwner> getOwners() {
        return owners;
    }

    public void setOwners(Set<AccountOwner> owners) {
        this.owners = owners;
    }

    

}
