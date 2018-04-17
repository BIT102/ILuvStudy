package dev.mvc.persistence;

import java.util.List;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.ReplyStudyVO;

public interface ReplyStudyDAO {

	//��� ��������
	public List<ReplyStudyVO> list(Integer bsBno) throws Exception;
	
	//��۾���
	public void create(ReplyStudyVO vo) throws Exception;
	
	//��� ����
	public void update(ReplyStudyVO vo) throws Exception;
	
	//��� ����
	public void delete(Integer rno) throws Exception;
	
	//������ ó��
	public List<ReplyStudyVO> listPage(Integer bsBno, Criteria cri) throws Exception;
	
	//�����ͼ�
	public int count(Integer bsBno) throws Exception;
	
	//�ش�Խù���ȣ
	public int getBno(Integer rno) throws Exception;

}
