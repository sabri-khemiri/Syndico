package com.miaou.users.service;

import com.miaou.users.dao.AccountDao;
import com.miaou.users.model.Account;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userDetailsService")
public class MyUserDetailsService implements UserDetailsService {

	@Autowired
	private AccountDao accountDao;

	@Transactional(readOnly=true)
	@Override
	public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
	
		Account account = accountDao.findByUsername(username);
		List<GrantedAuthority> authorities = buildUserAuthority(account.getRole());

		return buildUserForAuthentication(account, authorities);
		
	}

	// Converts com.mkyong.users.model.User user to
	// org.springframework.security.core.userdetails.User
	private User buildUserForAuthentication(Account account, List<GrantedAuthority> authorities) {
		return new User(account.getUsername(), account.getPassword(), account.getEnabled(), true, true, true, authorities);
	}

	private List<GrantedAuthority> buildUserAuthority(String role) {

		Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();
                setAuths.add(new SimpleGrantedAuthority(role));
		List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);

		return Result;
	}

}