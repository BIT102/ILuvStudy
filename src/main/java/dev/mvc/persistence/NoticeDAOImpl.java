package dev.mvc.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.NoticeVO;
import dev.mvc.domain.SearchCriteria;

@Repository  
public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.NoticeMapper";
	
	//�������� �ҷ�����
	@Override
	public NoticeVO readNotice(Integer bno) throws Exception {
		return session.selectOne(namespace+".readNotice", bno);
	}
	
	//��ü �ҷ�����
	public List<NoticeVO> noticeList() throws Exception {
		System.out.println("noticeList=======================");
		return session.selectList(namespace+".noticeList");
	}
	
	//������ó��
	@Override
	public List<NoticeVO> listPage(int page) throws Exception {
		
		if( page <= 0) {
			page = 1;			
		}
		
		page = (page-1)*10;
		
		return session.selectList(namespace+".listPage", page);
	}
	
	//�������� ������ �ҷ�����
	@Override
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace+".listCriteria", cri);
	}
	
	//����¡ ���� �ҷ�����
	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace+".countPaging", cri);
	}
	
	//�˻��սô�
	@Override
	public List<NoticeVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace+".listSearch", cri);
	}
	//�˻���
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace+".listSearchCount", cri);
	}
	
	//�������� ����
	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace+".delete", bno);
	}
	
	//�������� ����
	public void update(NoticeVO vo) throws Exception {
		session.update(namespace+".update", vo);
	}
}
