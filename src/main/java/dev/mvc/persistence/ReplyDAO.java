package dev.mvc.persistence;

import java.util.List;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.ReplyVO;

public interface ReplyDAO {
	//ReplyDAO
		public List<ReplyVO> list(Integer bqBno)throws Exception;
		
		public void create(ReplyVO vo) throws Exception;
		
		public void update(ReplyVO vo)throws Exception;
		
		public void deleteReply(Integer rno)throws Exception;
		
		//����� ����¡
		
		public List<ReplyVO> listPage(
				Integer bqBno, Criteria cri)throws Exception;//�Խù� ��ȣ�� �´� �����͸� �˻��ϱ����� bqBno
		
		public int count(Integer bqBno)throws Exception;//�Խù��� ��� ���� �ʿ��ϹǷ�   count()
}
