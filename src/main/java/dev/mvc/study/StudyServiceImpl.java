package dev.mvc.study;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class StudyServiceImpl implements StudyService {

	@Inject
	private StudyDAO dao;
	
	@Override
	public void regist(StudyVO vo) throws Exception {
		dao.createStudy(vo);
	}
}
