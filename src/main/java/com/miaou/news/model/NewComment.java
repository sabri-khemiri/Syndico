package com.miaou.news.model;

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
@Table(name = "new_comment", catalog = "test")
public class NewComment implements Serializable {
    private int id;
    private String contents;
    private Date creationDate;
    
    private News news;
    
    public NewComment() {
        creationDate = new Date();
    }
    
    public NewComment(String contents) {
        this();
        this.contents = contents;
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "news_id")
    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }
    
    
    
    
}
