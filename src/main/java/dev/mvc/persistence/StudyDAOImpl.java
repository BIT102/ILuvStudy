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

	
	//��ۼ� ��
		@Override
		public void upReply(Integer bno, int amount) throws Exception {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("bno", bno);
			map.put("amount", amount);
			
			session.update(namespace + ".updateReplyCnt", map);
		}
	
	
	//ī�װ����
		@Override
		public void createCa(Map<String, Object> map) throws Exception {
			 session.insert(namespace+".createCa", map);
		}
		
	//ī�װ� ����������
		@Override
		public void caDelete(Integer bsBno) throws Exception {
			session.delete(namespace+".caDelete", bsBno); 
		}
		
		//���ϵ� ����������
		@Override
		public void atDelete(Integer bsBno) throws Exception {
			session.delete(namespace+".atDelete", bsBno);
		}
		
	//���͵� ����
	@Override
	public void update(StudyVO vo) throws Exception {

		session.update(namespace+".update", vo);
	}
	 
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
	
	//�ð��� ���� ����մϴ�
	public void clock(Map<String, Object> map) throws Exception {
		session.insert(namespace+".clock", map);
	}
	
	//�ð� �����
	public void deleteClock(Integer bsBno) throws Exception {
		session.delete(namespace+".deleteClock", bsBno);
	}

	//������ �ҷ��´�
	public List<String> getStart(Integer bsBno) throws Exception {
		return session.selectList(namespace+".getStart", bsBno);
	}
	
	//��¥�ҷ�����
	public List<String> getStet(Map<String, Object> map) throws Exception {
		return session.selectList(namespace+".getStet", map);
	}
	
	// ī�װ� ���� ����
	@Override
	public List<StudyVO> studyCategory() throws Exception{
		return session.selectList(namespace + ".studyCategory");  //study ī�װ� ����
	}
	
	@Override
	public List<StudyVO> studyCategory2(String cDId) throws Exception{
		return session.selectList(namespace + ".studyCategory2", cDId);  //study ī�װ� �Һз� ������
	}
	
	@Override
	public List<StudyVO> region() throws Exception{
		return session.selectList(namespace + ".region");   //���� ���� ��з� ������  
	}
	
	@Override
	public List<StudyVO> region2(String rDId) throws Exception{
		return session.selectList(namespace + ".region2", rDId);   //���� ���� �Һз� ������  
	}
		
	//ī�װ� �ҷ�����
	@Override
	public List<StudyVO> readCa(Integer bno) throws Exception {
		return session.selectList(namespace+".readCa", bno);
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
	
	@Override
	public void deleteFile(Integer bsBno, String fileName) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("bsBno", bsBno);
		map.put("fileName", fileName);
		
		session.delete(namespace+".deleteFile", map);
	}
	
	
	//���ε带 ���� ���� �ҷ�����
	@Override
	public List<String> getFileup(Integer bsBno) throws Exception {
		
		return session.selectList(namespace+".getFileup", bsBno);
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
		System.out.println("========================================");
		System.out.println("dbtest");
		System.out.println(session.selectList(namespace+".listSearch", cri));
		System.out.println("========================================");
		return session.selectList(namespace+".listSearch", cri);
	}
	
	//�湮�ڼ� ����Ʈ�� ���� ������
	@Override
	public List<StudyVO> vctList(SearchCriteriaStudy cri) throws Exception {
		
		return session.selectList(namespace+".vctList", cri);
	}
	
	//���ο� ����Ʈ�� ���� ������ ����������
	@Override
	public List<StudyVO> newList(SearchCriteriaStudy cri) throws Exception {
		return session.selectList(namespace+".newList", cri);
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

}
