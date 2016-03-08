package com.miaou.meeting.model;

import com.miaou.trust.model.CoOwnership;
import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.Set;
import java.util.HashSet;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;


@Entity
@Table(name = "meeting", catalog = "test")
public class Meeting implements Serializable {
    private int id;
    private String contents;
    private Date creationDate;
    private Date meetingDate;
    private String meetingHours;
    private String report;

    private CoOwnership coOwnership;
    private Set<Resolution> resolutions = new HashSet<Resolution>();
    
    public Meeting() {
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

    @Column(name = "meeting_date", nullable = false)
    public Date getMeetingDate() {
        return meetingDate;
    }

    public void setMeetingDate(Date meetingDate) {
        this.meetingDate = meetingDate;
    }

    @Column(name = "meeting_hours", nullable = false)
    public String getMeetingHours() {
        return meetingHours;
    }

    public void setMeetingHours(String meetingHours) {
        this.meetingHours = meetingHours;
    }
    
    

    @Column(name = "report")
    public String getReport() {
        return report;
    }

    public void setReport(String report) {
        this.report = report;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "co_ownership_id")
    public CoOwnership getCoOwnership() {
        return coOwnership;
    }

    public void setCoOwnership(CoOwnership coOwnership) {
        this.coOwnership = coOwnership;
    }
    
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "meeting")
    public Set<Resolution> getResolutions() {
        return resolutions;
    }

    public void setResolutions(Set<Resolution> resolutions) {
        this.resolutions = resolutions;
    }

    public void addResolution(Resolution r) {
        this.resolutions.add(r);
    }
    
    public void removeResolution(Resolution r) {
        this.resolutions.remove(r);
    }
    
    

}
