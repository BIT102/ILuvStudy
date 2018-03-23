package dev.mvc.persistence;

import java.util.Date;
import java.util.List;

import dev.mvc.domain.StudyVO;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.UserLoginDTO;

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
	
	//ȸ�� �α��� (����Ȱ��) 
	public UserVO login(UserLoginDTO dto) throws Exception;
	
	// sessionKey & sessionLimit ������Ʈ
	public void keepLogin(String email, String sessionId, Date next) throws Exception; // sessinId = DB�� sessionKey
	
	// loginCookie�� ��ϵ� ������ ������� ���� ��ȸ
	public UserVO checkUserWithSessionKey(String value) throws Exception;
	
/*	//ȸ�� ��ü ����Ʈ ��ȸ
	public List<UserVO> listAll() throws Exception;*/
	
	
	// ========================================================
	// sangwook
	
	// email �ߺ�üũ
	public int chkEmail(String email) throws Exception;
	
	public int chkNickname(String nickName) throws Exception;

	// Gil �ϸ�ũ
	public List<UserVO> bmk(String email) throws Exception;
//	public UserVO bmk(String email) throws Exception;
}
