package dev.mvc.persistance;

import java.util.List;

import dev.mvc.commons.Criteria;
import dev.mvc.domain.NoticeVO;

public interface NoticeDAO {

	//공지사항 게시물 불러오기  
	public NoticeVO readNotice(Integer ntBno) throws Exception;
	
	//전체게시물  
	public List<NoticeVO> noticeList() throws Exception;
	
	//페이지 처리
	public List<NoticeVO> listPage(int page) throws Exception;
	
	//페이지당 데이터
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception;
	
}
