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
	
	
	// 아이디 찾기(전화번호로)
	public String searchEmail(String phone)throws Exception;
	
	
	//구글 로그인
	public void googleLogin(UserVO vo)throws Exception;
	//구글 로그인을 위한 아이디 찾기
	public int googleSelect(UserVO vo)throws Exception;
	
	// 시큐리티 비밀번호 암호화 패스워드 가져오기
	public UserVO getUserPw(String email) throws Exception;
	
	//비밀번호 재설정을 위한 이메일 찾기
	public int searchEmailCnt(String email) throws Exception;
	
	//시크릿키 업데이트
	public void secretKeyUpdate(UserVO vo)throws Exception;
}
