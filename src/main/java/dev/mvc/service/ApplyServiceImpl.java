package dev.mvc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dev.mvc.domain.ApplyVO;
import dev.mvc.persistence.ApplyDAO;
import dev.mvc.persistence.StudyDAO;

@Service
public class ApplyServiceImpl implements ApplyService {

	@Inject
	private ApplyDAO dao;
	
	@Inject
	private StudyDAO studyDAO;
	
	
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
	@Transactional
	@Override
	public void modifyApply(ApplyVO vo) throws Exception {
		
		if(vo.getStatus().equals("O")){
			
			studyDAO.updateNow(vo.getBsBno(), 1);
		}
		
			dao.update(vo);
	}
	
	//���͵� ��� ���
	@Transactional
	@Override
	public void removeApply(ApplyVO vo) throws Exception {
		
		studyDAO.updateNow(vo.getBsBno(), -1);
		
		dao.delete(vo);
	}
}
