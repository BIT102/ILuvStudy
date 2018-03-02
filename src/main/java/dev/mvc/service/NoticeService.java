package dev.mvc.service;

import java.util.List;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.NoticeVO;
import dev.mvc.domain.SearchCriteria;

public interface NoticeService {
	
	  
	//공지사항 불러오기
	public NoticeVO read(Integer bno) throws Exception;
	
	//공지사항 전체
	public List<NoticeVO> noticeList() throws Exception;
	
	//페이지당 데이터 불러오기
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception;
	
	//페이징 ㅈ개수전체
	public int listCountCriteria(Criteria cri) throws Exception;
	
	//검색리스트
	public List<NoticeVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	
	//페이징처리
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	//공지사항 삭제
	public void remove(Integer bno) throws Exception;
	
	//공지사항 수정
	public void modify(NoticeVO vo) throws Exception;
}
