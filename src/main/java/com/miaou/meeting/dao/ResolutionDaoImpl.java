package com.miaou.meeting.dao;

import com.miaou.meeting.model.Resolution;
import com.miaou.trust.dao.*;
import com.miaou.users.model.AccountOwner;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class ResolutionDaoImpl implements ResolutionDao {

    @Autowired
    private SessionFactory sessionFactory;

    public ResolutionDaoImpl() {
    }

    public ResolutionDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public List<Resolution> getAll() {       
        return sessionFactory.getCurrentSession().createQuery("from Resolution").list();
    }
    
    @Override
    @Transactional
    public Resolution getByTitle(String title) {
        List<Resolution> resolutions = new ArrayList<Resolution>();
        resolutions = sessionFactory.getCurrentSession().createQuery("from Resolution where title=?").setParameter(0, title).list();
        if (resolutions.size() > 0) {
            return resolutions.get(0);
        } else {
            return null;
        }
    }
    
    @Override
    @Transactional
    public Resolution getById(int id) {
        List<Resolution> resolution = new ArrayList<Resolution>();
        resolution = sessionFactory.getCurrentSession().createQuery("from NewComment where id=?").setParameter(0, id).list();
        if (resolution.size() > 0) {
            return resolution.get(0);
        } else {
            return null;
        }
    }
    
    @Override
    @Transactional
    public Resolution getByAccountOwner(AccountOwner accountOwner) {
        List<Resolution> resolutions = new ArrayList<Resolution>();
        resolutions = sessionFactory.getCurrentSession().createQuery("from Resolution where account_owner_id=?").setParameter(0, accountOwner).list();
        if (resolutions.size() > 0) {
            return resolutions.get(0);
        } else {
            return null;
        }
    }
    
    @Override
    @Transactional
    public void addResolution(Resolution resolution) {
        sessionFactory.getCurrentSession().persist(resolution);
    }

    @Override
    @Transactional
    public void removeResolution(Resolution resolution) {
        sessionFactory.getCurrentSession().delete(resolution);
    }
    
    @Override
    @Transactional
    public void updateResolution(Resolution resolution) {
        sessionFactory.getCurrentSession().saveOrUpdate(resolution);
    }
}
