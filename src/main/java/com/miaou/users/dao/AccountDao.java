package com.miaou.users.dao;

import com.miaou.users.model.Account;


public interface AccountDao {
    public Account findByUsername(String username);
    public void addAccount(Account account);

}
