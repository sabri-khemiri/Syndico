package com.miaou.works.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@DiscriminatorValue("MAJOR")
@Table(name = "works_major", catalog = "test")
public class WorksMajor extends Works {
    protected static final String ROLE = "ROLE_MAJOR";

    private Set<WorksQuotation> worksQuotations = new HashSet<WorksQuotation>();
    
    
    public WorksMajor(String title, String contents){
        super(title, contents);
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "worksMajors")
    public Set<WorksQuotation> getWorksQuotations() {
        return worksQuotations;
    }

    public void setWorksQuotations(Set<WorksQuotation> worksQuotations) {
        this.worksQuotations = worksQuotations;
    }
    
    @Transient
    public String getRoles(){
        return ROLE;
    }

    
}

