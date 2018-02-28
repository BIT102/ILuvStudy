package dev.mvc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dev.mvc.domain.NoticeVO;
import dev.mvc.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject  
	private NoticeDAO dao;
	
	//�������� �ҷ�����
	@Override
	public NoticeVO read(Integer bno) throws Exception {
		return dao.readNotice(bno);
	}
	
	//�������� ��ü
	public List<NoticeVO> noticeList() throws Exception {
		return dao.noticeList();
	}
	
}
