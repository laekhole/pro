package com.kosa.pro.config.auth;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kosa.pro.model.auth.LoginMember;
import com.kosa.pro.service.common.BaseService;


@Service
public class PrincipalDetailsService extends BaseService implements UserDetailsService {


	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("PrincipalDetailsService : 진입");
		
		LoginMember member = (LoginMember) getDAO().selectOne("member.findMemid", username);
		
		
		getDAO().update("member.loginCountInc", member);
		
		
		System.out.println("PrincipalDetailsService : member -> " + member);

		return new PrincipalDetails(member);
	}
}
