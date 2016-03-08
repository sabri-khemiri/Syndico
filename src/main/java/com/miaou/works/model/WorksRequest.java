package com.miaou.works.model;

import com.miaou.users.model.AccountOwner;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "works_request", catalog = "test")
public class WorksRequest implements Serializable {

    private int id;
    private String title;
    private String contents;
    private Date creationDate;
    private String status;
    
    private AccountOwner owner;
    private Works works;

    public WorksRequest() {
        this.creationDate = new Date();
    }

    public WorksRequest(String title, String contents) {
        this();
        this.title = title;
        this.contents = contents;
    }
    
     public WorksRequest(String title, String contents, String status) {
        this(title, contents);
        this.status = status;
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    @Column(name = "title", nullable = false, length = 250)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(name = "contents", length = 1000)
    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    @Column(name = "creation_date", nullable = false)
    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    @Column(name = "status", nullable = false)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "account_owner_id")
    public AccountOwner getOwner() {
        return owner;
    }

    public void setOwner(AccountOwner owner) {
        this.owner = owner;
    }

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "works_id")
    public Works getWorks() {
        return works;
    }

    public void setWorks(Works works) {
        this.works = works;
    }

    
    
}
