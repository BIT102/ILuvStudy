package dev.mvc.study;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private NoticeDAO dao;
	
	//공지사항 불러오기
	@Override
	public NoticeVO read(Integer ntBno) throws Exception {
		return dao.readNotice(ntBno);
	}
	
	//공지사항 전체
	public List<NoticeVO> noticeList() throws Exception {
		return dao.noticeList();
	}
	
}
