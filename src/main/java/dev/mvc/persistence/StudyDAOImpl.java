package dev.mvc.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import dev.mvc.domain.CriteriaStudy;
import dev.mvc.domain.SearchCriteriaStudy;
import dev.mvc.domain.StudyVO;

@Repository
public class StudyDAOImpl implements StudyDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "dev.mvc.mapper.StudyMapper";

	private static final Logger logger = LoggerFactory.getLogger(StudyDAOImpl.class);

	
	//댓글수 업
		@Override
		public void upReply(Integer bno, int amount) throws Exception {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("bno", bno);
			map.put("amount", amount);
			
			session.update(namespace + ".updateReplyCnt", map);
		}
	
	
	//카테고리등록
		@Override
		public void createCa(Map<String, Object> map) throws Exception {
			 session.insert(namespace+".createCa", map);
		}
		
	//카테고리 다지워버려
		@Override
		public void caDelete(Integer bsBno) throws Exception {
			session.delete(namespace+".caDelete", bsBno); 
		}
		
		//파일도 다지워버려
		@Override
		public void atDelete(Integer bsBno) throws Exception {
			session.delete(namespace+".atDelete", bsBno);
		}
		
	//스터디 수정
	@Override
	public void update(StudyVO vo) throws Exception {

		session.update(namespace+".update", vo);
	}
	 
	@Override
	public String getcaD(Integer bno) throws Exception {
		
		return session.selectOne(namespace+".getcaD", bno);
	}
	
	@Override
	public List<String> getcaS(Integer bno) throws Exception {
		return session.selectList(namespace+".getcaS", bno);
	}
	
	//스터디등록
	@Override
	public void createStudy(StudyVO vo) throws Exception {
		session.insert(namespace+".createStudy", vo);
	}
	
	//시간을 따로 등록합니다
	public void clock(Map<String, Object> map) throws Exception {
		session.insert(namespace+".clock", map);
	}
	
	//시간 지우기
	public void deleteClock(Integer bsBno) throws Exception {
		session.delete(namespace+".deleteClock", bsBno);
	}

	//요일을 불러온다
	public List<String> getStart(Integer bsBno) throws Exception {
		return session.selectList(namespace+".getStart", bsBno);
	}
	
	//날짜불러오기
	public List<String> getStet(Map<String, Object> map) throws Exception {
		return session.selectList(namespace+".getStet", map);
	}
	
	// 카테고리 김상욱 수정
	@Override
	public List<StudyVO> studyCategory() throws Exception{
		return session.selectList(namespace + ".studyCategory");  //study 카테고리 정보
	}
	
	@Override
	public List<StudyVO> studyCategory2(String cDId) throws Exception{
		return session.selectList(namespace + ".studyCategory2", cDId);  //study 카테고리 소분류 가져옴
	}
	
	@Override
	public List<StudyVO> region() throws Exception{
		return session.selectList(namespace + ".region");   //지역 정보 대분류 가져옴  
	}
	
	@Override
	public List<StudyVO> region2(String rDId) throws Exception{
		return session.selectList(namespace + ".region2", rDId);   //지역 정보 소분류 가져옴  
	}
		
	//카테고리 불러오기
	@Override
	public List<StudyVO> readCa(Integer bno) throws Exception {
		return session.selectList(namespace+".readCa", bno);
	}	


	//스터디 불러오기
	@Override
	public StudyVO readStudy(Integer bno) throws Exception {
		
		// 사진의 갯수때문에 리턴값이 여러개가 될수 있으므로 리턴값을 배열에 담는다.
		List<StudyVO> vo = session.selectList(namespace+".readStudy", bno);
		
		StudyVO resultVo = vo.get(0); // 새롭게 생성된 resultVo의 다른 값들을 맞춰주기위함.
		String[] resultFiles = new String[vo.size()];

		for(int i = 0; i<vo.size(); i++){
			resultFiles[i] = resultVo.getName();		
		}
		
		resultVo.setFiles(resultFiles);
		
		return resultVo;
	}
	
	//스터디전체
	@Override
	public List<StudyVO> studyList() throws Exception {
		return session.selectList(namespace+".studyList");
	}

	//파일업로드
	@Override
	public void addFile(Map<String, Object> map) throws Exception {
		System.out.println("============================");
		System.out.println(map);
		System.out.println("============================");
		
		session.insert(namespace+".addFile", map);
		
	}
	
	//파일불러오기
	@Override
	public List<String> getFile(Integer bsBno) throws Exception {
		
		return session.selectList(namespace+".getFile", bsBno);
	}
	
	@Override
	public void deleteFile(Integer bsBno, String fileName) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("bsBno", bsBno);
		map.put("fileName", fileName);
		
		session.delete(namespace+".deleteFile", map);
	}
	
	
	//업로드를 위한 파일 불러오기
	@Override
	public List<String> getFileup(Integer bsBno) throws Exception {
		
		return session.selectList(namespace+".getFileup", bsBno);
	}
	

	//조회수 늘리기
	@Override
	public void upVct(Integer bno) throws Exception {
		session.update(namespace+".upVct", bno);
	}
	
	//페이지처리
	@Override
	public List<StudyVO> listPage(int page) throws Exception {
		
		if( page <= 0) {
			page = 1;			
		}
		
		page = (page-1)*9;
		
		return session.selectList(namespace+".listPage", page);
	}
	
	//페이지당 데이터 불러오기
	@Override
	public List<StudyVO> listCriteria(CriteriaStudy cri) throws Exception {
		return session.selectList(namespace+".listCriteria", cri);
	}
	
	@Override
	public List<StudyVO> catList() throws Exception {

		return session.selectList(namespace+".catList");
	}

	

	@Override
	public List<StudyVO> catList2(String csId) throws Exception {
		return session.selectList(namespace+".catList2", csId);
	}

	@Override
	public List<StudyVO> rgList() throws Exception {
		return session.selectList(namespace+".rgList");
	}

	@Override
	public List<StudyVO> rgList2(String rsId) throws Exception {
		return session.selectList(namespace+".rgList2", rsId);
	}
	
	
	//페이징 개수 불러오기
	@Override
	public int countPaging(CriteriaStudy cri) throws Exception {
		return session.selectOne(namespace+".countPaging", cri);
	}
	
	//상세페이지 삭제하기
	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace+".delete", bno);
	}
	
	//검색
	@Override
	public List<StudyVO> listSearch(SearchCriteriaStudy cri) throws Exception {
		System.out.println("========================================");
		System.out.println("dbtest");
		System.out.println(session.selectList(namespace+".listSearch", cri));
		System.out.println("========================================");
		return session.selectList(namespace+".listSearch", cri);
	}
	
	//방문자수 리스트를 위해 만들어요
	@Override
	public List<StudyVO> vctList(SearchCriteriaStudy cri) throws Exception {
		
		return session.selectList(namespace+".vctList", cri);
	}
	
	//새로운 리스트를 위해 만들어요 메인페이지
	@Override
	public List<StudyVO> newList(SearchCriteriaStudy cri) throws Exception {
		return session.selectList(namespace+".newList", cri);
	}
	
	//검색수
	@Override
	public int listSearchCount(SearchCriteriaStudy cri) throws Exception {
		return session.selectOne(namespace+".listSearchCount", cri);
	}
	
	//라스트인트값 저장하기
	@Override
	public int getBno() throws Exception {
		return session.selectOne(namespace+".getNextBno");
	}
	
	//참여인원수 늘리기
	@Override
	public void updateNow(Integer bno, int amount) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("bno", bno);
		map.put("amount", amount);
		
		session.update(namespace+".updateNow", map);
	}

}
