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
	
	
	
	//ȸ������ 
	@Override
	public void joinUser(UserVO vo) throws Exception {
		session.insert(namespace+".joinUser", vo);

	}
	
	// ������ ȸ������ �о����
	@Override
	public UserVO read(String email) throws Exception {
		return session.selectOne(namespace+".read", email);
	}

	// ������ ȸ�� ���� ����
	@Override
	public void update(UserVO vo) throws Exception {
		session.update(namespace+".update", vo);
	}

	// ���� �ΰ� ���� ����
	@Override
	public void updateAddInfo(UserVO vo) throws Exception {
		session.update(namespace+".updateAddInfo", vo);
	}

	// ��й�ȣ ����
	@Override
	public void changePw(UserVO vo) throws Exception {
		session.update(namespace+".changePw", vo);
	}

	// ����� Ż��
	@Override
	public void quit(UserVO vo) throws Exception {
		session.update(namespace+".quit", vo);
	}

	
	// �α���
	@Override
	public UserVO login(UserLoginDTO dto) throws Exception {
		return session.selectOne(namespace + ".userDTOLogin",dto);
	}

	// �������� �α��� ���� �Ǵ�
	@Override
	public void keepLogin(String email, String sessionId, Date next) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("email", email);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);
		
		session.update(namespace +".keepLogin", paramMap);
	}

	// �α��ν� ����ڰ� ����Ű�� ������ �ֳ� üũ (loginCookie�� ��ϵ� ������ ������� ���� ��ȸ) 
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
		
		
		//Gil �ϸ�ũ
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