package dev.mvc.study;

import java.util.List;

public interface StudyService {

	//���͵���
	public void regist(StudyVO vo) throws Exception;
	
	//���͵� �ҷ�����
	public StudyVO read(Integer bsBno) throws Exception;
	
	
	//��ü�ҷ�����
	public List<StudyVO> studyList() throws Exception;

}
