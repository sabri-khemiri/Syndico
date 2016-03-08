package com.miaou.works.model;

import java.io.Serializable;
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
@Table(name = "works_quotation", catalog = "test")
public class WorksQuotation implements Serializable {

    private int id;
    private String companyName;
    private String cost;
    private String contents;
    private String file;
    
    private WorksMajor worksMajors;

    public WorksQuotation() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "company_name")
    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    @Column(name = "cost")
    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    @Column(name = "contents")
    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }
    
    @Column(name = "file")
    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "works_major_id")
    public WorksMajor getWorksMajors() {
        return worksMajors;
    }

    public void setWorksMajors(WorksMajor worksMajors) {
        this.worksMajors = worksMajors;
    }
    
    
}
