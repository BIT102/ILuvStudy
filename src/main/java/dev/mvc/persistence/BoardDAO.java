package dev.mvc.persistence;

import java.util.List;

import dev.mvc.domain.BoardVO;

public interface BoardDAO {
	
	public void insertStudy(BoardVO vo)throws Exception;;
	
	public BoardVO read(Integer bno)throws Exception;
	
	public List<BoardVO> listAll()throws Exception;
}