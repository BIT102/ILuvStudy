package dev.mvc.service;

import java.util.List;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.NoticeVO;
import dev.mvc.domain.SearchCriteria;

public interface NoticeService {
	
	  
	//�������� �ҷ�����
	public NoticeVO read(Integer bno) throws Exception;
	
	//�������� ��ü
	public List<NoticeVO> noticeList() throws Exception;
	
	//�������� ������ �ҷ�����
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception;
	
	//����¡ ��������ü
	public int listCountCriteria(Criteria cri) throws Exception;
	
	//�˻�����Ʈ
	public List<NoticeVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	
	//����¡ó��
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	//�������� ����
	public void remove(Integer bno) throws Exception;
	
	//�������� ����
	public void modify(NoticeVO vo) throws Exception;
}
