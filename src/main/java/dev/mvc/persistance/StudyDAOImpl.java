package dev.mvc.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.commons.Criteria;
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
	public StudyVO readStudy(Integer bsBno) {
		return session.selectOne(namespace+".readStudy", bsBno);
	}
	
	//스터디전체
	@Override
	public List<StudyVO> studyList() throws Exception {
		return session.selectList(namespace+".studyList");
	}
	
	//페이징처리
	@Override
	public List<StudyVO> listPage(int page) throws Exception {
		
		if(page <= 0) { page = 1;}
		
		page = (page-1)*10;
		
		return session.selectList(namespace+".listPage", page);
	}
	
	//페이지당 리스트 처리
	@Override
	public List<StudyVO> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace+".listCriteria", cri);
	}
	
	
	
	
//	//파일업로드
//	@Override
//	public void addFile(String baName) throws Exception {
//		session.insert(namespace+".addFile", baName);
//	}
}
