package dev.mvc.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.domain.CriteriaStudy;
import dev.mvc.domain.SearchCriteriaStudy;
import dev.mvc.domain.StudyVO;

@Repository
public class StudyDAOImpl implements StudyDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "dev.mvc.mapper.StudyMapper";
	
	//스터디등록
	@Override
	public void createStudy(StudyVO vo) {
		session.insert(namespace+".createStudy", vo);
	}
	
	//스터디 불러오기
	@Override
	public StudyVO readStudy(Integer bno) {
		return session.selectOne(namespace+".readStudy", bno);
	}
	
	//스터디전체
	@Override
	public List<StudyVO> studyList() throws Exception {
		return session.selectList(namespace+".studyList");
	}

	//파일업로드
	@Override
	public void addFile(Map<String, String> map) throws Exception {
		System.out.println("============================");
		System.out.println(map);
		System.out.println("============================");
		
		session.insert(namespace+".addFile", map);
		
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
