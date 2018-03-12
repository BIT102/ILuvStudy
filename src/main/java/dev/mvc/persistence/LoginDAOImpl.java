package dev.mvc.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.domain.AdminVO;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.LoginDTO;

@Repository
public class LoginDAOImpl implements LoginDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.loginMapper";
	
	// 사용자 로그인 확인
	
		// 로그인
		@Override
		public UserVO userLogin(LoginDTO dto) throws Exception {
			UserVO vo = new UserVO();
			vo.setEmail(dto.getId());
			vo.setPassword(dto.getPw());
			System.out.println("userLogin..............");
			System.out.println(vo);
			return session.selectOne(namespace + ".userLogin",vo);
		}

		// 세션으로 로그인 여부 판단
		@Override
		public void keepLogin(String email, String sessionId, Date next) throws Exception {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("email", email);
			paramMap.put("sessionId", sessionId);
			paramMap.put("next", next);
			
			session.update(namespace +".keepLogin", paramMap);
		}

		// 로그인시 사용자가 세션키를 가지고 있나 체크 (loginCookie에 기록된 값으로 사용자의 정보 조회) 
		@Override
		public UserVO checkUserWithSessionKey(String value) throws Exception {
			System.out.println("checkUserWithSessionKey.........."+ value);
			return session.selectOne(namespace +".checkUserWithSessionKey", value);
		}

	
	
	// 관리자 로그인 확인

	
	@Override
	public AdminVO adminLogin(LoginDTO dto)throws Exception{
		return session.selectOne(namespace + ".adminLogin", dto);  //로그인 계정 정보 찾음
	}
	
	@Override
	public void loginupdate(Object adminVO)throws Exception{
		session.update(namespace + ".adminLastLogin", adminVO);  //최근 접속일 업데이트
	}
	
	
	
}
