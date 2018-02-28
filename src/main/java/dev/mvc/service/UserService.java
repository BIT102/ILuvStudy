package dev.mvc.service;

public interface UserService {

	// 유효성검사 및 중복체크
	public int chkEmail(String email) throws Exception;
	
	// 인증메일 보내기
	public void sendEmail(String email) throws Exception;
	
}
