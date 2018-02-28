package dev.mvc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dev.mvc.domain.StudyVO;
import dev.mvc.persistance.StudyDAO;

@Service
public class StudyServiceImpl implements StudyService {

	@Inject
	private StudyDAO dao;
	
	//스터디등록, 파일등록
	@Transactional
	@Override
	public void regist(StudyVO vo) throws Exception {
		
		dao.createStudy(vo);
		
		String[] files = vo.getFiles();
	
		if(files == null) return;
		
//		for(int i=0; i<files.length; i++) {
//			if(i==0) { 
//				vo.setStatus('O');
//			} else {
//				vo.setStatus('X');
//			}
//		}
		
		for(String fileName : files) {
			dao.addFile(fileName);
		}
	
	}
	
	//스터디 불러오기
	@Override
	public StudyVO read(Integer bno) throws Exception {
		return dao.readStudy(bno);
	}
	
	//전체불러오기
	@Override
	public List<StudyVO> studyList() throws Exception {
		return dao.studyList();
	}
	
	//파일 불러오기
	@Override
	public List<String> getFile(Integer bno) throws Exception {
		return dao.getFile(bno);
	}
	
}
