package com.miaou.news.dao;

import com.miaou.news.model.News;
import com.miaou.trust.dao.*;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class NewsDaoImpl implements NewsDao {

    @Autowired
    private SessionFactory sessionFactory;

    public NewsDaoImpl() {
    }

    public NewsDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public List<News> getAll() {       
        return sessionFactory.getCurrentSession().createQuery("from News").list();
    }
    
        @Override
    @Transactional
    public News getById(int id) {
        List<News> news = new ArrayList<News>();
        news = sessionFactory.getCurrentSession().createQuery("from News where id=?").setParameter(0, id).list();
        if (news.size() > 0) {
            return news.get(0);
        } else {
            return null;
        }
    }
    
    @Override
    @Transactional
    public void addNews(News news) {
        sessionFactory.getCurrentSession().persist(news);
    }

    @Override
    @Transactional
    public void removeNews(News news) {
        sessionFactory.getCurrentSession().delete(news);
    }
    
    @Override
    @Transactional
    public void updateNews(News news) {
        sessionFactory.getCurrentSession().saveOrUpdate(news);
    }


}
