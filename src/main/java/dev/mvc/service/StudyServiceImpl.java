package dev.mvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import dev.mvc.domain.CriteriaStudy;
import dev.mvc.domain.SearchCriteriaStudy;
import dev.mvc.domain.StudyVO;
import dev.mvc.persistence.StudyDAO;

@Service
public class StudyServiceImpl implements StudyService {

	@Inject
	private StudyDAO dao;
	
	//���͵���, ���ϵ��
	@Transactional
	@Override
	public void regist(StudyVO vo) throws Exception {
		
		
		String[] files = vo.getFiles();
	
		if(files == null) return;
		
		
		Map<String, String> map = new HashMap<>();
		for(String fileName : files) {
			if(fileName == files[0]){
				map.put("name", fileName);
				map.put("status", "O");
			} else {
				map.put("name", fileName);
				map.put("status", "X");
			}
			dao.createStudy(vo);

			dao.addFile(map);
		}
	
	}
	
	//���͵� �ҷ�����
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public StudyVO read(Integer bno) throws Exception {
		dao.upVct(bno);
		return dao.readStudy(bno);
	}
	
	//��ü�ҷ�����
	@Override
	public List<StudyVO> studyList() throws Exception {
		return dao.studyList();
	}
	
	//�������� ������ �ҷ�����
	@Override
	public List<StudyVO> listCriteria(CriteriaStudy cri) throws Exception {
		return dao.listCriteria(cri);
	}
	
	//������ ��ü��
	@Override
	public int listCountCriteria(CriteriaStudy cri) throws Exception {
		return dao.countPaging(cri);
	}
	
	//��������ϱ�
	@Override
	public void remove(Integer bno) throws Exception {
		dao.delete(bno);
	}
	
	//�˻�
	@Override
	public List<StudyVO> listSearchCriteria(SearchCriteriaStudy cri) throws Exception {
		return dao.listSearch(cri);
	}
	
	//�˻���
	public int listSearchCount(SearchCriteriaStudy cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public List<StudyVO> catList() throws Exception {
		return dao.catList();
	}

	@Override
	public List<StudyVO> catList2(String csId) throws Exception {
		return dao.catList2(csId);
	}

	@Override
	public List<StudyVO> rgList() throws Exception {
		return dao.rgList();
	}
	
	@Override
	public List<StudyVO> rgList2(String rsId) throws Exception {
		return dao.rgList2(rsId);
	}

}
