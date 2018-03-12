package dev.mvc.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dev.mvc.domain.AdminVO;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.LoginDTO;
import dev.mvc.persistence.LoginDAO;

@Service
public class LoginServiceImpl implements LoginService {

	@Inject
	LoginDAO dao;
	
	@Override
	public UserVO userLogin(LoginDTO dto) throws Exception{
		return dao.userLogin(dto);
	}
	
	@Override
	public AdminVO adminLogin(LoginDTO dto) throws Exception{
		return dao.adminLogin(dto);
	}
	
	@Override
	public void loginupdate(Object adminVO) throws Exception{
		dao.loginupdate(adminVO);
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
