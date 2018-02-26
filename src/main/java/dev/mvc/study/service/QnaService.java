package dev.mvc.study.service;

import java.util.List;

import dev.mvc.study.domain.Criteria;
import dev.mvc.study.domain.QnaVO;

public interface QnaService {

	public void regist(QnaVO board)throws Exception;
	
	public QnaVO read(Integer bno)throws Exception;
	
	public void modify(QnaVO board)throws Exception;
	
	public void remove(Integer bno)throws Exception;
	
	public List<QnaVO> listAll() throws Exception;
	
	public List<QnaVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri)throws Exception;
	

}
