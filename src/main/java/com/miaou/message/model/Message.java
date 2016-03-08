package com.miaou.message.model;

import com.miaou.users.model.Account;
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
@Table(name = "message", catalog = "test")
public class Message implements Serializable {
    protected int id;
    protected String subject;
    protected String contents;
    protected Date creationDate;
    protected MessageStatus status;
    
    private Account sender;
    private Account recipient;
    
    public Message() {
        this.creationDate = new Date();
    }

    public Message(String subject, String contents) {
        this();
        this.subject = subject;
        this.contents = contents;
    }
    
     public Message(String subject, String contents, MessageStatus status) {
        this(subject, contents);
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

    @Column(name = "contents", length = 250)
    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
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

    @Column(name = "message_status")
    public MessageStatus getStatus() {
        return status;
    }

    public void setStatus(MessageStatus status) {
        this.status = status;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "account_id")
    public Account getSender() {
        return sender;
    }

    public void setSender(Account sender) {
        this.sender = sender;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "account_id")
    public Account getRecipient() {
        return recipient;
    }

    public void setRecipient(Account recipient) {
        this.recipient = recipient;
    }
    
    
    
}
