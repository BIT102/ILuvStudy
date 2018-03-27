package dev.mvc.persistence;

import java.util.List;


import dev.mvc.domain.StudyVO;

public interface BookmarkDAO {

	//�ϸ�ũ ����մϴ�
	public void create(StudyVO vo) throws Exception;
	
	
	//�ϸ�ũ �ҷ�����
	public List<StudyVO> list(Integer bsBno) throws Exception;
	
/*	//�ϸ�ũ ����ϱ�
	public void delete(Integer bsBno, String userEmail) throws Exception;*/
}
