package dev.mvc.user;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {

	
	@Inject
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.userMapper";
	
	
	//ȸ������ �޼ҵ�
	@Override
	public void joinUser(UserVO vo) throws Exception {
		session.insert(namespace+".joinUser", vo);

	}

}