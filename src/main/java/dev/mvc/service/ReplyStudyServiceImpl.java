package dev.mvc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.ReplyStudyVO;
import dev.mvc.persistence.ReplyStudyDAO;
import dev.mvc.persistence.StudyDAO;

@Service
public class ReplyStudyServiceImpl implements ReplyStudyService{

	@Inject
	private StudyDAO sdao;
	
	@Inject
	private ReplyStudyDAO dao;
	
	//´ñ±Û ºÒ·¯¿À±â
	@Override
	public List<ReplyStudyVO> listReply(Integer bsBno) throws Exception {
		return dao.list(bsBno);
	}
	
	//´ñ±Û µî·Ï
	@Transactional
	@Override
	public void addReply(ReplyStudyVO vo) throws Exception {
		dao.create(vo);
		sdao.upReply(vo.getBsBno(), 1);
	}
	
	//´ñ±Û ¼öÁ¤
	@Override
	public void modifyReply(ReplyStudyVO vo) throws Exception {
		dao.update(vo);
	}
	
	//´ñ±Û »èÁ¦
	@Transactional
	@Override
	public void removeReply(Integer rno) throws Exception {
		
		int bno = dao.getBno(rno);
		
		dao.delete(rno);
		sdao.upReply(bno, -1);
	}
	
	//ÆäÀÌÂ¡
	@Override
	public List<ReplyStudyVO> listReplyPage(Integer bsBno, Criteria cri) throws Exception{
		return dao.listPage(bsBno, cri);
	}
	
	//´ñ±¼½º
	@Override
	public int count(Integer bsBno) throws Exception {
		return dao.count(bsBno);
	}
}
