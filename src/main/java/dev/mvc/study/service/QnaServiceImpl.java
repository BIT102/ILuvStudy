package dev.mvc.study.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dev.mvc.study.domain.Criteria;
import dev.mvc.study.domain.QnaVO;
import dev.mvc.study.persistence.QnaDAO;

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
}
