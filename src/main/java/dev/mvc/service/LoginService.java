package dev.mvc.service;

import dev.mvc.domain.UserVO;

public interface LoginService {

	public UserVO login(UserVO vo) throws Exception;
	
}
