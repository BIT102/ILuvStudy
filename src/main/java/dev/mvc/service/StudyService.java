package dev.mvc.service;

import java.util.List;

import dev.mvc.domain.StudyVO;

public interface StudyService {

	//���͵���   
	public void regist(StudyVO vo) throws Exception;
	
	//���͵� �ҷ�����
	public StudyVO read(Integer bno) throws Exception;
	
	
	//��ü�ҷ�����
	public List<StudyVO> studyList() throws Exception;
	
	//���Ϻҷ�����
	public List<String> getFile(Integer bno) throws Exception;
	
}
