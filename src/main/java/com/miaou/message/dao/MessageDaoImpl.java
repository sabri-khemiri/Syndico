package com.miaou.message.dao;

import com.miaou.meeting.dao.*;
import com.miaou.message.model.Message;
import com.miaou.trust.dao.*;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class MessageDaoImpl implements MessageDao {

    @Autowired
    private SessionFactory sessionFactory;

    public MessageDaoImpl() {
    }

    public MessageDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public List<Message> getAll() {       
        return sessionFactory.getCurrentSession().createQuery("from Message").list();
    }
    
    @Override
    @Transactional
    public Message getById(int id) {
        List<Message> message = new ArrayList<Message>();
        message = sessionFactory.getCurrentSession().createQuery("from Message where id=?").setParameter(0, id).list();
        if (message.size() > 0) {
            return message.get(0);
        } else {
            return null;
        }
    }
    
    @Override
    @Transactional
    public void addMessage(Message message) {
        sessionFactory.getCurrentSession().persist(message);
    }

    @Override
    @Transactional
    public void removeMessage(Message message) {
        sessionFactory.getCurrentSession().delete(message);
    }
    
    @Override
    @Transactional
    public void updateMessage(Message message) {
        sessionFactory.getCurrentSession().saveOrUpdate(message);
    }
}
