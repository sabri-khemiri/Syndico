package com.miaou.news.dao;

import com.miaou.news.model.NewsType;
import com.miaou.trust.dao.*;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class NewsTypeDaoImpl implements NewsTypeDao {

    @Autowired
    private SessionFactory sessionFactory;

    public NewsTypeDaoImpl() {
    }

    public NewsTypeDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public List<NewsType> getAll() {       
        return sessionFactory.getCurrentSession().createQuery("from NewsType").list();
    }
    
    @Override
    @Transactional
    public void addNewsType(NewsType newsType) {
        sessionFactory.getCurrentSession().persist(newsType);
    }

    @Override
    @Transactional
    public void removeNewsType(NewsType newsType) {
        sessionFactory.getCurrentSession().delete(newsType);
    }
    
    @Override
    @Transactional
    public void updateNewsType(NewsType newsType) {
        sessionFactory.getCurrentSession().saveOrUpdate(newsType);
    }


}
