package dev.mvc.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.domain.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.MessageMapper";
	
	@Override
	public void send(MessageVO vo) throws Exception{
		session.insert(namespace + ".send", vo);  // 메시지 등록
	}
}
