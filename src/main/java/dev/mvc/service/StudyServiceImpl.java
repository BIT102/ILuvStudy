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
	
<<<<<<< HEAD
	//ī�װ� �ҷ���
	public List<StudyVO> readCa(Integer bno) throws Exception {
		
	
		return dao.readCa(bno);
	}
	
	
	//���͵���, ���ϵ��, �������
=======
	
			
		//���͵���, ���ϵ��
		@Transactional
		@Override
		public void regist(StudyVO vo) throws Exception {

			

			System.out.println("====================");

			System.out.println("registService..........");

			System.out.println(vo);

			System.out.println("====================");

			String[] files = vo.getFiles();

			dao.createStudy(vo);

			// bno �� ��������

			int bno = dao.getBno();

			vo.setBno(bno);
			

			Map<String, Object> map = new HashMap<>();

			for(String fileName : files) {

				if(fileName == files[0]){

					map.put("name", fileName);

					map.put("status", "O");

					map.put("bno", bno);

				} else {

					map.put("name", fileName);

					map.put("status", "X");

					map.put("bno", bno);

				}
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
		@Override
		public int listSearchCount(SearchCriteriaStudy cri) throws Exception {
			return dao.listSearchCount(cri);
		}
		
		//���� �ҷ�����
		@Override
		public List<String> getFile(Integer bsBno) throws Exception {
			return dao.getFile(bsBno);
	
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
	//����
>>>>>>> branch 'HGKWON2' of https://github.com/BIT102/ILuvStudy.git
	@Transactional
	@Override
<<<<<<< HEAD
public void regist(StudyVO vo) throws Exception {
		
		dao.createStudy(vo);

=======
	public void modify(StudyVO vo)throws Exception{
		dao.update(vo);
>>>>>>> branch 'HGKWON2' of https://github.com/BIT102/ILuvStudy.git
		
<<<<<<< HEAD
		//���ϵ���ϱ�
=======
		Integer bno = vo.getBno();
		
		dao.deleteAttach(bno);
		
>>>>>>> branch 'HGKWON2' of https://github.com/BIT102/ILuvStudy.git
		String[] files = vo.getFiles();
<<<<<<< HEAD

		// bno �� ��������

		int bno = dao.getBno();

		vo.setBno(bno);
=======
>>>>>>> branch 'HGKWON2' of https://github.com/BIT102/ILuvStudy.git
		
		if(files == null) {return;}
		
		for(String fileName : files){
			dao.replaceAttach(fileName, bno);
		}
<<<<<<< HEAD
		
		//ī�װ� ����ϱ�
			Map<String, Object> ca = new HashMap<>();
			

			String[] D = vo.getCategoryD();
			String[] S = vo.getCategoryS();
			

		for(int i=0; i<S.length; i++) {
				String caD = D[i];
				
					String caS = S[i];
					
					ca.put("bno", bno);
					ca.put("categoryD", caD);
					ca.put("categoryS", caS);
					
				System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				System.out.println(ca);
				System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
					
					dao.createCa(ca);
				
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
	@Override
	public int listSearchCount(SearchCriteriaStudy cri) throws Exception {
		return dao.listSearchCount(cri);
	}
	
	//���� �ҷ�����
	@Override
	public List<String> getFile(Integer bsBno) throws Exception {
		return dao.getFile(bsBno);
=======

>>>>>>> branch 'HGKWON2' of https://github.com/BIT102/ILuvStudy.git
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
