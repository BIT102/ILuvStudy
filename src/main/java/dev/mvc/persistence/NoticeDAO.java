package dev.mvc.persistence;

import java.util.List;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.NoticeVO;
import dev.mvc.domain.SearchCriteria;

public interface NoticeDAO {

	//공지사항 게시물 불러오기  
	public NoticeVO readNotice(Integer bno) throws Exception;
	
	//전체게시물  
	public List<NoticeVO> noticeList() throws Exception;
	
	//페이징 처리
	public List<NoticeVO> listPage(int page) throws Exception;
	
	//페이지 데이터 불러오기
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception;
	
	//페이지 데이터를 위한 전체수 반환 할 수 있게
	public int countPaging(Criteria cri) throws Exception;
	
	//검색리스트페이지
	public List<NoticeVO> listSearch(SearchCriteria cri) throws Exception;
	
	//검색하기 위해서
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	//삭제 (관리자만)
	public void delete(Integer bno) throws Exception; 
	
	//수정(관리자만)
	public void update(NoticeVO vo) throws Exception;
}
