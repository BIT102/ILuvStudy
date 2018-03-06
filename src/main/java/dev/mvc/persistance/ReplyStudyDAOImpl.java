package dev.mvc.persistance;

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
	
	// ��۸��
	@Override
	public List<ReplyStudyVO> list(Integer bsBno) throws Exception {
		return session.selectList(namespace+".list", bsBno);
	}
	
	//��� ���
	@Override
	public void create(ReplyStudyVO vo) throws Exception {
		session.insert(namespace+".create", vo);
	}
	
	//��ۼ���
	@Override
	public void update(ReplyStudyVO vo) throws Exception {
		session.update(namespace+".update", vo);
	}
	
	//��� ����
	@Override
	public void delete(Integer rno) throws Exception {
		session.delete(namespace+".delete", rno);
	}
	
	//������ó��
	@Override
	public List<ReplyStudyVO> listPage(Integer bsBno, Criteria cri) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("bsBno", bsBno);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace+".listPage", paramMap);
	}
	
	//�����ͼ�
	@Override
	public int count(Integer bsBno) throws Exception {
		
		return session.selectOne(namespace+".count", bsBno);
	}
}
