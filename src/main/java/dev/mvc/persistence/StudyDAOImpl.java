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
	
	
	//카테고리등록
	public void createCa(Map<String, Object> map) throws Exception {
		 session.insert(namespace+".createCa", map);
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
		return session.selectList(namespace+".listSearch", cri);
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

	@Override
	public void update(StudyVO vo) throws Exception {
		session.update(namespace+".update", vo);
	}
	
	@Override
	public void deleteAttach(Integer bno) throws Exception {

		session.delete(namespace+".deleteAttach", bno);
		
	}

	@Override
	public void replaceAttach(String fullName, Integer bno) throws Exception {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("bno", bno);
		paramMap.put("fullName", fullName);
		
		session.insert(namespace+".replaceAttach", paramMap);
		
	}

}
