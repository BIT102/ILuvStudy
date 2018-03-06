package dev.mvc.service;

import java.util.List;

import dev.mvc.domain.BookmarkVO;

public interface BookmarkService {

	//合付农 殿废
	public void addBookmark(BookmarkVO vo) throws Exception;
	
	//合付农 阂矾坷扁
	public List<BookmarkVO> listBookmark(Integer bsBno) throws Exception;
	
	//合付农 秒家
	public void removeBookmark(Integer bsBno, String userEmail) throws Exception;
	
}
