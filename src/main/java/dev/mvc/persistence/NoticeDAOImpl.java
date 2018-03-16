package dev.mvc.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.NoticeVO;
import dev.mvc.domain.SearchCriteria;

@Repository  
public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.NoticeMapper";
	
	//공지사항 불러오기
	@Override
	public NoticeVO readNotice(Integer bno) throws Exception {
		return session.selectOne(namespace+".readNotice", bno);
	}
	
	//전체 불러오기
	public List<NoticeVO> noticeList() throws Exception {
		System.out.println("noticeList=======================");
		return session.selectList(namespace+".noticeList");
	}
	
	//페이지처리
	@Override
	public List<NoticeVO> listPage(int page) throws Exception {
		
		if( page <= 0) {
			page = 1;			
		}
		
		page = (page-1)*10;
		
		return session.selectList(namespace+".listPage", page);
	}
	
	//페이지당 데이터 불러오기
	@Override
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace+".listCriteria", cri);
	}
	
	//페이징 개수 불러오기
	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace+".countPaging", cri);
	}
	
	//검색합시다
	@Override
	public List<NoticeVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace+".listSearch", cri);
	}
	//검색수
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace+".listSearchCount", cri);
	}
	
	//공지사항 삭제
	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace+".delete", bno);
	}
	
	//공지사항 수정
	public void update(NoticeVO vo) throws Exception {
		session.update(namespace+".update", vo);
	}
}
