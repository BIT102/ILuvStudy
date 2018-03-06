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
	
	//��� �ҷ�����
	@Override
	public List<ReplyStudyVO> listReply(Integer bsBno) throws Exception {
		return dao.list(bsBno);
	}
	
	//��� ���
	@Override
	public void addReply(ReplyStudyVO vo) throws Exception {
		dao.create(vo);
	}
	
	//��� ����
	@Override
	public void modifyReply(ReplyStudyVO vo) throws Exception {
		dao.update(vo);
	}
	
	//��� ����
	@Override
	public void removeReply(Integer rno) throws Exception {
		dao.delete(rno);
	}
	
	//����¡
	@Override
	public List<ReplyStudyVO> listReplyPage(Integer bsBno, Criteria cri) throws Exception{
		return dao.listPage(bsBno, cri);
	}
	
	//�񱼽�
	@Override
	public int count(Integer bsBno) throws Exception {
		return dao.count(bsBno);
	}
}
