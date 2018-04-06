package dev.mvc.persistence;

import java.util.List;
import java.util.Map;

import dev.mvc.domain.ApplyVO;

public interface ApplyDAO {
	
	//���͵� ��û
	public void create(ApplyVO vo) throws Exception;
	
	//��û�� �ҷ�����
	public List<ApplyVO> list(Integer bsBno) throws Exception;
	
	//��û�� �����ϱ����� �ҷ��ɴϴ�
	public ApplyVO apList(Map<String, Object> apmap) throws Exception;
	
	//���°� ����
	public void update(ApplyVO vo) throws Exception;
	
	//���͵� ���
	public void delete(ApplyVO vo) throws Exception;

}
