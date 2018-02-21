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
		return session.selectOne(namespace + ".adminlogin", dto);  //�α��� ���� ���� ã��
	}
	
	@Override
	public void loginupdate(Object adminVO)throws Exception{
		session.update(namespace + ".adminlastlogin", adminVO);  //�ֱ� ������ ������Ʈ
	}
	
	@Override
	public List<AdminVO> adminListAll() throws Exception{
		return session.selectList(namespace + ".adminlistAll");  //������ ���� ���� ������
	}
	
	@Override
	public AdminVO adminDetail(Integer bno)throws Exception{
		return session.selectOne(namespace + ".adminDetail", bno);
	}
}