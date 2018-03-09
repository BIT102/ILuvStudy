package dev.mvc.service;

import java.util.List;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.QnaVO;

import dev.mvc.domain.SearchCriteria;

public interface QnaService {

	public void regist(QnaVO board)throws Exception;
	
	public QnaVO read(Integer bno)throws Exception;
	
	public void modify(QnaVO board)throws Exception;
	
	public void remove(Integer bno)throws Exception;
	
	public List<QnaVO> listAll() throws Exception;
	
	public List<QnaVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri)throws Exception;
	
	//µ¿ÀûSQL
	public List<QnaVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
	
}
