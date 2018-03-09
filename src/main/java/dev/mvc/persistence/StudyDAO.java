package dev.mvc.persistence;

import java.util.List;
import java.util.Map;

import dev.mvc.domain.CriteriaStudy;
import dev.mvc.domain.SearchCriteriaStudy;
import dev.mvc.domain.StudyVO;

public interface StudyDAO {

	//스터디등록
	public void createStudy(StudyVO vo);
	
	//스터디 읽기
	public StudyVO readStudy(Integer bno);

	//전체읽기
	public List<StudyVO> studyList() throws Exception;
	

	//파일업로드
	public void addFile(Map<String, String> map) throws Exception;
	
	//조회수 처리
	public void upVct(Integer bno) throws Exception;
	
	//페이징 처리
	public List<StudyVO> listPage(int page) throws Exception;
	
	//페이지 데이터 불러오기
	public List<StudyVO> listCriteria(CriteriaStudy cri) throws Exception;
	
	//페이지 데이터를 위한 전체수 반환 할 수 있게
	public int countPaging(CriteriaStudy cri) throws Exception;
	
	//상세페이지삭제
	public void delete(Integer bno) throws Exception;
	
	//검색 
	public List<StudyVO> listSearch(SearchCriteriaStudy cri) throws Exception;
	
	//검색수
	public int listSearchCount(SearchCriteriaStudy cri) throws Exception;

	//동적SQL을 적용하기 위한 메소드
	public List<StudyVO> catList()throws Exception;
	public List<StudyVO> catList2(String csId)throws Exception;
	public List<StudyVO> rgList()throws Exception;
	public List<StudyVO> rgList2(String rsId)throws Exception;
	
	//수정
	public void update(StudyVO vo)throws Exception;
	
	//게시물 수정 (기존의 첨부파일을 삭제하고 새롭게 추가)
	public void deleteAttach(Integer bno)throws Exception;
		
	public void replaceAttach(String fullName, Integer bno)throws Exception;
}
