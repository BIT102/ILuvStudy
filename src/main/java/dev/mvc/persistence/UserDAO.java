package dev.mvc.persistence;

import java.util.List;
import java.util.Map;

import dev.mvc.domain.StudyVO;
import dev.mvc.domain.UserVO;

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
	
	//�г��� �ߺ� üũ
	public int nickCheck(String nickName) throws Exception;
	
	//������ ���� ����
	public void insertImg(Map<String, Object> map) throws Exception;
	
	
	//�ϸ�ũ ����Ʈ �ҷ�����
/*	public List<StudyVO> bookmarkList(String email) throws Exception;*/
	
	//�ϸ�ũ ���ã�� ����
	public int bookmarkCount(int bno) throws Exception;
	public StudyVO bookmarkCount2(int bno) throws Exception;

	//���� ���͵� �ҷ�����
	public List<StudyVO> recruitList(String email) throws Exception;
	
	//��û ���͵� �ҷ�����
	public List<StudyVO> applyList(String email) throws Exception;
	
	
/*	//ȸ�� ��ü ����Ʈ ��ȸ
	public List<UserVO> listAll() throws Exception;*/
	
	
	// ========================================================
	// sangwook
	
	// email �ߺ�üũ
	public int chkEmail(String email) throws Exception;
	
	// �г��� �ߺ�üũ
	public int chkNickname(String nickName) throws Exception;

	// �̸��� ���� Ȯ��
	public void emailConf(String email) throws Exception;
	
	
	

}
