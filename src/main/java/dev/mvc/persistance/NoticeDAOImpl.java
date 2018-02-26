package dev.mvc.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.commons.Criteria;
import dev.mvc.domain.NoticeVO;

@Repository  
public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.NoticeMapper";
	
	//공지사항 불러오기
	@Override
	public NoticeVO readNotice(Integer ntBno) throws Exception {
		return session.selectOne(namespace+".readNotice", ntBno);
	}
	
	//전체 불러오기
	@Override
	public List<NoticeVO> noticeList() throws Exception {
		return session.selectList(namespace+".noticeList");
	}
	
	@Override
	public List<NoticeVO> listPage(int page) throws Exception {
		
		if(page <= 0) {
			page = 1;
		}
		
		page = (page-1)*10;
		
		return session.selectList(namespace+".listPage", page);
		
	}
	
	@Override
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace+".listCriteria", cri);
	}

}
