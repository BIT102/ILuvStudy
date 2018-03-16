package dev.mvc.persistence;

import java.util.List;

import dev.mvc.domain.BookmarkVO;

public interface BookmarkDAO {

	//북마크 등록합니다
	public void create(BookmarkVO vo) throws Exception;
	
	
	//북마크 불러오기
	public List<BookmarkVO> list(Integer bsBno) throws Exception;
	
	//북마크 취소하기
	public void delete(Integer bsBno, String userEmail) throws Exception;
}
