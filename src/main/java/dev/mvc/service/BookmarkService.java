package dev.mvc.service;

import java.util.List;

import dev.mvc.domain.StudyVO;


public interface BookmarkService {

	//�ϸ�ũ ���
	public void addBookmark(StudyVO vo) throws Exception;
	
	//�ϸ�ũ �ҷ�����
	public List<StudyVO> listBookmark(Integer bsBno) throws Exception;
	
	/*		//�ϸ�ũ ���
	public void removeBookmark(Integer bsBno, String userEmail) throws Exception;*/
	
}
