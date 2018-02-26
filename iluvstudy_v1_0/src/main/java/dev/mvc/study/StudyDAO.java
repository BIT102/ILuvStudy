package dev.mvc.study;

import java.util.List;

public interface StudyDAO {

	//스터디등록
	public void createStudy(StudyVO vo);
	
	//스터디 읽기
	public StudyVO readStudy(Integer bsBno);
	
	//전체읽기
	public List<StudyVO> studyList() throws Exception;
	
	//페이지 철
	public List<StudyVO> listPage(int page) throws Exception;
	
	//페이지당  스터디 읽어기
	public List<StudyVO> listCriteria(Criteria cri) throws Exception;

	//파일업로드
	//public void addFile(String baName) throws Exception;
}
