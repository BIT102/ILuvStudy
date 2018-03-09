package dev.mvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import dev.mvc.domain.CriteriaStudy;
import dev.mvc.domain.SearchCriteriaStudy;
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

		

		System.out.println("====================");

		System.out.println("registService..........");

		System.out.println(vo);

		System.out.println("====================");

		String[] files = vo.getFiles();

		if(files == null) return;

		dao.createStudy(vo);

		// bno 값 가져오기

		int bno = dao.getBno();

		vo.setBno(bno);
		
		Map<String, Object> map = new HashMap<>();

		for(String fileName : files) {

			if(fileName == files[0]){

				map.put("name", fileName);

				map.put("status", "O");

				map.put("bno", bno);

			} else {

				map.put("name", fileName);

				map.put("status", "X");

				map.put("bno", bno);

			}
			dao.addFile(map);
		}
	}
	
	//스터디 불러오기
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public StudyVO read(Integer bno) throws Exception {
		dao.upVct(bno);
		return dao.readStudy(bno);
	}
	
	//전체불러오기
	@Override
	public List<StudyVO> studyList() throws Exception {
		return dao.studyList();
	}
	
	//페이지당 데이터 불러오기
	@Override
	public List<StudyVO> listCriteria(CriteriaStudy cri) throws Exception {
		return dao.listCriteria(cri);
	}
	
	//페이진 전체수
	@Override
	public int listCountCriteria(CriteriaStudy cri) throws Exception {
		return dao.countPaging(cri);
	}
	
	//보드삭제하기
	@Override
	public void remove(Integer bno) throws Exception {
		dao.delete(bno);
	}
	
	//검색
	@Override
	public List<StudyVO> listSearchCriteria(SearchCriteriaStudy cri) throws Exception {
		return dao.listSearch(cri);
	}
	
	//검색수
	@Override
	public int listSearchCount(SearchCriteriaStudy cri) throws Exception {
		return dao.listSearchCount(cri);
	}
	
	//파일 불러오기
	@Override
	public List<String> getFile(Integer bsBno) throws Exception {
		return dao.getFile(bsBno);
	}
	
	@Override
	public List<StudyVO> catList() throws Exception {
		return dao.catList();
	}

	@Override
	public List<StudyVO> catList2(String csId) throws Exception {
		return dao.catList2(csId);
	}

	@Override
	public List<StudyVO> rgList() throws Exception {
		return dao.rgList();
	}
	
	@Override
	public List<StudyVO> rgList2(String rsId) throws Exception {
		return dao.rgList2(rsId);
	}

}
