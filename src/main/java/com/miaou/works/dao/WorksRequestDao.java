package com.miaou.works.dao;

import com.miaou.users.model.AccountOwner;
import com.miaou.works.dao.*;
import com.miaou.works.model.WorksRequest;
import java.util.List;


public interface WorksRequestDao {
    public List<WorksRequest> getAll();
    public List<WorksRequest> getByAccountOwner(AccountOwner accountOwner);
    public void addWorksRequest(WorksRequest worksRequest);
    public void removeWorksRequest(WorksRequest worksRequest);
    public void updateWorksRequest(WorksRequest worksRequest);
    

}