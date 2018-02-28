package dev.mvc.persistance;

import java.util.List;

import dev.mvc.domain.NoticeVO;

public interface NoticeDAO {

	//공지사항 게시물 불러오기  
	public NoticeVO readNotice(Integer bno) throws Exception;
	
	//전체게시물  
	public List<NoticeVO> noticeList() throws Exception;
	
}
