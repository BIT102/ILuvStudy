package dev.mvc.persistence;

import java.util.Date;

import dev.mvc.domain.UserVO;
import dev.mvc.dto.LoginDTO;

public interface UserDAO {

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
	
	
	
/*	//ȸ�� ��ü ����Ʈ ��ȸ
	public List<UserVO> listAll() throws Exception;*/
	
	
	// ========================================================
	// sangwook
	
	// email �ߺ�üũ
	public int chkEmail(String email) throws Exception;
	
	public int chkNickname(String nickName) throws Exception;
	
	public void emailConf(String email) throws Exception;
}
