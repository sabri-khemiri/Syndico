package com.miaou.works.dao;

import com.miaou.trust.model.CoOwnership;
import com.miaou.users.dao.*;
import com.miaou.works.model.Works;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class WorksDaoImpl implements WorksDao {

    @Autowired
    private SessionFactory sessionFactory;

    public WorksDaoImpl() {
    }

    public WorksDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public List<Works> getAll() {       
        return sessionFactory.getCurrentSession().createQuery("from Works").list();
    }
    
    @Override
    @Transactional
    public List<Works> getByCoOwnership(CoOwnership coOwnership) {
        List<Works> works = new ArrayList<Works>();
        works = sessionFactory.getCurrentSession().createQuery("from Works where co_ownership_id=?").setParameter(0, coOwnership).list();
        if (works.size() > 0) {
            return works;
        } else {
            return null;
        }
    }
    
    @Override
    @Transactional
    public void addWorks(Works works) {
        sessionFactory.getCurrentSession().persist(works);
    }

    @Override
    @Transactional
    public void removeWorks(Works works) {
        sessionFactory.getCurrentSession().delete(works);
    }
    
    @Override
    @Transactional
    public void updateWorks(Works works) {
        sessionFactory.getCurrentSession().saveOrUpdate(works);
    }
}
