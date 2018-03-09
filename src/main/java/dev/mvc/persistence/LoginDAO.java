package dev.mvc.persistence;

import dev.mvc.domain.UserVO;

public interface LoginDAO {
	
	public UserVO loginUser(UserVO vo); // 로그인 확인
	
}
