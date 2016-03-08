package com.miaou.works.model;

import com.miaou.trust.model.CoOwnership;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "role")
@Table(name = "works", catalog = "test")
public class Works implements Serializable {
    protected static final String ROLE = "ROLE_WORKS";
    
    protected int id;
    protected String title;
    protected String contents;
    protected Date startDate;
    protected Date endDate;
    protected Date creationDate;
    
    private CoOwnership coOwnership;
    private WorksRequest worksRequest;

    public Works() {
        this.creationDate = new Date();
    }

    public Works(String title, String contents) {
        this();
        this.title = title;
        this.contents = contents;
    }
    
     public Works(String title, String contents, Date endDate, Date startDate) {
        this(title, contents);
        this.endDate = endDate;
        this.startDate = startDate;
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

    @Column(name = "start_date", nullable = false)
    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    @Column(name = "end_date")
    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @Column(name = "creation_date", nullable = false)
    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "co_ownership_id")
    public CoOwnership getCoOwnership() {
        return coOwnership;
    }

    public void setCoOwnership(CoOwnership coOwnership) {
        this.coOwnership = coOwnership;
    }

    @OneToOne(mappedBy = "works")
    public WorksRequest getWorksRequest() {
        return worksRequest;
    }

    public void setWorksRequest(WorksRequest worksRequest) {
        this.worksRequest = worksRequest;
    }
    
    @Transient
    public String getRoles(){
        return ROLE;
    }
    
    
}
