package dev.mvc.persistance;

import java.util.List;

import dev.mvc.domain.StudyVO;

public interface StudyDAO {

	//���͵���
	public void createStudy(StudyVO vo);
	
	//���͵� �б�
	public StudyVO readStudy(Integer bno);
	
	//��ü�б�
	public List<StudyVO> studyList() throws Exception;
	

	//���Ͼ��ε�
	public void addFile(String name) throws Exception;
	
	//���� �ҷ�����
	public List<String> getFile(Integer bno) throws Exception;
	
//	public void deleteFile(int )
}
