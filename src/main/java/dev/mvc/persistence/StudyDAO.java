package dev.mvc.persistence;

import java.util.List;
import java.util.Map;

import dev.mvc.admin.Criteria;
import dev.mvc.domain.CriteriaStudy;
import dev.mvc.domain.SearchCriteriaStudy;
import dev.mvc.domain.StudyVO;

public interface StudyDAO {
	
	//카테고리 지우기
	public void caDelete(Integer bsBno) throws Exception;
	
	//스터디 수정
	public void update(StudyVO vo) throws Exception;
	
	//대분류
	public String getcaD(Integer bno) throws Exception;
	
	//소분류
	public List<String> getcaS(Integer bno) throws Exception;
	
	
	//스터디등록
	public void createStudy(StudyVO vo) throws Exception;
	
	// 카테고리부분 김상욱 수정
	public List<StudyVO> studyCategory() throws Exception;
	public List<StudyVO> studyCategory2(String cDId) throws Exception;
	
	public List<StudyVO> region() throws Exception;
	public List<StudyVO> region2(String rDId) throws Exception;
	
	//스터디 읽기
	public StudyVO readStudy(Integer bno) throws Exception;
	
	//카테고리 불러오기
	public List<StudyVO> readCa(Integer bno) throws Exception;

	//카테고리 등록
	public void createCa(Map<String, Object> map) throws Exception;
	
	//전체읽기
	public List<StudyVO> studyList() throws Exception;	

	//파일업로드
	public void addFile(Map<String, Object> map) throws Exception;
	
	//파일 불러오기
	public List<String> getFile(Integer bsBno) throws Exception;
	
	//업데이트를 위한 파일 불러오기
	public List<String> getFileup(Integer bsBno) throws Exception;
	
	//파일 삭제
	public void  deleteFile(Integer bsBno, String fileName) throws Exception;
	
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
	
	public int getBno() throws Exception;

	//참여자수
	public void updateNow(Integer bno, int amount) throws Exception;

	
	//동적SQL을 적용하기 위한 메소드
	public List<StudyVO> catList()throws Exception;
	public List<StudyVO> catList2(String csId)throws Exception;
	public List<StudyVO> rgList()throws Exception;
	public List<StudyVO> rgList2(String rsId)throws Exception;
	
}
