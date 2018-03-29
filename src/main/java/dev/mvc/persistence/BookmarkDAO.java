package dev.mvc.persistence;

import java.util.List;
import java.util.Map;

import dev.mvc.domain.BookmarkVO;
import dev.mvc.domain.StudyVO;

public interface BookmarkDAO {

	//북마크 등록합니다
	public void create(BookmarkVO vo) throws Exception;
	
	//북마크 vo에 저장하는 북마크 불러오기
	public List<BookmarkVO> bolist() throws Exception;
	
	
	//북마크 불러오기
	public List<StudyVO> list(String writer) throws Exception;
	
	//북마크 취소하기
	public void delete(Integer bsBno, String userEmail) throws Exception;
}
