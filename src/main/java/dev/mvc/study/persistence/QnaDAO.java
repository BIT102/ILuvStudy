package dev.mvc.study.persistence;

import java.util.List;

import dev.mvc.study.domain.QnaVO;

public interface QnaDAO {

	//qna작성
	public void create(QnaVO vo)throws Exception;
	
	//qna게시글조회
	public QnaVO read(Integer bno)throws Exception;
	
	//qna수정
	public void update(QnaVO vo)throws Exception;
	
	//qna삭제
	public void delete(Integer bno)throws Exception;
	
	//qna전체목록조회
	public List<QnaVO> listAll()throws Exception;
}
