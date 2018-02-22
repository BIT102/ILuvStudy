package dev.mvc.study;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class StudyDAOImpl implements StudyDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "dev.mvc.mapper.StudyMapper";
	
	@Override
	public void createStudy(StudyVO vo) {
		sqlSession.insert(namespace+".createStudy", vo);
	}
}
