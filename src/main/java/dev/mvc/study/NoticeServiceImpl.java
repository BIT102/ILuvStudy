package dev.mvc.study;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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
	
}
