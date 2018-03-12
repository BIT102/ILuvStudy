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
	
	// ����� �α��� Ȯ��
	
		// �α���
		@Override
		public UserVO userLogin(LoginDTO dto) throws Exception {
			UserVO vo = new UserVO();
			vo.setEmail(dto.getId());
			vo.setPassword(dto.getPw());
			System.out.println("userLogin..............");
			System.out.println(vo);
			return session.selectOne(namespace + ".userLogin",vo);
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
			System.out.println("checkUserWithSessionKey.........."+ value);
			return session.selectOne(namespace +".checkUserWithSessionKey", value);
		}

	
	
	// ������ �α��� Ȯ��

	
	@Override
	public AdminVO adminLogin(LoginDTO dto)throws Exception{
		return session.selectOne(namespace + ".adminLogin", dto);  //�α��� ���� ���� ã��
	}
	
	@Override
	public void loginupdate(Object adminVO)throws Exception{
		session.update(namespace + ".adminLastLogin", adminVO);  //�ֱ� ������ ������Ʈ
	}
	
	
	
}
