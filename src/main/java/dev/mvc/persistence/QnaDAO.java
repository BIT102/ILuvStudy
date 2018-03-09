package dev.mvc.persistence;

import java.util.List;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.QnaVO;
import dev.mvc.domain.ReplyVO;
import dev.mvc.domain.SearchCriteria;

public interface QnaDAO {

	//qna작성
	public void create(QnaVO vo)throws Exception;
	
	//qna게시글조회
	public QnaVO read(Integer bno)throws Exception;
	
	//qna수정
	public void update(QnaVO vo)throws Exception;
	
	//qna삭제
	public void delete(Integer bno)throws Exception;
	
	//qna전체목록조회
	public List<QnaVO> listAll()throws Exception;
	
	//페이징  -> qnaMapper에 SQL문 작성
	public List<QnaVO> listPage(int page)throws Exception;
	
	//리스트 출력 (Criteria객체를 파라미터로 받고 필요한 getPageStart()와 getPerPageNum()메소드를 호출한 결과를 사용
	public List<QnaVO> listCriteria(Criteria cri)throws Exception;
	
	//페이지
	public int countPaging(Criteria cri)throws Exception;
	
	//동적SQL문을 적용하기 위한 메서드 (둘다 SearchCriteria를 파라미터로 받아들이도록설계)  - page, perPageNum, searchType, keyword 데이터 유지가능
	public List<QnaVO> listSearch(SearchCriteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
	
	//ReplyDAO
	public List<ReplyVO> list(Integer bqBno)throws Exception;
	
	public void create(ReplyVO vo) throws Exception;
	
	public void update(ReplyVO vo)throws Exception;
	
	public void deleteReply(Integer rno)throws Exception;
}
