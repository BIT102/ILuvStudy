package dev.mvc.persistence;

import java.util.Date;

import dev.mvc.domain.AdminVO;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.LoginDTO;

public interface LoginDAO {

	//회원 로그인 (세션활용)
	public UserVO userLogin(LoginDTO dto) throws Exception; // 로그인 확인
	
	// sessionKey & sessionLimit 업데이트
	public void keepLogin(String email, String sessionId, Date next) throws Exception; // sessinId = DB의 sessionKey
	
	// loginCookie에 기록된 값으로 사용자의 정보 조회
	public UserVO checkUserWithSessionKey(String value) throws Exception;
	
	
	public AdminVO adminLogin(LoginDTO dto)throws Exception;
	public void loginupdate(Object adminVO)throws Exception;
	
}
