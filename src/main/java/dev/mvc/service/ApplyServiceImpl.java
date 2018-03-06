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
	
	//스터디 등록
	@Override
	public void addApply(ApplyVO vo) throws Exception {
		
		dao.create(vo);
	}
	
	//스터디 신청자 불러오기
	public List<ApplyVO> list(Integer bsBno) throws Exception {
		return dao.list(bsBno);
	}
	
	//상태값 업데이드
	@Override
	public void modifyApply(ApplyVO vo) throws Exception {
		dao.update(vo);
	}
	
	//스터디 등록 취소
	@Override
	public void removeApply(ApplyVO vo) throws Exception {
		dao.delete(vo);
	}
}
