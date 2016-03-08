package com.miaou.works.model;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@DiscriminatorValue("SMALL")
@Table(name = "works_small", catalog = "test")
public class WorksSmall extends Works {
    protected static final String ROLE = "ROLE_SMALL";
    
    private int cost; 
    
    public WorksSmall(){
        super();
    }

    public WorksSmall(String title, String contents){
        super(title, contents);
    }

    @Column(name = "cost")
    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }
    
    @Transient
    public String getRoles(){
        return ROLE;
    }
}
