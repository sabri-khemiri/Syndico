package com.miaou.users.model;

import com.miaou.message.model.Message;
import com.miaou.news.model.News;
import com.miaou.news.model.NewComment;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "role")
@DiscriminatorValue("ACCOUNT")
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
    
    private Set<News> news = new HashSet<News>();
    private Set<NewComment> newComments = new HashSet<NewComment>();
    private Set<Message> messageSend = new HashSet<Message>();
    private Set<Message> messageReceived = new HashSet<Message>();
    

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
    public int getId() {
        return this.id;
    }

    public void setId(int id) {
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
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Column(name = "last_name")
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Column(name = "creation_date")
    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }
    
    @Column(name = "image")
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "account")
    public Set<News> getNews() {
        return news;
    }

    public void setNews(Set<News> news) {
        this.news = news;
    }
    
    public void addNews(News n) {
        this.news.add(n);
    }
    
    public void removeNews(News n) {
        this.news.remove(n);
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "sender")
    public Set<Message> getMessageSend() {
        return messageSend;
    }

    public void setMessageSend(Set<Message> messageSend) {
        this.messageSend = messageSend;
    }
    
    public void addMessageSend(Message m) {
        this.messageSend.add(m);
    }
    
    public void removeMessageSend(Message m) {
        this.messageSend.remove(m);
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "recipient")
    public Set<Message> getMessageReceived() {
        return messageReceived;
    }

    public void setMessageReceived(Set<Message> messageReceived) {
        this.messageReceived = messageReceived;
    }
    
    public void addMessageReceived(Message m) {
        this.messageReceived.add(m);
    }
    
    public void removeMessageReceived(Message m) {
        this.messageReceived.remove(m);
    }
    
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "author")
    public Set<NewComment> getNewComments() {
        return newComments;
    }

    public void setNewComments(Set<NewComment> newComments) {
        this.newComments = newComments;
    }
    
    public void addNewComments(NewComment n) {
        this.newComments.add(n);
    }
    
    public void removeNewComments(NewComment n) {
        this.newComments.remove(n);
    }
    
    @Transient
    public String getRole(){
        return ROLE;
    }
}
