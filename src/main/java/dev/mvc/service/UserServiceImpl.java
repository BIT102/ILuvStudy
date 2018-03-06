package dev.mvc.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dev.mvc.domain.UserVO;
import dev.mvc.dto.UserLoginDTO;
import dev.mvc.persistance.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;
	

	//ȸ������
	@Override
	public void joinUser(UserVO vo) throws Exception {
		dao.joinUser(vo);
	}

	// ������ ȸ������ �о����
	@Override
	public UserVO read(String email) throws Exception {
		return dao.read(email);
	}

	// ������ ȸ�� ���� ����
	@Override
	public void update(UserVO vo) throws Exception {
		dao.update(vo);
	}

	// ���� �ΰ� ���� ����
	@Override
	public void updateAddInfo(UserVO vo) throws Exception {
		dao.updateAddInfo(vo);
	}

	// ��й�ȣ ����
	@Override
	public void changePw(UserVO vo) throws Exception {
		dao.changePw(vo);
	}

	// ����� Ż��
	@Override
	public void quit(UserVO vo) throws Exception {
		dao.quit(vo);
	}
	
	// �α���
	@Override
	public UserVO login(UserLoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	// �������� �α��� ���� �Ǵ�
	@Override
	public void keepLogin(String email, String sessionId, Date next) throws Exception {
		dao.keepLogin(email, sessionId, next);
	}

	// �α��ν� ����ڰ� ����Ű�� ������ �ֳ� üũ (loginCookie�� ��ϵ� ������ ������� ���� ��ȸ) 
	@Override
	public UserVO checkLoginBefore(String value) throws Exception {
		return dao.checkUserWithSessionKey(value);
	}


}
