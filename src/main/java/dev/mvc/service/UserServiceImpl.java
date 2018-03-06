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
	

	//회원가입
	@Override
	public void joinUser(UserVO vo) throws Exception {
		dao.joinUser(vo);
	}

	// 프로필 회원정보 읽어오기
	@Override
	public UserVO read(String email) throws Exception {
		return dao.read(email);
	}

	// 프로필 회원 정보 수정
	@Override
	public void update(UserVO vo) throws Exception {
		dao.update(vo);
	}

	// 개인 부가 정보 수정
	@Override
	public void updateAddInfo(UserVO vo) throws Exception {
		dao.updateAddInfo(vo);
	}

	// 비밀번호 변경
	@Override
	public void changePw(UserVO vo) throws Exception {
		dao.changePw(vo);
	}

	// 사용자 탈퇴
	@Override
	public void quit(UserVO vo) throws Exception {
		dao.quit(vo);
	}
	
	// 로그인
	@Override
	public UserVO login(UserLoginDTO dto) throws Exception {
		return dao.login(dto);
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


}
