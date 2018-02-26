package dev.mvc.study;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	//���������� ������
	public List<StudyVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}
}
