package dev.mvc.persistance;

import java.util.List;

import dev.mvc.commons.Criteria;
import dev.mvc.domain.NoticeVO;

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
