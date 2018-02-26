package dev.mvc.service;

import java.util.List;

import dev.mvc.commons.Criteria;
import dev.mvc.domain.StudyVO;

public interface StudyService {

	//���͵���   
	public void regist(StudyVO vo) throws Exception;
	
	//���͵� �ҷ�����
	public StudyVO read(Integer bsBno) throws Exception;
	
	
	//��ü�ҷ�����
	public List<StudyVO> studyList() throws Exception;
	
	//���������� ������
	public List<StudyVO> listCriteria(Criteria cri) throws Exception;
	

}
