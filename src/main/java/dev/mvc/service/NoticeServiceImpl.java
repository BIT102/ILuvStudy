package dev.mvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.NoticeVO;
import dev.mvc.domain.SearchCriteria;
import dev.mvc.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject  
	private NoticeDAO dao;
	
	//�������� �ҷ�����
	@Override
	public NoticeVO read(Integer bno) throws Exception {
		return dao.readNotice(bno);
	}
	
	//�������� ��ü
	@Override
	public List<NoticeVO> noticeList() throws Exception {
		return dao.noticeList();
	}
	
	//�������� ������ �ҷ�����
	@Override
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}
	
	//������ ��ü��
	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}
	
	//�˻����
	@Override
	public List<NoticeVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}
	
	//�˻�����¡
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}
	
	//�������� ����
	@Override
	public void remove(Integer bno) throws Exception {
		dao.delete(bno);
	}
	
	//����
	@Override
	public void modify(NoticeVO vo) throws Exception {
		dao.update(vo);
	}
	
	//�̹��� ���
	@Override
	public void insertImg(NoticeVO vo) throws Exception { 
		
		String files = vo.getPhoto();
		int bno = vo.getBno();

		Map<String, Object> map = new HashMap<>();
		
		map.put("photo", files);
		map.put("bno", bno);
		
		dao.insertImg(map);
	}
}
