package dev.mvc.persistance;

import dev.mvc.domain.UserVO;

public interface UserDAO {

	//회원 가입 메소드
	public void joinUser(UserVO vo) throws Exception;
	
}
