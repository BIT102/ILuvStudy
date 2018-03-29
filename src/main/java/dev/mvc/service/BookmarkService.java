package dev.mvc.service;

import java.util.List;
import java.util.Map;

import dev.mvc.domain.BookmarkVO;
import dev.mvc.domain.StudyVO;


public interface BookmarkService {

	//合付农 殿废
	public void addBookmark(BookmarkVO vo) throws Exception;
	
	
	//合付农vo俊 合付农
	public List<BookmarkVO> bolist() throws Exception;
	
	//合付农 阂矾坷扁
	public List<StudyVO> listBookmark(String writer) throws Exception;
	
			//合付农 秒家
	public void removeBookmark(Integer bsBno, String userEmail) throws Exception;
	
}
