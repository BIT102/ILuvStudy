package dev.mvc.persistence;

import java.util.List;
import java.util.Map;

import dev.mvc.domain.CriteriaStudy;
import dev.mvc.domain.SearchCriteriaStudy;
import dev.mvc.domain.StudyVO;

public interface StudyDAO {

	//���͵���
	public void createStudy(StudyVO vo);
	
	//���͵� �б�
	public StudyVO readStudy(Integer bno);

	//��ü�б�
	public List<StudyVO> studyList() throws Exception;
	

	//���Ͼ��ε�
	public void addFile(Map<String, String> map) throws Exception;
	
	//��ȸ�� ó��
	public void upVct(Integer bno) throws Exception;
	
	//����¡ ó��
	public List<StudyVO> listPage(int page) throws Exception;
	
	//������ ������ �ҷ�����
	public List<StudyVO> listCriteria(CriteriaStudy cri) throws Exception;
	
	//������ �����͸� ���� ��ü�� ��ȯ �� �� �ְ�
	public int countPaging(CriteriaStudy cri) throws Exception;
	
	//������������
	public void delete(Integer bno) throws Exception;
	
	//�˻� 
	public List<StudyVO> listSearch(SearchCriteriaStudy cri) throws Exception;
	
	//�˻���
	public int listSearchCount(SearchCriteriaStudy cri) throws Exception;

	//����SQL�� �����ϱ� ���� �޼ҵ�
	public List<StudyVO> catList()throws Exception;
	public List<StudyVO> catList2(String csId)throws Exception;
	public List<StudyVO> rgList()throws Exception;
	public List<StudyVO> rgList2(String rsId)throws Exception;
	
	//����
	public void update(StudyVO vo)throws Exception;
	
	//�Խù� ���� (������ ÷�������� �����ϰ� ���Ӱ� �߰�)
	public void deleteAttach(Integer bno)throws Exception;
		
	public void replaceAttach(String fullName, Integer bno)throws Exception;
}
