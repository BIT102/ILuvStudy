package dev.mvc.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.ReplyStudyVO;

@Repository
public class ReplyStudyDAOImpl implements ReplyStudyDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.replyStudyMapper";
	
	
	//댓글 게시물 번호 알아오기
	@Override
	public int getBno(Integer rno) throws Exception {
		return session.selectOne(namespace + ".getBno", rno);
	}
	
	// 댓글목록
	@Override
	public List<ReplyStudyVO> list(Integer bsBno) throws Exception {
		return session.selectList(namespace+".list", bsBno);
	}
	
	//댕글 등록
	@Override
	public void create(ReplyStudyVO vo) throws Exception {
		session.insert(namespace+".create", vo);
	}
	
	//댓글수정
	@Override
	public void update(ReplyStudyVO vo) throws Exception {
		session.update(namespace+".update", vo);
	}
	
	//댓글 삭제
	@Override
	public void delete(Integer rno) throws Exception {
		session.delete(namespace+".delete", rno);
	}
	
	//페이지처리
	@Override
	public List<ReplyStudyVO> listPage(Integer bsBno, Criteria cri) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("bsBno", bsBno);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace+".listPage", paramMap);
	}
	
	//데이터수
	@Override
	public int count(Integer bsBno) throws Exception {
		
		return session.selectOne(namespace+".count", bsBno);
	}
}
