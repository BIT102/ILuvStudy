package dev.mvc.service;

import java.util.List;

import dev.mvc.domain.NoticeVO;

public interface NoticeService {
	
	  
	//공지사항 불러오기
	public NoticeVO read(Integer bno) throws Exception;
	
	//공지사항 전체
	public List<NoticeVO> noticeList() throws Exception;
}
