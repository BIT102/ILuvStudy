package dev.mvc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dev.mvc.domain.BookmarkVO;
import dev.mvc.persistence.BookmarkDAO;

@Service
public class BookmarkServiceImpl implements BookmarkService {

	@Inject
	private BookmarkDAO dao;
	
	//�ϸ�ũ���
	@Override
	public void addBookmark(BookmarkVO vo) throws Exception {
		dao.create(vo);
	}
	
	//�ϸ�ũ �ҷ�����
	@Override
	public List<BookmarkVO> listBookmark(Integer bsBno) throws Exception {
		return dao.list(bsBno);
	}
	
	//�ϸ�ũ ���
	@Override
	public void removeBookmark(Integer bsBno, String userEmail) throws Exception {
		dao.delete(bsBno, userEmail);
	}
}
