package dev.mvc.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dev.mvc.domain.UserVO;
import dev.mvc.persistance.LoginDAO;

@Service
public class LoginServiceImpl implements LoginService {

	@Inject
	LoginDAO dao;
	
	@Override
	public UserVO login(UserVO vo) throws Exception{
		
		return dao.loginUser(vo);
	}
}
