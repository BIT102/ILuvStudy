package dev.mvc.study;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.NoticeMapper";
	
	//�������� �ҷ�����
	@Override
	public NoticeVO readNotice(Integer ntBno) throws Exception {
		return session.selectOne(namespace+".readNotice", ntBno);
	}
	
	//��ü �ҷ�����
	public List<NoticeVO> noticeList() throws Exception {
		return session.selectList(namespace+".noticeList");
	}

}
