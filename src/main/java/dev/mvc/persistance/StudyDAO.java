package dev.mvc.persistance;

import java.util.List;

import dev.mvc.domain.StudyVO;

public interface StudyDAO {

	//스터디등록
	public void createStudy(StudyVO vo);
	
	//스터디 읽기
	public StudyVO readStudy(Integer bno);
	
	//전체읽기
	public List<StudyVO> studyList() throws Exception;
	

	//파일업로드
	public void addFile(String name) throws Exception;
	
	//파일 불러오기
	public List<String> getFile(Integer bno) throws Exception;
	
//	public void deleteFile(int )
}
