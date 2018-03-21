package dev.mvc.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import dev.mvc.domain.CriteriaStudy;
import dev.mvc.domain.SearchCriteriaStudy;
import dev.mvc.domain.StudyVO;

@Repository
public class StudyDAOImpl implements StudyDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "dev.mvc.mapper.StudyMapper";
	private static final Logger logger = LoggerFactory.getLogger(StudyDAOImpl.class);


	@Override
	public String getcaD(Integer bno) throws Exception {
		
		return session.selectOne(namespace+".getcaD", bno);
	}
	
	@Override
	public List<String> getcaS(Integer bno) throws Exception {
		return session.selectList(namespace+".getcaS", bno);
	}
	
	
	//���͵���
	@Override
	public void createStudy(StudyVO vo) throws Exception {
		session.insert(namespace+".createStudy", vo);
	}
	
	
	//ī�װ����
	public void createCa(Map<String, Object> map) throws Exception {
		 session.insert(namespace+".createCa", map);
	}

	
	//���͵� �ҷ�����
	@Override
	public StudyVO readStudy(Integer bno) throws Exception {
		
		// ������ ���������� ���ϰ��� �������� �ɼ� �����Ƿ� ���ϰ��� �迭�� ��´�.
		List<StudyVO> vo = session.selectList(namespace+".readStudy", bno);
		
		StudyVO resultVo = vo.get(0); // ���Ӱ� ������ resultVo�� �ٸ� ������ �����ֱ�����.
		String[] resultFiles = new String[vo.size()];

		for(int i = 0; i<vo.size(); i++){
			resultFiles[i] = resultVo.getName();		
		}
		
		resultVo.setFiles(resultFiles);
		
		return resultVo;
	}
	
	//���͵���ü
	@Override
	public List<StudyVO> studyList() throws Exception {
		return session.selectList(namespace+".studyList");
	}

	//���Ͼ��ε�
	@Override
	public void addFile(Map<String, Object> map) throws Exception {
		System.out.println("============================");
		System.out.println(map);
		System.out.println("============================");
		
		session.insert(namespace+".addFile", map);
		
	}
	
	//���Ϻҷ�����
	@Override
	public List<String> getFile(Integer bsBno) throws Exception {
		
		return session.selectList(namespace+".getFile", bsBno);
	}
	

	//��ȸ�� �ø���
	@Override
	public void upVct(Integer bno) throws Exception {
		session.update(namespace+".upVct", bno);
	}
	
	//������ó��
	@Override
	public List<StudyVO> listPage(int page) throws Exception {
		
		if( page <= 0) {
			page = 1;			
		}
		
		page = (page-1)*9;
		
		return session.selectList(namespace+".listPage", page);
	}
	
	//�������� ������ �ҷ�����
	@Override
	public List<StudyVO> listCriteria(CriteriaStudy cri) throws Exception {
		return session.selectList(namespace+".listCriteria", cri);
	}
	
	//����¡ ���� �ҷ�����
	@Override
	public int countPaging(CriteriaStudy cri) throws Exception {
		return session.selectOne(namespace+".countPaging", cri);
	}
	
	//�������� �����ϱ�
	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace+".delete", bno);
	}
	
	//�˻�
	@Override
	public List<StudyVO> listSearch(SearchCriteriaStudy cri) throws Exception {
		return session.selectList(namespace+".listSearch", cri);
	}
	
	//�˻���
	@Override
	public int listSearchCount(SearchCriteriaStudy cri) throws Exception {
		return session.selectOne(namespace+".listSearchCount", cri);
	}
	
	//��Ʈ��Ʈ�� �����ϱ�
	@Override
	public int getBno() throws Exception {
		return session.selectOne(namespace+".getNextBno");
	}
	
	//�����ο��� �ø���
	@Override
	public void updateNow(Integer bno, int amount) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("bno", bno);
		map.put("amount", amount);
		
		session.update(namespace+".updateNow", map);
	}
	
	@Override
	public List<StudyVO> catList() throws Exception {

		return session.selectList(namespace+".catList");
	}

	

	@Override
	public List<StudyVO> catList2(String csId) throws Exception {
		return session.selectList(namespace+".catList2", csId);
	}

	@Override
	public List<StudyVO> rgList() throws Exception {
		return session.selectList(namespace+".rgList");
	}

	@Override
	public List<StudyVO> rgList2(String rsId) throws Exception {
		return session.selectList(namespace+".rgList2", rsId);
	}

	@Override
	public void update(StudyVO vo) throws Exception {
		session.update(namespace+".update", vo);
	}
	
	@Override
	public void deleteAttach(Integer bno) throws Exception {

		session.delete(namespace+".deleteAttach", bno);
		
	}

	@Override
	public void replaceAttach(String fullName, Integer bno) throws Exception {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("bno", bno);
		paramMap.put("fullName", fullName);
		
		session.insert(namespace+".replaceAttach", paramMap);
		
	}

}
