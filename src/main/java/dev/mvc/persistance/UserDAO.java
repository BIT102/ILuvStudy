package dev.mvc.persistance;

import dev.mvc.domain.UserVO;

public interface UserDAO {

	//ȸ�� ���� �޼ҵ�
	public void joinUser(UserVO vo) throws Exception;
	
}
