package dev.mvc.persistence;

import java.util.List;

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
	
	@Override
	public List<MessageVO> adminMessage(String id) throws Exception{
		return session.selectList(namespace+".adminMessage", id);	//관리자에게 문의
	}
	
	@Override
	public List<MessageVO> adminMessageView() throws Exception{
		return session.selectList(namespace + ".adminMessageView");		//관리자에서 문의 조회
	}
}
