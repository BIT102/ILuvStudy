package dev.mvc.study.persistence;

import java.util.List;

import dev.mvc.study.domain.QnaVO;

public interface QnaDAO {

	//qna�ۼ�
	public void create(QnaVO vo)throws Exception;
	
	//qna�Խñ���ȸ
	public QnaVO read(Integer bno)throws Exception;
	
	//qna����
	public void update(QnaVO vo)throws Exception;
	
	//qna����
	public void delete(Integer bno)throws Exception;
	
	//qna��ü�����ȸ
	public List<QnaVO> listAll()throws Exception;
}
