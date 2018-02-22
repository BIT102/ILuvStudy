package dev.mvc.study;

import java.util.List;

public interface StudyDAO {

	//���͵���
	public void createStudy(StudyVO vo);
	
	//���͵� �б�
	public StudyVO readStudy(Integer bsBno);
	
	//��ü�б�
	public List<StudyVO> studyList() throws Exception;
}
