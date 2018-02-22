package dev.mvc.study;

import java.util.List;

public interface StudyDAO {

	//스터디등록
	public void createStudy(StudyVO vo);
	
	//스터디 읽기
	public StudyVO readStudy(Integer bsBno);
	
	//전체읽기
	public List<StudyVO> studyList() throws Exception;
}
