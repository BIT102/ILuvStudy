package dev.mvc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.ReplyStudyVO;
import dev.mvc.persistance.ReplyStudyDAO;

@Service
public class ReplyStudyServiceImpl implements ReplyStudyService{

	@Inject
	private ReplyStudyDAO dao;
	
	//´ñ±Û ºÒ·¯¿À±â
	@Override
	public List<ReplyStudyVO> listReply(Integer bsBno) throws Exception {
		return dao.list(bsBno);
	}
	
	//´ñ±Û µî·Ï
	@Override
	public void addReply(ReplyStudyVO vo) throws Exception {
		dao.create(vo);
	}
	
	//´ñ±Û ¼öÁ¤
	@Override
	public void modifyReply(ReplyStudyVO vo) throws Exception {
		dao.update(vo);
	}
	
	//´ñ±Û »èÁ¦
	@Override
	public void removeReply(Integer rno) throws Exception {
		dao.delete(rno);
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
