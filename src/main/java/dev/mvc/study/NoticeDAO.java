package dev.mvc.study;

import java.util.List;

public interface NoticeDAO {

	//�������� �Խù� �ҷ�����  
	public NoticeVO readNotice(Integer ntBno) throws Exception;
	
	//��ü�Խù�  
	public List<NoticeVO> noticeList() throws Exception;
	
	//������ ó��
	public List<NoticeVO> listPage(int page) throws Exception;
	
	//�������� ������
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception;
	
}
