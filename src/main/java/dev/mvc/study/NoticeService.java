package dev.mvc.study;

import java.util.List;

public interface NoticeService {
	
	
	//공지사항 불러오기
	public NoticeVO read(Integer ntBno) throws Exception;
	
	//공지사항 전체
	public List<NoticeVO> noticeList() throws Exception;
}
