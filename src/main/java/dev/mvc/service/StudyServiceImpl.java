package dev.mvc.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import dev.mvc.admin.Criteria;
import dev.mvc.domain.CriteriaStudy;
import dev.mvc.domain.SearchCriteriaStudy;
import dev.mvc.domain.StudyVO;
import dev.mvc.persistence.StudyDAO;

@Service
public class StudyServiceImpl implements StudyService {

	@Inject
	private StudyDAO dao;

	// 카테고리 불러왹
	public List<StudyVO> readCa(Integer bno) throws Exception {

		return dao.readCa(bno);
	}

	// 스터디 불러오기
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public StudyVO read(Integer bno) throws Exception {

		dao.upVct(bno);

		return dao.readStudy(bno);
	}

	// 전체불러오기
	@Override
	public List<StudyVO> studyList() throws Exception {

		return dao.studyList();
	}

	// 페이지당 데이터 불러오기
	@Override
	public List<StudyVO> listCriteria(CriteriaStudy cri) throws Exception {
		return dao.listCriteria(cri);
	}

	// 페이진 전체수
	@Override
	public int listCountCriteria(CriteriaStudy cri) throws Exception {
		return dao.countPaging(cri);
	}

	// 보드삭제하기
	@Override
	public void remove(Integer bno) throws Exception {
		dao.delete(bno);
	}

	// 검색 //대분류 //소분류
	@Override
	public List<StudyVO> listSearchCriteria(SearchCriteriaStudy cri) throws Exception {

		List<StudyVO> list = dao.listSearch(cri);

		//bno 값을 담자
		int bno;


		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println(list.size());
		System.out.println("++++++++++++++++++++++++++++++++++++++++++++++");
		System.out.println(dao.studyList().size());
		System.out.println("++++++++++++++++++++++++++++++++++++++++++++++");



		StudyVO vo = new StudyVO();

		List<String> caS = new ArrayList<>();
		// 소분류 스트링으로 바꾼다
		String getcaS = "";
		
		System.out.println("============================");
		System.out.println(list);
		System.out.println("============================");
		
		// 카테고리 소분류의 다중선택을 처리하기위해 스트링으로 만들어 set해준다.

		// bno 가져온다
		for (int i = 0; i < list.size(); i++) {

			bno = list.get(i).getBno();
			// bno와 비교해서 대분류 가져온다
			list.get(i).setcDName(dao.getcaD(bno));

			caS = dao.getcaS(bno);

			String[] arrcaS = caS.toArray(new String[caS.size()]);

			getcaS = Arrays.toString(arrcaS);

			System.out.println("+++++++++++++++++++++++++++++++++++++++++++");
			System.out.println(list);
			System.out.println("+++++++++++++++++++++++++++++++++++++++++++");

			// 영어 <- set getcaS
			list.get(i).setcSName(getcaS);
		}

		// 스터디 리스트 가져온다
		return list;
	}

	// 검색수
	@Override
	public int listSearchCount(SearchCriteriaStudy cri) throws Exception {

		return dao.listSearchCount(cri);
	}

	// 파일 불러오기
	@Override
	public List<String> getFile(Integer bsBno) throws Exception {
		return dao.getFile(bsBno);

	}

	// 스터디등록, 파일등록, 지역등록
	@Transactional
	@Override
	public void regist(StudyVO vo) throws Exception {

		// 파일등록하기
		String[] files = vo.getFiles();

		System.out.println("====================");
		System.out.println(vo.getFiles());
		System.out.println("====================");

		// 스터디 등록
		dao.createStudy(vo);

		int bno = dao.getBno();
		vo.setBno(bno);
		System.out.println("bno는 이거다" + bno);
		// 카테고리 등록
		Map<String, Object> ca = new HashMap<>();
		String[] D = vo.getCategoryD();
		String[] S = vo.getCategoryS();

		for (int i = 0; i < S.length; i++) {
			String caD = D[i];
			String caS = S[i];

			ca.put("bno", bno);
			ca.put("categoryD", caD);
			ca.put("categoryS", caS);

			System.out.println("========================");
			System.out.println(ca);
			System.out.println("========================");

			dao.createCa(ca); // 스터디 카테고리 등록
		}

		// 사진등록
		Map<String, Object> map = new HashMap<>();

		for (String fileName : files) {

			if (fileName == files[0]) {
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

	// 카테고리 김상욱 수정
	@Override
	public List<StudyVO> studyCategory() throws Exception {
		return dao.studyCategory();
	}

	@Override
	public List<StudyVO> studyCategory2(String cDId) throws Exception {
		return dao.studyCategory2(cDId);
	}

	@Override
	public List<StudyVO> region() throws Exception {
		return dao.region();
	}

	@Override
	public List<StudyVO> region2(String rDId) throws Exception {
		return dao.region2(rDId);
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

	// 수정 : 미완성본
	@Transactional
	@Override
	public void modify(StudyVO vo) throws Exception {
		// dao.update(vo);

		Integer bno = vo.getBno();

		// dao.deleteAttach(bno);

		String[] files = vo.getFiles();

		if (files == null) {
			return;
		}

		for (String fileName : files) {
			// dao.replaceAttach(fileName, bno);
		}
	}
}