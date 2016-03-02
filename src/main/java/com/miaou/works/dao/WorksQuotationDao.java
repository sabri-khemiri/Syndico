package com.miaou.works.dao;

import com.miaou.works.dao.*;
import com.miaou.works.model.WorksQuotation;
import java.util.List;


public interface WorksQuotationDao {
    public List<WorksQuotation> getAll();
    public void addWorksQuotation(WorksQuotation worksQuotation);
    public void removeWorksQuotation(WorksQuotation worksQuotation);
    public void updateWorksQuotation(WorksQuotation worksQuotation);
    

}
