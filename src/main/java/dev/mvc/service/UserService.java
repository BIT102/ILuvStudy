package dev.mvc.service;

public interface UserService {

	// 유효성검사 및 중복체크
	public int chkEmail(String email) throws Exception;
	
	// 인증메일 보내기
	public String sendEmail(String email) throws Exception;
	
	// 닉네임 중복처리
	public int chkNickname(String nickName)throws Exception;
	
}
