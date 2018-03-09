package dev.mvc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.NoticeVO;
import dev.mvc.domain.SearchCriteria;
import dev.mvc.persistance.NoticeDAO;

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
	@Override
	public List<NoticeVO> noticeList() throws Exception {
		return dao.noticeList();
	}
	
	//페이지당 데이터 불러오기
	@Override
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}
	
	//페이진 전체수
	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}
	
	//검색결과
	@Override
	public List<NoticeVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}
	
	//검색페이징
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}
	
	//공지사항 삭제
	@Override
	public void remove(Integer bno) throws Exception {
		dao.delete(bno);
	}
	
	//수정
	@Override
	public void modify(NoticeVO vo) throws Exception {
		dao.update(vo);
	}
}
