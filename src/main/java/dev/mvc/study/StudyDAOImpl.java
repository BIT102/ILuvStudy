package dev.mvc.study;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class StudyDAOImpl implements StudyDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "dev.mvc.mapper.StudyMapper";
	
	//���͵���
	@Override
	public void createStudy(StudyVO vo) {
		session.insert(namespace+".createStudy", vo);
	}
	
	//���͵� �ҷ�����
	@Override
	public StudyVO readStudy(Integer bsBno) {
		return session.selectOne(namespace+".readStudy", bsBno);
	}
	
	@Override
	public List<StudyVO> studyList() throws Exception {
		return session.selectList(namespace+".studyList");
	}
}
