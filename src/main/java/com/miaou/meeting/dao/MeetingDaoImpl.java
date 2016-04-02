package com.miaou.meeting.dao;

import com.miaou.meeting.model.Meeting;
import com.miaou.trust.dao.*;
import com.miaou.trust.model.CoOwnership;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class MeetingDaoImpl implements MeetingDao {

    @Autowired
    private SessionFactory sessionFactory;

    public MeetingDaoImpl() {
    }

    public MeetingDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public List<Meeting> getAll() {       
        return sessionFactory.getCurrentSession().createQuery("from Meeting").list();
    }
    
    @Override
    @Transactional
    public List<Meeting> getByMeetingDate(Date meetingDate) {
        List<Meeting> meetings = new ArrayList<Meeting>();
        meetings = sessionFactory.getCurrentSession().createQuery("from Meeting where meeting_date=?").setParameter(0, meetingDate).list();
        if (meetings.size() > 0) {
            return meetings;
        } else {
            return null;
        }
    }
    
    @Override
    @Transactional
    public Meeting getById(int id) {
        List<Meeting> meeting = new ArrayList<Meeting>();
        meeting = sessionFactory.getCurrentSession().createQuery("from Meeting where id=?").setParameter(0, id).list();
        if (meeting.size() > 0) {
            return meeting.get(0);
        } else {
            return null;
        }
    }
    
    @Override
    @Transactional
    public List<Meeting> getByCoOwnership(CoOwnership coOwnership) {
        List<Meeting> meetings = new ArrayList<Meeting>();
        meetings = sessionFactory.getCurrentSession().createQuery("from Meeting where co_ownership_id=?").setParameter(0, coOwnership).list();
        if (meetings.size() > 0) {
            return meetings;
        } else {
            return null;
        }
    }
    
    @Override
    @Transactional
    public void addMeeting(Meeting meeting) {
        sessionFactory.getCurrentSession().persist(meeting);
    }

    @Override
    @Transactional
    public void removeMeeting(Meeting meeting) {
        sessionFactory.getCurrentSession().delete(meeting);
    }
    
    @Override
    @Transactional
    public void updateMeeting(Meeting meeting) {
        sessionFactory.getCurrentSession().saveOrUpdate(meeting);
    }
}
