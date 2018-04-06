package dev.mvc.persistence;

import java.util.List;
import java.util.Map;

import dev.mvc.domain.ApplyVO;

public interface ApplyDAO {
	
	//스터디 신청
	public void create(ApplyVO vo) throws Exception;
	
	//신청자 불러오기
	public List<ApplyVO> list(Integer bsBno) throws Exception;
	
	//신청자 구별하기위해 불러옵니다
	public ApplyVO apList(Map<String, Object> apmap) throws Exception;
	
	//상태값 수정
	public void update(ApplyVO vo) throws Exception;
	
	//스터디 취소
	public void delete(ApplyVO vo) throws Exception;

}
