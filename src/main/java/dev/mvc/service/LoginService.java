package dev.mvc.service;

import java.util.Date;

import dev.mvc.domain.AdminVO;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.LoginDTO;

public interface LoginService {

	// 사용자 로그인
	public UserVO userLogin(LoginDTO dto) throws Exception;
	
	// session 로그인 여부 판단
	public void keepLogin(String email, String sessionId, Date next) throws Exception;
	
	// 로그인시 사용자가 sessionKey를 가지고 있나 체크 (loginCookie에 기록된 값으로 사용자의 정보 조회) 
	public UserVO checkLoginBefore(String value) throws Exception;
	
	// 관리자 로그인
	public AdminVO adminLogin(LoginDTO dto) throws Exception;
	
	// 관리자 업데이트
	public void loginupdate(Object adminVO) throws Exception;

	// 전화번호로 이메일찾기
	public String searchEmail(String phone) throws Exception;

	//구글 로그인 api
	public void googleLogin(UserVO vo)throws Exception;
}
