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
	public void modify(AdminVO vo) throws Exception{
		dao.update(vo);
	}
	
	@Override
	public List<AdminVO> adminListAll() throws Exception{
		return dao.adminListAll();
	}
}
