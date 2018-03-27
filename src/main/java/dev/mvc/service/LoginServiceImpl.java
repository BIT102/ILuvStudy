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
	

	// 세션으로 로그인 여부 판단
	@Override
	public void keepLogin(String email, String sessionId, Date next) throws Exception {
		dao.keepLogin(email, sessionId, next);
	}

	// 로그인시 사용자가 세션키를 가지고 있나 체크 (loginCookie에 기록된 값으로 사용자의 정보 조회) 
	@Override
	public UserVO checkLoginBefore(String value) throws Exception {
		return dao.checkUserWithSessionKey(value);
	}

	@Override
	public String searchEmail(String phone) throws Exception{
		return dao.searchEmail(phone);
	}
	
	
	//구글 로그인
	@Override
	public void googleLogin(UserVO vo)throws Exception{
		
		//vo의 이메일 정보와 user 테이블의 email 정보 비교
		//user 테이블에 email 정보가 있으면 join 안시킴
		//user 테이블에 email 정보가 있으면 join
		
		if(dao.googleSelect(vo)==0){
			System.out.println("=====없음 등록한다요==========");
			dao.googleLogin(vo);			
		}
	}
}
