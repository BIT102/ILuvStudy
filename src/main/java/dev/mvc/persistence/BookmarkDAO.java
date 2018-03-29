package dev.mvc.persistence;

import java.util.List;
import java.util.Map;

import dev.mvc.domain.BookmarkVO;
import dev.mvc.domain.StudyVO;

public interface BookmarkDAO {

	//�ϸ�ũ ����մϴ�
	public void create(BookmarkVO vo) throws Exception;
	
	//�ϸ�ũ vo�� �����ϴ� �ϸ�ũ �ҷ�����
	public List<BookmarkVO> bolist() throws Exception;
	
	
	//�ϸ�ũ �ҷ�����
	public List<StudyVO> list(String writer) throws Exception;
	
	//�ϸ�ũ ����ϱ�
	public void delete(Integer bsBno, String userEmail) throws Exception;
}
