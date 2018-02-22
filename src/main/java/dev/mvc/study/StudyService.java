package dev.mvc.study;

import java.util.List;

public interface StudyService {

	//스터디등록
	public void regist(StudyVO vo) throws Exception;
	
	//스터디 불러오기
	public StudyVO read(Integer bsBno) throws Exception;
	
	
	//전체불러오기
	public List<StudyVO> studyList() throws Exception;

}
