package com.miaou.works.dao;

import com.miaou.users.dao.*;
import com.miaou.works.model.WorksQuotation;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class WorksQuotationDaoImpl implements WorksQuotationDao {

    @Autowired
    private SessionFactory sessionFactory;

    public WorksQuotationDaoImpl() {
    }

    public WorksQuotationDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public List<WorksQuotation> getAll() {       
        return sessionFactory.getCurrentSession().createQuery("from WorksQuotation").list();
    }
   
    @Override
    @Transactional
    public void addWorksQuotation(WorksQuotation worksQuotation) {
        sessionFactory.getCurrentSession().persist(worksQuotation);
    }

    @Override
    @Transactional
    public void removeWorksQuotation(WorksQuotation worksQuotation) {
        sessionFactory.getCurrentSession().delete(worksQuotation);
    }
    
    @Override
    @Transactional
    public void updateWorksQuotation(WorksQuotation worksQuotation) {
        sessionFactory.getCurrentSession().saveOrUpdate(worksQuotation);
    }
}
