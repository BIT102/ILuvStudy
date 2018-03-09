package dev.mvc.persistence;

import java.util.List;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.NoticeVO;
import dev.mvc.domain.SearchCriteria;

public interface NoticeDAO {

	//�������� �Խù� �ҷ�����  
	public NoticeVO readNotice(Integer bno) throws Exception;
	
	//��ü�Խù�  
	public List<NoticeVO> noticeList() throws Exception;
	
	//����¡ ó��
	public List<NoticeVO> listPage(int page) throws Exception;
	
	//������ ������ �ҷ�����
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception;
	
	//������ �����͸� ���� ��ü�� ��ȯ �� �� �ְ�
	public int countPaging(Criteria cri) throws Exception;
	
	//�˻�����Ʈ������
	public List<NoticeVO> listSearch(SearchCriteria cri) throws Exception;
	
	//�˻��ϱ� ���ؼ�
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	//���� (�����ڸ�)
	public void delete(Integer bno) throws Exception; 
	
	//����(�����ڸ�)
	public void update(NoticeVO vo) throws Exception;
}
