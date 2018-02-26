package dev.mvc.service;

import java.util.List;

import dev.mvc.commons.Criteria;
import dev.mvc.domain.StudyVO;

public interface StudyService {

	//스터디등록   
	public void regist(StudyVO vo) throws Exception;
	
	//스터디 불러오기
	public StudyVO read(Integer bsBno) throws Exception;
	
	
	//전체불러오기
	public List<StudyVO> studyList() throws Exception;
	
	//페이지마다 데이터
	public List<StudyVO> listCriteria(Criteria cri) throws Exception;
	

}
