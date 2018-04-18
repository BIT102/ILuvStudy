package dev.mvc.persistence;

import java.util.List;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.ReplyStudyVO;

public interface ReplyStudyDAO {

	//댓글 가져오기
	public List<ReplyStudyVO> list(Integer bsBno) throws Exception;
	
	//댓글쓰기
	public void create(ReplyStudyVO vo) throws Exception;
	
	//댓글 수정
	public void update(ReplyStudyVO vo) throws Exception;
	
	//댓글 삭제
	public void delete(Integer rno) throws Exception;
	
	//페이지 처리
	public List<ReplyStudyVO> listPage(Integer bsBno, Criteria cri) throws Exception;
	
	//데이터수
	public int count(Integer bsBno) throws Exception;
	
	//해당게시물번호
	public int getBno(Integer rno) throws Exception;

}
