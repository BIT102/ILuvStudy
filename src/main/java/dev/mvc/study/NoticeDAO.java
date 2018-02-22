package dev.mvc.study;

import java.util.List;

public interface NoticeDAO {

	//공지사항 게시물 불러오기
	public NoticeVO readNotice(Integer ntBno) throws Exception;
	
	//전체게시물
	public List<NoticeVO> noticeList() throws Exception;
	
}
