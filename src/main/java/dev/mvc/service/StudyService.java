package dev.mvc.service;

import java.util.List;

import dev.mvc.domain.CriteriaStudy;
import dev.mvc.domain.SearchCriteriaStudy;
import dev.mvc.domain.StudyVO;

public interface StudyService {

	//카테고리 불러오기
	public List<StudyVO> readCa(Integer bno) throws Exception;
	
	//스터디등록   
	public void regist(StudyVO vo) throws Exception;
	
	//스터디 불러오기
	public StudyVO read(Integer bno) throws Exception;
	
	//파일 불러오기
	public List<String> getFile(Integer bsBno) throws Exception;
	
	//전체불러오기
	public List<StudyVO> studyList() throws Exception;

	//페이지당 데이터 불러오기
	public List<StudyVO> listCriteria(CriteriaStudy cri) throws Exception;
		
	//페이징 ㅈ개수전체
	public int listCountCriteria(CriteriaStudy cri) throws Exception;
	
	//보드 삭제히가
	public void remove(Integer bno) throws Exception;
	
	//검색
	public List<StudyVO> listSearchCriteria(SearchCriteriaStudy cri) throws Exception;
	
	//검색수
	public int listSearchCount(SearchCriteriaStudy cri) throws Exception;	
	
	//수정
	public void modify(StudyVO vo) throws Exception;

	//카테고리
	public List<StudyVO> catList() throws Exception;
	
	public List<StudyVO> catList2(String csId) throws Exception;
	
	public List<StudyVO> rgList() throws Exception;
	
	public List<StudyVO> rgList2(String rsId) throws Exception;


}
