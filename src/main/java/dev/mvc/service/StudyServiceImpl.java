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

import dev.mvc.domain.CriteriaStudy;
import dev.mvc.domain.SearchCriteriaStudy;
import dev.mvc.domain.StudyVO;
import dev.mvc.persistence.StudyDAO;

@Service
public class StudyServiceImpl implements StudyService {

	@Inject
	private StudyDAO dao;

	//스터디 수정부분
	@Transactional
	@Override
	public void update(StudyVO vo) throws Exception {	
		
		int bsBno = vo.getBno();
		
		//요일과 시간을 지우고 다시 등록
		dao.deleteClock(bsBno);
		
		//시간등록
		Map<String, Object> clock = new HashMap<>();
		String[] startSc =  vo.getStartSc();
		String[] stEt = vo.getStEt();
		
		for(int i=0; i<startSc.length; i++) {
			String sc = startSc[i];
			String st = stEt[i];
			
			clock.put("bno", bsBno);
			clock.put("startSc", sc);
			clock.put("stEt", st);
			
			dao.clock(clock);	
		}
		
	
		//카테고리 다지워 다시 등록해
		dao.caDelete(bsBno);
		
		// 카테고리 등록
		Map<String, Object> ca = new HashMap<>();
		String[] D = vo.getCategoryD();
		String[] S = vo.getCategoryS();

		for (int i = 0; i < S.length; i++) {
			String caD = D[i];
			String caS = S[i];

			ca.put("bno", bsBno);
			ca.put("categoryD", caD);
			ca.put("categoryS", caS);


		dao.createCa(ca); // 스터디 카테고리 등록
		}	
		
		//사진도 지웠다가 다시다 등록할꺼야
		dao.atDelete(bsBno);
		
		// 파일등록하기
		String[] files = vo.getFiles();
		
		// 사진등록
		Map<String, Object> map = new HashMap<>();
		
		
		
		if(files==null) {
			map.put("name", "a");
			map.put("status", "O");
			map.put("bno", bsBno);
			
			dao.addFile(map);
		} else {

		for (String fileName : files) {

			if (fileName == files[0]) {
				map.put("name", fileName);
				map.put("status", "O");
				map.put("bno", bsBno);
			} else {
				map.put("name", fileName);
				map.put("status", "X");
				map.put("bno", bsBno);
			}
			
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			System.out.println("/////////////////////////////////////////////////");
			System.out.println(map);
			System.out.println("***************************************************");
			dao.addFile(map);
			}
		}
		
		dao.update(vo);
	}
	
	// 카테고리 불러왹
	@Override
	public List<StudyVO> readCa(Integer bno) throws Exception {

		return dao.readCa(bno);
	}

	// 스터디 불러오기
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public StudyVO read(Integer bno) throws Exception {
		
		//방문수
		dao.upVct(bno);
		
		//리스트에 담아서 bno 가져오꼐요
		StudyVO list = dao.readStudy(bno);
		
		//시간 출력하기 위해서
		int bsBno = list.getBno();
		
		//요일을 받아온다
		List<String> start = dao.getStart(bsBno);
		
		Map<String, Object> map = new HashMap<>();
		Map<String, String> clock = new HashMap<>();
		
		
		String sc="";
		String et="";
		
	for(int i=0; i<start.size(); i++){
			//요일을 변수에 저장
			sc = start.get(i); 
			
			//시간를 불러온다
			map.put("bsBno", bsBno); 
			map.put("sc", sc);

			et = dao.getStet(map).get(0);
			
			//맵에 담아서 clock변수에 셋합니다
			clock.put(sc, et);
			
		}
			list.setClock(clock);
		
		return list;
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

		StudyVO vo = new StudyVO();

		List<String> caS = new ArrayList<>();
		// 소분류 스트링으로 바꾼다
		String getcaS = "";
		
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
		return dao.listSearch(cri);
	}
	
	//방문자수 리스트를 위해 만들어요
	@Transactional
	@Override
	public List<StudyVO> vctList(SearchCriteriaStudy cri) throws Exception {
		
		List<StudyVO> list = dao.vctList(cri);

		//bno 값을 담자
		int bno;
		
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
		return dao.vctList(cri);
	}

	
	//새로운 스터디 메인페이지 
	@Transactional
	@Override
	public List<StudyVO> newList(SearchCriteriaStudy cri) throws Exception {
		
		List<StudyVO> list = dao.newList(cri);

		//bno 값을 담자
		int bno;
		
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
		
		
		
		
		
		
		
		return dao.newList(cri);
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
	
	@Override
	public void deleteFile(Integer bsBno, String fileName) throws Exception {
		
		dao.deleteFile(bsBno, fileName);
	}
	
	
	//업데이트를 위한 파일 불러오기
	public List<String> getFileup(Integer bsBno) throws Exception {
		return dao.getFileup(bsBno);
	}
	


	// 스터디등록, 파일등록, 지역등록, 시간도 등록

	@Transactional
	@Override
	public void regist(StudyVO vo) throws Exception {


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
	
		
		//시간등록
		Map<String, Object> clock = new HashMap<>();
		String[] startSc =  vo.getStartSc();
		String[] stEt = vo.getStEt();
		
		for(int i=0; i<startSc.length; i++) {
			String sc = startSc[i];
			String st = stEt[i];
			
			clock.put("bno", bno);
			clock.put("startSc", sc);
			clock.put("stEt", st);
			
			dao.clock(clock);	
		}

		// 파일등록하기
		String[] files = vo.getFiles();
		// 사진등록
		Map<String, Object> map = new HashMap<>();
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("/////////////////////////////////////////////////");
		System.out.println(files);
		System.out.println("***************************************************");
		
		
		
		if(files==null) {
			map.put("name", "a");
			map.put("status", "O");
			map.put("bno", bno);
			
			dao.addFile(map);
		} else {

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