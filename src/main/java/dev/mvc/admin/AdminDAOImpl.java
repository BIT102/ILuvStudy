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
		return session.selectOne(namespace + ".adminlogin", dto);  //로그인 계정 정보 찾음
	}
	
	@Override
	public void loginupdate(Object adminVO)throws Exception{
		session.update(namespace + ".adminlastlogin", adminVO);  //최근 접속일 업데이트
	}
	
	@Override
	public List<AdminVO> adminListAll() throws Exception{
		return session.selectList(namespace + ".adminlistAll");  //관리자 계정 정보 가져옴
	}
	
	@Override
	public AdminVO adminDetail(Integer bno)throws Exception{
		return session.selectOne(namespace + ".adminDetail", bno);
	}
}