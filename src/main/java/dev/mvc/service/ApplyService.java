package dev.mvc.service;

import java.util.List;
import java.util.Map;

import dev.mvc.domain.ApplyVO;

public interface ApplyService {

	
	//스터디등록
	public void addApply(ApplyVO vo) throws Exception;

	//신청자 불러오기
	public List<ApplyVO> list(Integer bsBno) throws Exception;
	
	//신청했나 않했나
	public ApplyVO apList(Map<String, Object> apmap) throws Exception;
	
	//상태값 업데이트
	public void modifyApply(ApplyVO vo) throws Exception;
	
	//스터디 취소
	public void removeApply(ApplyVO vo) throws Exception;
}
