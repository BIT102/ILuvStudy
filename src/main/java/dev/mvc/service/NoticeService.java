package dev.mvc.service;

import java.util.List;

import dev.mvc.commons.Criteria;
import dev.mvc.domain.NoticeVO;

public interface NoticeService {
	
	  
	//�������� �ҷ�����
	public NoticeVO read(Integer ntBno) throws Exception;
	
	//�������� ��ü
	public List<NoticeVO> noticeList() throws Exception;
	
	//�������� ������
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception;
}
