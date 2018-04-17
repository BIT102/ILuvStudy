package dev.mvc.service;

import java.util.Date;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import dev.mvc.controller.UserController;
import dev.mvc.domain.AdminVO;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.LoginDTO;
import dev.mvc.persistence.LoginDAO;

@Service
public class LoginServiceImpl implements LoginService {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);

	@Inject
	LoginDAO dao;
	@Inject
	private BCryptPasswordEncoder passwordEncoder; //��������ť��Ƽ ��й�ȣ ��ȣȭ
	
	@Override
	public UserVO userLogin(LoginDTO dto) throws Exception{
		
		// ��ť��Ƽ ��ȣȭ �� �κ� ���ڴ�
		//============================================================
		if(dao.getUserPw(dto.getId()) != null){
			String pw = dao.getUserPw(dto.getId()).getPassword();
			logger.info("��ȣȭ ��й�ȣ : " + pw);
			String rawPw = dto.getPw();
			logger.info("��й�ȣ : " + rawPw);

			if(passwordEncoder.matches(rawPw, pw)){
				logger.info("��й�ȣ ��ġ");
				dto.setPw(pw);
			}else {
				logger.info("��й�ȣ ����ġ");    
			}
		
		}
		//==============================================================
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

	@Override
	public String searchEmail(String phone) throws Exception{
		return dao.searchEmail(phone);
	}
	
	
	//���� �α���
	@Override
	public void googleLogin(UserVO vo)throws Exception{
		
		//vo�� �̸��� ������ user ���̺��� email ���� ��
		//user ���̺� email ������ ������ join �Ƚ�Ŵ
		//user ���̺� email ������ ������ join
		
		if(dao.googleSelect(vo)==0){
			System.out.println("=====���� ����Ѵٿ�==========");
			dao.googleLogin(vo);			
		}
	}
}
