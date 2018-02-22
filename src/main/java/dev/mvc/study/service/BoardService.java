package dev.mvc.study.service;

import java.util.List;

import dev.mvc.study.domain.BoardVO;

public interface BoardService {

	public void regist(BoardVO board)throws Exception;
	
	public BoardVO read(Integer bno)throws Exception;
	
	public List<BoardVO> listAll() throws Exception;
}
