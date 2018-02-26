package dev.mvc.admin;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.AdminMapper";
	
	@Override
	public AdminVO login(AdminDTO dto)throws Exception{
		return session.selectOne(namespace + ".adminLogin", dto);  //�α��� ���� ���� ã��
	}
	
	@Override
	public void loginupdate(Object adminVO)throws Exception{
		session.update(namespace + ".adminLastLogin", adminVO);  //�ֱ� ������ ������Ʈ
	}
	
	@Override
	public List<AdminVO> adminList(Criteria cri) throws Exception{
		return session.selectList(namespace + ".adminList", cri);  //������ ���� ���� ����Ʈ,����¡ 
	}
	
	@Override
	public AdminVO adminDetail(Integer bno)throws Exception{
		return session.selectOne(namespace + ".adminDetail", bno);  // ������ ���� ���� �� ������
	}
	
	@Override
	public void adminUpdate(AdminVO vo)throws Exception{
		session.update(namespace + ".adminUpdate", vo);   // ������ ���� ���� ����
	}
	
	@Override
	public void adminRegister(AdminVO vo)throws Exception{
		session.insert(namespace + ".adminRegister", vo);  // ������ ���� ���� ���
	}
	
	@Override
	public List<AdminVO> adminListPage(int page)throws Exception{
		if(page<=0){
			page = 1;
		}
		
		page = (page-1)*10;
		
		return session.selectList(namespace + ".adminListPage", page); // ������ ���� ����Ʈ ������ ����¡ ó��
	}
	
	@Override
	public int adminCountPaging(Criteria cri)throws Exception{
		return session.selectOne(namespace + ".adminCountPaging", cri); // totalCount ��ȯ
	}
}