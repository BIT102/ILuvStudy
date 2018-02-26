package dev.mvc.study;

import java.util.List;

public interface StudyDAO {

	//���͵���
	public void createStudy(StudyVO vo);
	
	//���͵� �б�
	public StudyVO readStudy(Integer bsBno);
	
	//��ü�б�
	public List<StudyVO> studyList() throws Exception;
	
	//������ ö
	public List<StudyVO> listPage(int page) throws Exception;
	
	//��������  ���͵� �о��
	public List<StudyVO> listCriteria(Criteria cri) throws Exception;

	//���Ͼ��ε�
	//public void addFile(String baName) throws Exception;
}
