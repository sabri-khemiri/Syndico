package com.miaou.trust.model;

import com.miaou.users.model.AccountTrust;
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
@Table(name = "trust", catalog = "test")
public class Trust implements Serializable {

    private int id;
    private String name;
    private String address;
    private String email;
    private String phone;
    private String fax;
    private String website;
    private String legalInfomation;
    private Date creationDate;
    private String description;
    private String image;
    
    private Set<AccountTrust> accountTrusts = new HashSet<AccountTrust>();
    private Set<CoOwnership> coOwnerships = new HashSet<CoOwnership>();

    public Trust() {
        creationDate = new Date();
    }

    public Trust(String name, String email) {
        this();
        this.name = name;
        this.email = email;
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

    @Column(name = "email", unique = true, nullable = false)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column(name = "phone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Column(name = "fax")
    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    @Column(name = "website")
    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    @Column(name = "legal_information")
    public String getLegalInfomation() {
        return legalInfomation;
    }

    public void setLegalInfomation(String legalInfomation) {
        this.legalInfomation = legalInfomation;
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

    @Column(name = "image")
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "trust")
    public Set<AccountTrust> getAccountTrusts() {
        return accountTrusts;
    }

    public void setAccountTrusts(Set<AccountTrust> accountTrusts) {
        this.accountTrusts = accountTrusts;
    }
    
    public void addAccountTrust(AccountTrust a) {
        this.accountTrusts.add(a);
    }
    
    public void removeAccountTrusts(AccountTrust a) {
        this.accountTrusts.remove(a);
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "trust")
    public Set<CoOwnership> getCoOwnerships() {
        return coOwnerships;
    }

    public void setCoOwnerships(Set<CoOwnership> coOwnerships) {
        this.coOwnerships = coOwnerships;
    }

    public void addCoOwnership(CoOwnership c) {
        this.coOwnerships.add(c);
    }
    
    public void removeCoOwnership(CoOwnership c) {
        this.coOwnerships.remove(c);
    }

}
