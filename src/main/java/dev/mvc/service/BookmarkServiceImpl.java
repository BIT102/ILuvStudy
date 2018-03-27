package dev.mvc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dev.mvc.domain.StudyVO;
import dev.mvc.persistence.BookmarkDAO;

@Service
public class BookmarkServiceImpl implements BookmarkService {

	@Inject
	private BookmarkDAO dao;
	
	//合付农殿废
	@Override
	public void addBookmark(StudyVO vo) throws Exception {
		
		dao.create(vo);
	}
	
	//合付农 阂矾坷扁
	@Override
	public List<StudyVO> listBookmark(Integer bsBno) throws Exception {
		return dao.list(bsBno);
	}
	
	/*	//合付农 秒家
	@Override
	public void removeBookmark(Integer bsBno, String userEmail) throws Exception {
		dao.delete(bsBno, userEmail);
	}*/
}
