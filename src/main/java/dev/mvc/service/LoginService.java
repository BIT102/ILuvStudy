package dev.mvc.service;

import java.util.Date;

import dev.mvc.domain.AdminVO;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.LoginDTO;

public interface LoginService {

	// ����� �α���
	public UserVO userLogin(LoginDTO dto) throws Exception;
	
	// session �α��� ���� �Ǵ�
	public void keepLogin(String email, String sessionId, Date next) throws Exception;
	
	// �α��ν� ����ڰ� sessionKey�� ������ �ֳ� üũ (loginCookie�� ��ϵ� ������ ������� ���� ��ȸ) 
	public UserVO checkLoginBefore(String value) throws Exception;
	
	// ������ �α���
	public AdminVO adminLogin(LoginDTO dto) throws Exception;
	
	// ������ ������Ʈ
	public void loginupdate(Object adminVO) throws Exception;

	// ��ȭ��ȣ�� �̸���ã��
	public String searchEmail(String phone) throws Exception;

	//���� �α��� api
	public void googleLogin(UserVO vo)throws Exception;
}
