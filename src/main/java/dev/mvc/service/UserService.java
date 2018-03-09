package dev.mvc.service;


import java.util.Date;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.UserLoginDTO;

public interface UserService {

	//ȸ�� ���� �޼ҵ�
	public void joinUser(UserVO vo) throws Exception;
	
	//������ �������� ��ȸ
	public UserVO read(String email) throws Exception;
	
	//������ �������� ����
	public void update(UserVO vo) throws Exception;
	
	//����� �ΰ� ���� ����
	public void updateAddInfo(UserVO vo) throws Exception;
	
	//����� ��й�ȣ ����
	public void changePw(UserVO vo) throws Exception;
	
	//����� �y��
	public void quit(UserVO vo) throws Exception;
	
	//ȸ�� �α��� (����Ȱ��) 
	public UserVO login(UserLoginDTO dto) throws Exception;
	
	// session �α��� ���� �Ǵ�
	public void keepLogin(String email, String sessionId, Date next) throws Exception;
	
	// �α��ν� ����ڰ� sessionKey�� ������ �ֳ� üũ (loginCookie�� ��ϵ� ������ ������� ���� ��ȸ) 
	public UserVO checkLoginBefore(String value) throws Exception;
	
	
	//==========sangwook==============
	// ��ȿ���˻� �� �ߺ�üũ
	public int chkEmail(String email) throws Exception;
	
	// �������� ������
	public String sendEmail(String email) throws Exception;
	
	// �г��� �ߺ�ó��
	public int chkNickname(String nickName)throws Exception;
	
}
