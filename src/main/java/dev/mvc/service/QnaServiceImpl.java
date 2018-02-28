package dev.mvc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.QnaVO;
import dev.mvc.domain.ReplyVO;
import dev.mvc.domain.SearchCriteria;
import dev.mvc.persistence.QnaDAO;

@Service
public class QnaServiceImpl implements QnaService {

	@Inject
	private QnaDAO dao;
	
	@Override
	public void regist(QnaVO board)throws Exception{
		dao.create(board);
	}

	@Override
	public QnaVO read(Integer bno) throws Exception {
		return dao.read(bno);
	}

	@Override
	public void modify(QnaVO board) throws Exception {
		dao.update(board);
	}

	@Override
	public void remove(Integer bno) throws Exception {
		System.out.println("delete_1");
		dao.delete(bno);
	}

	@Override
	public List<QnaVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<QnaVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {

		return dao.countPaging(cri);
	}

	@Override
	public List<QnaVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return dao.listSearchCount(cri);
	}
//reply
	@Override
	public void addReply(ReplyVO vo) throws Exception {

		dao.create(vo);
	}

	@Override
	public List<ReplyVO> listReply(Integer bqBno) throws Exception {
		
		return dao.list(bqBno);
	}

	@Override
	public void modifyReply(ReplyVO vo) throws Exception {

		dao.update(vo);
	}

	@Override
	public void removeReply(Integer rno) throws Exception {

		dao.deleteReply(rno); //deleteReply (QnaDAO)
	}

	@Override
	public List<ReplyVO> listReplyPage(Integer bqBno, Criteria cri) throws Exception {

		return dao.listPage(bqBno, cri);
	}

	@Override
	public int count(Integer bqBno) throws Exception {

		return dao.count(bqBno);
	}
}
