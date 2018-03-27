package dev.mvc.persistence;

import java.util.Date;

import dev.mvc.domain.AdminVO;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.LoginDTO;

public interface LoginDAO {

	//ȸ�� �α��� (����Ȱ��)
	public UserVO userLogin(LoginDTO dto) throws Exception; // �α��� Ȯ��
	
	// sessionKey & sessionLimit ������Ʈ
	public void keepLogin(String email, String sessionId, Date next) throws Exception; // sessinId = DB�� sessionKey
	
	// loginCookie�� ��ϵ� ������ ������� ���� ��ȸ
	public UserVO checkUserWithSessionKey(String value) throws Exception;

	public AdminVO adminLogin(LoginDTO dto)throws Exception;
	public void loginupdate(Object adminVO)throws Exception;
	
	
	// ���̵� ã��(��ȭ��ȣ��)
	public String searchEmail(String phone)throws Exception;
	
	
	//���� �α���
	public void googleLogin(UserVO vo)throws Exception;
	//���� �α����� ���� ���̵� ã��
	public int googleSelect(UserVO vo)throws Exception;
}
