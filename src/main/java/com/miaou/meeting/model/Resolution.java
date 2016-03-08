package com.miaou.meeting.model;

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
import javax.persistence.Table;


@Entity
@Table(name = "resolution", catalog = "test")
public class Resolution implements Serializable {
    private int id;
    private String title;
    private String contents;
    private Date creationDate;

    private AccountOwner owner;
    private Meeting meeting;
    
    public Resolution() {
        creationDate = new Date();
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "title", nullable = false)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(name = "contents")
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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "account_owner_id")
    public AccountOwner getOwner() {
        return owner;
    }

    public void setOwner(AccountOwner owner) {
        this.owner = owner;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "meeting_id")
    public Meeting getMeeting() {
        return meeting;
    }

    public void setMeeting(Meeting meeting) {
        this.meeting = meeting;
    }
    
}
