package com.miaou.trust.dao;

import com.miaou.trust.model.Trust;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class TrustDaoImpl implements TrustDao {

    @Autowired
    private SessionFactory sessionFactory;

    public TrustDaoImpl() {
    }

    public TrustDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public Trust getByName(String name) {

        List<Trust> trusts = new ArrayList<Trust>();

        trusts = sessionFactory.getCurrentSession().createQuery("from Trust where name=?").setParameter(0, name).list();

        if (trusts.size() > 0) {
            return trusts.get(0);
        } else {
            return null;
        }

    }

    @Override
    @Transactional
    public void add(Trust trust) {
        sessionFactory.getCurrentSession().persist(trust);
    }

    @Override
    @Transactional
    public List<Trust> getAll() {       
        return sessionFactory.getCurrentSession().createQuery("from Trust").list();
         
    }
}
