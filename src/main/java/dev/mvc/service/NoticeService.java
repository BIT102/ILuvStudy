package dev.mvc.service;

import java.util.List;

import dev.mvc.domain.NoticeVO;

public interface NoticeService {
	
	  
	//�������� �ҷ�����
	public NoticeVO read(Integer bno) throws Exception;
	
	//�������� ��ü
	public List<NoticeVO> noticeList() throws Exception;
}
