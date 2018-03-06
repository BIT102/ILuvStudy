package dev.mvc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dev.mvc.domain.ApplyVO;
import dev.mvc.persistance.ApplyDAO;

@Service
public class ApplyServiceImpl implements ApplyService {

	@Inject
	private ApplyDAO dao;
	
	//���͵� ���
	@Override
	public void addApply(ApplyVO vo) throws Exception {
		
		dao.create(vo);
	}
	
	//���͵� ��û�� �ҷ�����
	public List<ApplyVO> list(Integer bsBno) throws Exception {
		return dao.list(bsBno);
	}
	
	//���°� �����̵�
	@Override
	public void modifyApply(ApplyVO vo) throws Exception {
		dao.update(vo);
	}
	
	//���͵� ��� ���
	@Override
	public void removeApply(ApplyVO vo) throws Exception {
		dao.delete(vo);
	}
}
