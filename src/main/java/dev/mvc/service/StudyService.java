package dev.mvc.service;

import java.util.List;

import dev.mvc.admin.Criteria;
import dev.mvc.domain.CriteriaStudy;
import dev.mvc.domain.SearchCriteriaStudy;
import dev.mvc.domain.StudyVO;

public interface StudyService {


	//카테고리 불러오기
	public List<StudyVO> readCa(Integer bno) throws Exception;
	
/*	public List<String> getcaD() throws Exception;*/
	
	
	//스터디 수정부분
	public void update(StudyVO vo) throws Exception;
	
	//스터디등록   
	public void regist(StudyVO vo) throws Exception;
	
	// 카테고리 김상욱 수정
	public List<StudyVO> studyCategory() throws Exception;
	public List<StudyVO> studyCategory2(String cDId) throws Exception;
	
	public List<StudyVO> region() throws Exception;
	public List<StudyVO> region2(String rDId) throws Exception;
	
	
	//스터디 불러오기
	public StudyVO read(Integer bno) throws Exception;
	
	//파일 불러오기
	public List<String> getFile(Integer bsBno) throws Exception;
	
	//파일 삭제하기
	public void deleteFile(Integer bsBno, String fileName) throws Exception;
	
	//업데이트를 위한 파일 불러오기
	public List<String> getFileup(Integer bsBno) throws Exception;
	
	
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

	//방문자수 리스트를 위해 만들어요
	public List<StudyVO> vctList(SearchCriteriaStudy cri) throws Exception;	
	
	//새로등록된 스터디 메인페이지
	public List<StudyVO> newList(SearchCriteriaStudy cri) throws Exception;
	
	//검색수
	public int listSearchCount(SearchCriteriaStudy cri) throws Exception;	
	
	//수정
	public void modify(StudyVO vo) throws Exception;

	//카테고리
	public List<StudyVO> catList() throws Exception;
	
	public List<StudyVO> catList2(String csId) throws Exception;
	
	public List<StudyVO> rgList() throws Exception;
	
	public List<StudyVO> rgList2(String rsId) throws Exception;

	//시간을 불러옵니다
	/*public List<StudyVO> getClock(Integer bsBno) throws Exception;*/
}
