package com.miaou.trust.dao;

import com.miaou.trust.model.CoOwnership;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class CoOwnershipDaoImpl implements CoOwnershipDao {

    @Autowired
    private SessionFactory sessionFactory;

    public CoOwnershipDaoImpl() {
    }

    public CoOwnershipDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public List<CoOwnership> getAll() {       
        return sessionFactory.getCurrentSession().createQuery("from CoOwnership").list();
    }
    
    @Override
    @Transactional
    public CoOwnership getByName(String name) {
        List<CoOwnership> coOwnerships = new ArrayList<CoOwnership>();
        coOwnerships = sessionFactory.getCurrentSession().createQuery("from CoOwnership where name=?").setParameter(0, name).list();
        if (coOwnerships.size() > 0) {
            return coOwnerships.get(0);
        } else {
            return null;
        }
    }
    
    @Override
    @Transactional
    public void addCoOwnership(CoOwnership coOwnership) {
        sessionFactory.getCurrentSession().persist(coOwnership);
    }

    @Override
    @Transactional
    public void removeCoOwnership(CoOwnership coOwnership) {
        sessionFactory.getCurrentSession().delete(coOwnership);
    }
    
    @Override
    @Transactional
    public void updateCoOwnership(CoOwnership coOwnership) {
        sessionFactory.getCurrentSession().saveOrUpdate(coOwnership);
    }
}
