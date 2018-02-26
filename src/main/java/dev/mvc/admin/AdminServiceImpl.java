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
	public List<AdminVO> adminList(Criteria cri) throws Exception{
		return dao.adminList(cri);
	}
	
	@Override
	public AdminVO adminDetail(Integer bno)throws Exception{
		return dao.adminDetail(bno);
	}
	
	@Override
	public void adminUpdate(AdminVO vo)throws Exception{
		dao.adminUpdate(vo);
	}
	
	@Override
	public void adminRegister(AdminVO vo)throws Exception{
		dao.adminRegister(vo);
	}
	
	@Override
	public int adminCountPaging(Criteria cri)throws Exception{
		return dao.adminCountPaging(cri);
	}
	
}
