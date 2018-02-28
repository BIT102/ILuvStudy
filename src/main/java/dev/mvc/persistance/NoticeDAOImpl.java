package dev.mvc.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.domain.NoticeVO;

@Repository  
public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.NoticeMapper";
	
	//�������� �ҷ�����
	@Override
	public NoticeVO readNotice(Integer bno) throws Exception {
		return session.selectOne(namespace+".readNotice", bno);
	}
	
	//��ü �ҷ�����
	public List<NoticeVO> noticeList() throws Exception {
		return session.selectList(namespace+".noticeList");
	}

}
