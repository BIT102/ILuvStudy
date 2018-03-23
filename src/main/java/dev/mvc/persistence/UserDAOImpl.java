package dev.mvc.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.domain.StudyVO;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.UserLoginDTO;

@Repository
public class UserDAOImpl implements UserDAO {

	
	@Inject
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.userMapper";
	
	
	
	//회원가입 
	@Override
	public void joinUser(UserVO vo) throws Exception {
		session.insert(namespace+".joinUser", vo);

	}
	
	// 프로필 회원정보 읽어오기
	@Override
	public UserVO read(String email) throws Exception {
		return session.selectOne(namespace+".read", email);
	}

	// 프로필 회원 정보 수정
	@Override
	public void update(UserVO vo) throws Exception {
		session.update(namespace+".update", vo);
	}

	// 개인 부가 정보 수정
	@Override
	public void updateAddInfo(UserVO vo) throws Exception {
		session.update(namespace+".updateAddInfo", vo);
	}

	// 비밀번호 변경
	@Override
	public void changePw(UserVO vo) throws Exception {
		session.update(namespace+".changePw", vo);
	}

	// 사용자 탈퇴
	@Override
	public void quit(UserVO vo) throws Exception {
		session.update(namespace+".quit", vo);
	}

	
	// 로그인
	@Override
	public UserVO login(UserLoginDTO dto) throws Exception {
		return session.selectOne(namespace + ".userDTOLogin",dto);
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
		return session.selectOne(namespace +".checkUserWithSessionKey", value);
	}


	//=================================================
		// sangwook
		
		@Override
		public int chkEmail(String email) throws Exception {
			return session.selectOne(namespace+".chkEmail", email);
		}
		
		@Override
		public int chkNickname(String nickName) throws Exception{
			return session.selectOne(namespace+".chkNickname", nickName);
		}
		
		
		//Gil 북마크
		@Override
		public List<UserVO> bmk(String email) throws Exception {
					
			
			
			return session.selectList(namespace+".listAll",email);
			
			
		}
//		@Override
//		public UserVO bmk(String email) throws Exception {
//					
//			return session.selectOne(namespace+".listAll",email);
//		}
	
}