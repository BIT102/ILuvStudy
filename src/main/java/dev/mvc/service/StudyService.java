package dev.mvc.service;

import java.util.List;

import dev.mvc.domain.StudyVO;

public interface StudyService {

	//스터디등록   
	public void regist(StudyVO vo) throws Exception;
	
	//스터디 불러오기
	public StudyVO read(Integer bno) throws Exception;
	
	
	//전체불러오기
	public List<StudyVO> studyList() throws Exception;
	
	//파일불러오기
	public List<String> getFile(Integer bno) throws Exception;
	
}
