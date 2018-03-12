package dev.mvc.service;


import java.util.Date;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.LoginDTO;

public interface UserService {

	//회원 가입 메소드
	public void joinUser(UserVO vo) throws Exception;
	
	//프로필 개인정보 조회
	public UserVO read(String email) throws Exception;
	
	//프로필 개인정보 수정
	public void update(UserVO vo) throws Exception;
	
	//사용자 부가 정보 수정
	public void updateAddInfo(UserVO vo) throws Exception;
	
	//사용자 비밀번호 변경
	public void changePw(UserVO vo) throws Exception;
	
	//사용자 탙뢰
	public void quit(UserVO vo) throws Exception;
	
	
	
	
	//==========sangwook==============
	// 유효성검사 및 중복체크
	public int chkEmail(String email) throws Exception;
	
	// 인증메일 보내기
	public String sendEmail(String email) throws Exception;
	
	// 닉네임 중복처리
	public int chkNickname(String nickName)throws Exception;
	
}
