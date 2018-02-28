package dev.mvc.persistance;

import java.util.List;

import dev.mvc.domain.NoticeVO;

public interface NoticeDAO {

	//�������� �Խù� �ҷ�����  
	public NoticeVO readNotice(Integer bno) throws Exception;
	
	//��ü�Խù�  
	public List<NoticeVO> noticeList() throws Exception;
	
}
