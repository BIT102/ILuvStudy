package dev.mvc.service;

import java.util.List;

import dev.mvc.domain.StudyVO;


public interface BookmarkService {

	//合付农 殿废
	public void addBookmark(StudyVO vo) throws Exception;
	
	//合付农 阂矾坷扁
	public List<StudyVO> listBookmark(Integer bsBno) throws Exception;
	
	/*		//合付农 秒家
	public void removeBookmark(Integer bsBno, String userEmail) throws Exception;*/
	
}
