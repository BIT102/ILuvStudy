package dev.mvc.persistance;

import dev.mvc.domain.UserVO;

public interface LoginDAO {
	
	public UserVO loginUser(UserVO vo); // 로그인 확인
	
}
