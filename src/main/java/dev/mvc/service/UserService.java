package dev.mvc.service;

public interface UserService {

	// ��ȿ���˻� �� �ߺ�üũ
	public int chkEmail(String email) throws Exception;
	
	// �������� ������
	public String sendEmail(String email) throws Exception;
	
	// �г��� �ߺ�ó��
	public int chkNickname(String nickName)throws Exception;
	
}
