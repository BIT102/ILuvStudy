package dev.mvc.service;

import java.util.List;

import dev.mvc.domain.BookmarkVO;

public interface BookmarkService {

	//�ϸ�ũ ���
	public void addBookmark(BookmarkVO vo) throws Exception;
	
	//�ϸ�ũ �ҷ�����
	public List<BookmarkVO> listBookmark(Integer bsBno) throws Exception;
	
	//�ϸ�ũ ���
	public void removeBookmark(Integer bsBno, String userEmail) throws Exception;
	
}
