package dev.mvc.persistance;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.domain.UserVO;

@Repository
public class LoginDAOImpl implements LoginDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.userMapper";
	
	public UserVO loginUser(UserVO vo) {
	
		UserVO loginUser = session.selectOne(namespace+".loginUser",vo);
		
		return loginUser;
	}

	
	
	
}
