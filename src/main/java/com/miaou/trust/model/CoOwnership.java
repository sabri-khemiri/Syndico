package com.miaou.trust.model;

import com.miaou.meeting.model.Meeting;
import com.miaou.news.model.News;
import com.miaou.users.model.AccountManager;
import com.miaou.users.model.AccountOwner;
import com.miaou.works.model.Works;
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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

@Entity
@Table(name = "co_ownership", catalog = "test")
public class CoOwnership implements Serializable {
    private int id;
    private String name;
    private String address;
    private Date creationDate;
    private String description;
    private String image;

    private Trust trust;
    private Set<AccountOwner> owners = new HashSet<AccountOwner>();
    private Set<AccountManager> managers = new HashSet<AccountManager>();
    private Set<Meeting> meetings = new HashSet<Meeting>();
    private Set<Works> works = new HashSet<Works>();
    private Set<News> news = new HashSet<News>();


    public CoOwnership() {
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
    
    @Column(name = "name", nullable = false)
    public String getName() {
        return name;    
    }
    
    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "address", nullable = false)
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

    @Column(name = "image")
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "trust_id")
    public Trust getTrust() {
        return trust;
    }

    public void setTrust(Trust trust) {
        this.trust = trust;
    }
    
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "coOwnership")
    public Set<AccountOwner> getOwners() {
        return owners;
    }

    public void setOwners(Set<AccountOwner> owners) {
        this.owners = owners;
    }

    public void addOwner(AccountOwner a) {
        this.owners.add(a);
    }
    
    public void removeOwner(AccountOwner a) {
        this.owners.remove(a);
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "coOwnership")
    public Set<AccountManager> getManagers() {
        return managers;
    }

    public void setManagers(Set<AccountManager> managers) {
        this.managers = managers;
    }

    public void addManager(AccountManager a) {
        this.managers.add(a);
    }

    public void removeManager(AccountManager a) {
        this.managers.remove(a);
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "coOwnership")
    public Set<Meeting> getMeetings() {
        return meetings;
    }

    public void setMeetings(Set<Meeting> meetings) {
        this.meetings = meetings;
    }
    
    public void addMeeting(Meeting m) {
        this.meetings.add(m);
    }
    
    public void removeMeeting(Meeting m) {
        this.meetings.remove(m);
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "coOwnership")
    public Set<Works> getWorks() {
        return works;
    }

    public void setWorks(Set<Works> works) {
        this.works = works;
    }
    
    public void addWorks(Works w) {
        this.works.add(w);
    }
    
    public void removeWorks(Works w) {
        this.works.remove(w);
    }
    
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "coOwnership")
    @OrderBy("creationDate DESC")
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
}
