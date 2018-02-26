package dev.mvc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dev.mvc.commons.Criteria;
import dev.mvc.domain.NoticeVO;
import dev.mvc.persistance.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject  
	private NoticeDAO dao;
	
	//�������� �ҷ�����
	@Override
	public NoticeVO read(Integer ntBno) throws Exception {
		return dao.readNotice(ntBno);
	}
	
	//�������� ��ü
	public List<NoticeVO> noticeList() throws Exception {
		return dao.noticeList();
	}
	
	//�������� ������
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}
	
}
