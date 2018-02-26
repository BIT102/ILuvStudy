package dev.mvc.persistance;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	
	@Inject
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.userMapper";
	
	
	//회원가입 메소드
	@Override
	public void joinUser(UserVO vo) throws Exception {
		session.insert(namespace+".joinUser", vo);

	}

}