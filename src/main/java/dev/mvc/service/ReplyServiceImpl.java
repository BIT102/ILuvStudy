package dev.mvc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import dev.mvc.domain.Criteria;
import dev.mvc.domain.ReplyVO;
import dev.mvc.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	
	@Inject
	private ReplyDAO dao;
	
		@Override
		public void addReply(ReplyVO vo) throws Exception {

			dao.create(vo);
		}

		@Override
		public List<ReplyVO> listReply(Integer bqBno) throws Exception {
			
			return dao.list(bqBno);
		}

		@Override
		public void modifyReply(ReplyVO vo) throws Exception {

			dao.update(vo);
		}

		@Override
		public void removeReply(Integer rno) throws Exception {

			dao.deleteReply(rno); //deleteReply (QnaDAO)
		}
		
		//¥Ò±€√≥∏Æ ∆‰¿Ã¬°
		@Override
		public List<ReplyVO> listReplyPage(Integer bqBno, Criteria cri) throws Exception {

			return dao.listPage(bqBno, cri);
		}

		@Override
		public int count(Integer bqBno) throws Exception {

			return dao.count(bqBno);
		}
}
