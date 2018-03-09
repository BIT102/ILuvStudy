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
		
		//댓글의 페이징
		
		public List<ReplyVO> listPage(
				Integer bqBno, Criteria cri)throws Exception;//게시물 번호에 맞는 데이터를 검색하기위해 bqBno
		
		public int count(Integer bqBno)throws Exception;//게시물의 댓글 수가 필요하므로   count()
}
