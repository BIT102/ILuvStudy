package dev.mvc.service;


import java.util.Date;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.LoginDTO;

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
	
	
	
	
	//==========sangwook==============
	// ��ȿ���˻� �� �ߺ�üũ
	public int chkEmail(String email) throws Exception;
	
	// �������� ������
	public String sendEmail(String email) throws Exception;
	
	// �г��� �ߺ�ó��
	public int chkNickname(String nickName)throws Exception;
	
	// �̸��� ���� Ȯ��
	public void emailConf(String email)throws Exception;
	
}