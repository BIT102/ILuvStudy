package dev.mvc.persistence;

import java.util.List;

import dev.mvc.domain.BookmarkVO;

public interface BookmarkDAO {

	//�ϸ�ũ ����մϴ�
	public void create(BookmarkVO vo) throws Exception;
	
	
	//�ϸ�ũ �ҷ�����
	public List<BookmarkVO> list(Integer bsBno) throws Exception;
	
	//�ϸ�ũ ����ϱ�
	public void delete(Integer bsBno, String userEmail) throws Exception;
}
