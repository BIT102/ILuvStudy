package dev.mvc.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import dev.mvc.domain.StudyVO;

@Repository
public class StudyDAOImpl implements StudyDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "dev.mvc.mapper.StudyMapper";
	private static final Logger logger = LoggerFactory.getLogger(StudyDAOImpl.class);
			
			
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
	public void addFile(String name) throws Exception {
		session.insert(namespace+".addFile", name);
		logger.info("===================================");
		logger.info("LAST_INSERT"+session.selectOne(namespace+".addFileLast"));
		logger.info("===================================");
		//session.selectOne(namespace+".addFileLast");
	}
	
	//파일 불러오기
	@Override
	public List<String> getFile(Integer bno) throws Exception {
		return session.selectList(namespace+".getFile", bno);
	}
}
