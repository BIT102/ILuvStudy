package dev.mvc.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dev.mvc.domain.BookmarkVO;
import dev.mvc.domain.StudyVO;
import dev.mvc.persistence.BookmarkDAO;

@Service
public class BookmarkServiceImpl implements BookmarkService {

	@Inject
	private BookmarkDAO dao;
	
	
/*	@Override
	public List<BookmarkVO> bolist(Map<String, Object> map) throws Exception {
		
		return dao.bolist(map);
	}*/
	
	//sohee 수정
	@Override
	public BookmarkVO bolist(Map<String, Object> map) throws Exception {
		
		return dao.bolist(map);
	}
	
	
	//북마크등록
	@Override
	public void addBookmark(BookmarkVO vo) throws Exception {
		
		dao.create(vo);
	}
	
	//북마크 불러오기
	@Override
	public List<StudyVO> listBookmark(String writer) throws Exception {
		return dao.list(writer);
	}
	
		//북마크 취소
	@Override
	public void removeBookmark(Integer bsBno, String userEmail) throws Exception {
		dao.delete(bsBno, userEmail);
	}
}
