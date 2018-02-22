package dev.mvc.study;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class StudyServiceImpl implements StudyService {

	@Inject
	private StudyDAO dao;
	
	//���͵���
	@Override
	public void regist(StudyVO vo) throws Exception {
		dao.createStudy(vo);
	}
	
	//���͵� �ҷ�����
	public StudyVO read(Integer bsBno) throws Exception {
		return dao.readStudy(bsBno);
	}
	
	//��ü�ҷ�����
	public List<StudyVO> studyList() throws Exception {
		return dao.studyList();
	}
}
