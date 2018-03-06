package dev.mvc.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.domain.ApplyVO;

@Repository
public class ApplyDAOImpl implements ApplyDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.ApplyMapper";
	
	//스터디 신청
	@Override
	public void create(ApplyVO vo) throws Exception {
		session.insert(namespace+".createApply", vo);
	}
	
	//신청자 불러오기
	@Override
	public List<ApplyVO> list(Integer bsBno) throws Exception {
		return session.selectList(namespace+".listApply", bsBno);
	}
	
	//상태값 업데이트
	@Override
	public void update(ApplyVO vo) throws Exception {
		session.update(namespace+".updateApply", vo);
	}
	
	//스터디 취소
	@Override
	public void delete(ApplyVO vo) throws Exception {
		session.delete(namespace+".deleteApply", vo);
	}
}
