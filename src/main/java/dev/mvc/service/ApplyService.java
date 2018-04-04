package dev.mvc.service;

import java.util.List;
import java.util.Map;

import dev.mvc.domain.ApplyVO;

public interface ApplyService {

	
	//���͵���
	public void addApply(ApplyVO vo) throws Exception;

	//��û�� �ҷ�����
	public List<ApplyVO> list(Integer bsBno) throws Exception;
	
	//��û�߳� ���߳�
	public ApplyVO apList(Map<String, Object> apmap) throws Exception;
	
	//���°� ������Ʈ
	public void modifyApply(ApplyVO vo) throws Exception;
	
	//���͵� ���
	public void removeApply(ApplyVO vo) throws Exception;
}
