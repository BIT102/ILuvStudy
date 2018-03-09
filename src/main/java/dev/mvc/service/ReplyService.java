package dev.mvc.service;

import java.util.List;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.ReplyVO;

public interface ReplyService {

	//replyService
		public void addReply(ReplyVO vo)throws Exception;
		
		public List<ReplyVO> listReply(Integer bqBno)throws Exception;
		
		public void modifyReply(ReplyVO vo)throws Exception;
		
		public void removeReply(Integer rno)throws Exception;
		
		//¥Ò±€√≥∏Æ ∆‰¿Ã¬°
		public List<ReplyVO> listReplyPage(Integer bqBno, Criteria cri)throws Exception;
		
		public int count(Integer bqBno)throws Exception;
}
