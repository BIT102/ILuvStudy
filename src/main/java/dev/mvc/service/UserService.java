package dev.mvc.service;

public interface UserService {

	// ��ȿ���˻� �� �ߺ�üũ
	public int chkEmail(String email) throws Exception;
	
	// �������� ������
	public void sendEmail(String email) throws Exception;
	
}
