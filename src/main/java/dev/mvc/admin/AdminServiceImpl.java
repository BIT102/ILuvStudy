package dev.mvc.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{

	@Inject
	private AdminDAO dao;
	
	@Override
	public AdminVO login(AdminDTO dto) throws Exception{
		return dao.login(dto);
	}
	
	@Override
	public void loginupdate(Object adminVO) throws Exception{
		dao.loginupdate(adminVO);
	}
	
	@Override
	public List<AdminVO> adminListAll() throws Exception{
		return dao.adminListAll();
	}
	
	@Override
	public AdminVO adminDetail(Integer bno)throws Exception{
		return dao.adminDetail(bno);
	}
}
