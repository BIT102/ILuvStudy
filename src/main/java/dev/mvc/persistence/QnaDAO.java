package dev.mvc.persistence;

import java.util.List;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.QnaVO;

import dev.mvc.domain.SearchCriteria;

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
	
	//����¡  -> qnaMapper�� SQL�� �ۼ�
	public List<QnaVO> listPage(int page)throws Exception;
	
	//����Ʈ ��� (Criteria��ü�� �Ķ���ͷ� �ް� �ʿ��� getPageStart()�� getPerPageNum()�޼ҵ带 ȣ���� ����� ���
	public List<QnaVO> listCriteria(Criteria cri)throws Exception;
	
	//������
	public int countPaging(Criteria cri)throws Exception;
	
	//����SQL���� �����ϱ� ���� �޼��� (�Ѵ� SearchCriteria�� �Ķ���ͷ� �޾Ƶ��̵��ϼ���)  - page, perPageNum, searchType, keyword ������ ��������
	public List<QnaVO> listSearch(SearchCriteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
	
	
}
