package com.miaou.works.dao;

import com.miaou.news.model.News;
import com.miaou.users.dao.*;
import com.miaou.users.model.AccountOwner;
import com.miaou.works.model.WorksRequest;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class WorksRequestDaoImpl implements WorksRequestDao {

    @Autowired
    private SessionFactory sessionFactory;

    public WorksRequestDaoImpl() {
    }

    public WorksRequestDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public List<WorksRequest> getAll() {       
        return sessionFactory.getCurrentSession().createQuery("from WorksRequest").list();
    }
    
    @Override
    @Transactional
    public WorksRequest getById(int id) {
        List<WorksRequest> worksRequest = new ArrayList<WorksRequest>();
        worksRequest = sessionFactory.getCurrentSession().createQuery("from WorksRequest where id=?").setParameter(0, id).list();
        if (worksRequest.size() > 0) {
            return worksRequest.get(0);
        } else {
            return null;
        }
    }
    
    @Override
    @Transactional
    public List<WorksRequest> getByAccountOwner(AccountOwner accountOwner) {
        List<WorksRequest> worksRequests = new ArrayList<WorksRequest>();
        worksRequests = sessionFactory.getCurrentSession().createQuery("from WorksRequest where account_owner_id=?").setParameter(0, accountOwner).list();
        if (worksRequests.size() > 0) {
            return worksRequests;
        } else {
            return null;
        }
    }
    
    @Override
    @Transactional
    public void addWorksRequest(WorksRequest worksRequest) {
        sessionFactory.getCurrentSession().persist(worksRequest);
    }

    @Override
    @Transactional
    public void removeWorksRequest(WorksRequest worksRequest) {
        sessionFactory.getCurrentSession().delete(worksRequest);
    }
    
    @Override
    @Transactional
    public void updateWorksRequest(WorksRequest worksRequest) {
        sessionFactory.getCurrentSession().saveOrUpdate(worksRequest);
    }
}
