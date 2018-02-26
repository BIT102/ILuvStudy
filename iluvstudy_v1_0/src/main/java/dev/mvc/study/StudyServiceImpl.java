package dev.mvc.study;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class StudyServiceImpl implements StudyService {

	@Inject
	private StudyDAO dao;
	
	//스터디등록
	@Override
	public void regist(StudyVO vo) throws Exception {
		dao.createStudy(vo);
	
	}
	
	//스터디 불러오기
	public StudyVO read(Integer bsBno) throws Exception {
		return dao.readStudy(bsBno);
	}
	
	//전체불러오기
	public List<StudyVO> studyList() throws Exception {
		return dao.studyList();
	}
	
	//페이지마다 데이터
	public List<StudyVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}
}
