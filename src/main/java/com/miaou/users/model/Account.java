package com.miaou.users.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "role")
@Table(name = "account", catalog = "test")
public class Account implements Serializable {
    protected static final String ROLE = "ROLE_ACCOUNT";

    protected int id;
    protected String username;
    protected String password;
    protected boolean enabled = true;
    
    protected String email;
    protected String firstName;
    protected String lastName;
    protected Date creationDate;
    protected String image;
    

    public Account() {
        this.creationDate = new Date();
    }

    public Account(String username, String password) {
        this();
        this.username = username;
        this.password = password;
    }
    
     public Account(String username, String password, boolean enabled) {
        this(username, password);
        this.enabled = enabled;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getID() {
        return this.id;
    }

    public void setID(int id) {
        this.id = id;
    }

    @Column(name = "username", unique = true, nullable = false, length = 45)
    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Column(name = "password", nullable = false)
    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name = "enabled", nullable = false)
    public boolean getEnabled() {
        return this.enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
   
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column(name = "first_name")
    public String getFirstname() {
        return firstName;
    }

    public void setFirstname(String firstName) {
        this.firstName = firstName;
    }

    @Column(name = "last_name")
    public String getLastname() {
        return lastName;
    }

    public void setLastname(String lastName) {
        this.lastName = lastName;
    }

    @Column(name = "creation_date")
    public Date getDateCreation() {
        return creationDate;
    }

    public void setDateCreation(Date creationDate) {
        this.creationDate = creationDate;
    }
    
    @Column(name = "image")
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    @Transient
    public String getRoles(){
        return ROLE;
    }
}
