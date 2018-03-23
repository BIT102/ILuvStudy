package dev.mvc.persistence;

import java.util.List;
import java.util.Map;

import dev.mvc.admin.Criteria;
import dev.mvc.domain.CriteriaStudy;
import dev.mvc.domain.SearchCriteriaStudy;
import dev.mvc.domain.StudyVO;

public interface StudyDAO {
	
	//��з�
	public String getcaD(Integer bno) throws Exception;
	
	//�Һз�
	public List<String> getcaS(Integer bno) throws Exception;
	
	
	//���͵���
	public void createStudy(StudyVO vo) throws Exception;
	
	// ī�װ��κ� ���� ����
	public List<StudyVO> studyCategory() throws Exception;
	public List<StudyVO> studyCategory2(String cDId) throws Exception;
	
	public List<StudyVO> region() throws Exception;
	public List<StudyVO> region2(String rDId) throws Exception;
	
	//���͵� �б�
	public StudyVO readStudy(Integer bno) throws Exception;
	
	//ī�װ� �ҷ�����
	public List<StudyVO> readCa(Integer bno) throws Exception;

	//ī�װ� ���
	public void createCa(Map<String, Object> map) throws Exception;
	
	//��ü�б�
	public List<StudyVO> studyList() throws Exception;	

	//���Ͼ��ε�
	public void addFile(Map<String, Object> map) throws Exception;
	
	//���� �ҷ�����
	public List<String> getFile(Integer bsBno) throws Exception;
	
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
	
	public int getBno() throws Exception;

	//�����ڼ�
	public void updateNow(Integer bno, int amount) throws Exception;

	
	//����SQL�� �����ϱ� ���� �޼ҵ�
	public List<StudyVO> catList()throws Exception;
	public List<StudyVO> catList2(String csId)throws Exception;
	public List<StudyVO> rgList()throws Exception;
	public List<StudyVO> rgList2(String rsId)throws Exception;
	
}
