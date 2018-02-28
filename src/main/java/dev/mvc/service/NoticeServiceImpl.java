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
	
	//공지사항 불러오기
	@Override
	public NoticeVO read(Integer bno) throws Exception {
		return dao.readNotice(bno);
	}
	
	//공지사항 전체
	public List<NoticeVO> noticeList() throws Exception {
		return dao.noticeList();
	}
	
}
