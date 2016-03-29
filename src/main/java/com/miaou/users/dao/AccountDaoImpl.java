package com.miaou.users.dao;

import com.miaou.users.model.Account;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class AccountDaoImpl implements AccountDao {

    @Autowired
    private SessionFactory sessionFactory;

    public AccountDaoImpl() {
    }

    public AccountDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public Account findByUsername(String username) {
        List<Account> accounts = new ArrayList<Account>();
        accounts = sessionFactory.getCurrentSession().createQuery("from Account where username=?").setParameter(0, username).list();
        if (accounts.size() > 0) {
            return accounts.get(0);
        } else {
            return null;
        }
    }

    @Override
    @Transactional
    public void addAccount(Account account) {
        sessionFactory.getCurrentSession().persist(account);
    }
    
    @Override
    @Transactional
    public void removeAccount(Account account) {
        sessionFactory.getCurrentSession().delete(account);
    }
    
    @Override
    @Transactional
    public void updateAccount(Account account) {
        sessionFactory.getCurrentSession().update(account);
    }
}
