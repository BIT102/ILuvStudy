package dev.mvc.study;

import java.util.List;

public interface NoticeService {
	
	  
	//�������� �ҷ�����
	public NoticeVO read(Integer ntBno) throws Exception;
	
	//�������� ��ü
	public List<NoticeVO> noticeList() throws Exception;
}
