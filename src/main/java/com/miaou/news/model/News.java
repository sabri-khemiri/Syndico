package com.miaou.news.model;

import com.miaou.trust.model.CoOwnership;
import com.miaou.users.model.Account;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "news", catalog = "test")
public class News implements Serializable {
    
    protected int id;
    protected String title;
    protected String contents;
    protected String image;
    protected Date creationDate;
    
    private Account account;
    private CoOwnership coOwnership;
    private NewsType type;
    private Set<NewComment> comments = new HashSet<NewComment>();
   
    public News() {
        this.creationDate = new Date();
    }

    public News(String title, String contents) {
        this();
        this.title = title;
        this.contents = contents;
    }
    
     public News(String title, String contents, String image) {
        this(title, contents);
        this.image = image;
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

    @Column(name = "contents", nullable = false, length = 1000)
    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    @Column(name = "image")
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Column(name = "creation_date", nullable = false)
    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "account_id")
    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "co_ownership_id")
    public CoOwnership getCoOwnership() {
        return coOwnership;
    }

    public void setCoOwnership(CoOwnership coOwnership) {
        this.coOwnership = coOwnership;
    }

    @Enumerated(EnumType.STRING)
    public NewsType getType() {
        return type;
    }

    public void setType(NewsType type) {
        this.type = type;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "news")
    public Set<NewComment> getComments() {
        return comments;
    }

    public void setComments(Set<NewComment> comments) {
        this.comments = comments;
    }
    
    public void addComments(NewComment c) {
        this.comments.add(c);
    }
    
    public void removeComments(NewComment c) {
        this.comments.remove(c);
    }

    

}
