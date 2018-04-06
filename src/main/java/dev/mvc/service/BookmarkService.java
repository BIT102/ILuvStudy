package dev.mvc.service;

import java.util.List;
import java.util.Map;

import dev.mvc.domain.BookmarkVO;
import dev.mvc.domain.StudyVO;


public interface BookmarkService {

	//�ϸ�ũ ���
	public void addBookmark(BookmarkVO vo) throws Exception;
	
	
	//�ϸ�ũvo�� �ϸ�ũ
	/*public List<BookmarkVO> bolist(Map<String, Object> map) throws Exception;*/
	
	//sohee ����
	public BookmarkVO bolist(Map<String, Object> map) throws Exception;
	
	//�ϸ�ũ �ҷ�����
	public List<StudyVO> listBookmark(String writer) throws Exception;
	
			//�ϸ�ũ ���
	public void removeBookmark(Integer bsBno, String userEmail) throws Exception;
	
}
