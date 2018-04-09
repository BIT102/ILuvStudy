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
		session.insert(namespace + ".send", vo);  // �޽��� ���
	}
	
	@Override
	public List<MessageVO> adminMessage(String id) throws Exception{
		return session.selectList(namespace+".adminMessage", id);	//�����ڿ��� ����
	}
	
	@Override
	public List<MessageVO> adminMessageView(int bno) throws Exception{
		return session.selectList(namespace + ".adminMessageView", bno);		//�����ڿ��� ���� ��ȸ
	}
	
	@Override
	public List<MessageVO> adminMessageList() throws Exception{
		return session.selectList(namespace + ".adminMessageList");			//������ ���� �޽��� ����Ʈ
	}
}
