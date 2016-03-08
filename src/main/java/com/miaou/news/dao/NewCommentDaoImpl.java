package com.miaou.news.dao;

import com.miaou.news.model.NewComment;
import com.miaou.trust.dao.*;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class NewCommentDaoImpl implements NewCommentDao {

    @Autowired
    private SessionFactory sessionFactory;

    public NewCommentDaoImpl() {
    }

    public NewCommentDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public List<NewComment> getAll() {       
        return sessionFactory.getCurrentSession().createQuery("from NewComment").list();
    }
    
    @Override
    @Transactional
    public NewComment getById(int id) {
        List<NewComment> newComments = new ArrayList<NewComment>();
        newComments = sessionFactory.getCurrentSession().createQuery("from NewComment where id=?").setParameter(0, id).list();
        if (newComments.size() > 0) {
            return newComments.get(0);
        } else {
            return null;
        }
    }
    
    @Override
    @Transactional
    public void addNewComment(NewComment newComment) {
        sessionFactory.getCurrentSession().persist(newComment);
    }

    @Override
    @Transactional
    public void removeNewComment(NewComment newComment) {
        sessionFactory.getCurrentSession().delete(newComment);
    }
    
    @Override
    @Transactional
    public void updateNewComment(NewComment newComment) {
        sessionFactory.getCurrentSession().saveOrUpdate(newComment);
    }


}
