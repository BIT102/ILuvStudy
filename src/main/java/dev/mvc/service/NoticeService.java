package dev.mvc.service;

import java.util.List;

import dev.mvc.commons.Criteria;
import dev.mvc.domain.NoticeVO;

public interface NoticeService {
	
	  
	//공지사항 불러오기
	public NoticeVO read(Integer ntBno) throws Exception;
	
	//공지사항 전체
	public List<NoticeVO> noticeList() throws Exception;
	
	//페이지당 데이터
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception;
}
