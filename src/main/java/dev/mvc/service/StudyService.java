package dev.mvc.service;

import java.util.List;

import dev.mvc.domain.CriteriaStudy;
import dev.mvc.domain.SearchCriteriaStudy;
import dev.mvc.domain.StudyVO;

public interface StudyService {

	//ī�װ� �ҷ�����
	public List<StudyVO> readCa(Integer bno) throws Exception;
	
	//���͵���   
	public void regist(StudyVO vo) throws Exception;
	
	//���͵� �ҷ�����
	public StudyVO read(Integer bno) throws Exception;
	
	//���� �ҷ�����
	public List<String> getFile(Integer bsBno) throws Exception;
	
	//��ü�ҷ�����
	public List<StudyVO> studyList() throws Exception;

	//�������� ������ �ҷ�����
	public List<StudyVO> listCriteria(CriteriaStudy cri) throws Exception;
		
	//����¡ ��������ü
	public int listCountCriteria(CriteriaStudy cri) throws Exception;
	
	//���� ��������
	public void remove(Integer bno) throws Exception;
	
	//�˻�
	public List<StudyVO> listSearchCriteria(SearchCriteriaStudy cri) throws Exception;
	
	//�˻���
	public int listSearchCount(SearchCriteriaStudy cri) throws Exception;	
	
	//����
	public void modify(StudyVO vo) throws Exception;

	//ī�װ�
	public List<StudyVO> catList() throws Exception;
	
	public List<StudyVO> catList2(String csId) throws Exception;
	
	public List<StudyVO> rgList() throws Exception;
	
	public List<StudyVO> rgList2(String rsId) throws Exception;


}
