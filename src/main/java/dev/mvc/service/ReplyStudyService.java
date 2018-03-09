package dev.mvc.service;

import java.util.List;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.ReplyStudyVO;

public interface ReplyStudyService {

	//��� �ҷ�����
	public List<ReplyStudyVO> listReply(Integer bsBno) throws Exception;
	
	//��� ���
	public void addReply(ReplyStudyVO vo) throws Exception;
	
	//��� ����
	public void modifyReply(ReplyStudyVO vo) throws Exception;
	
	//��� ����
	public void removeReply(Integer rno) throws Exception;
	
	//��� ����¡
	public List<ReplyStudyVO> listReplyPage(Integer bsBno, Criteria cri) throws Exception;

	//��� ��
	public int count(Integer bsBno) throws Exception;
} 
