package dev.mvc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dev.mvc.admin.Criteria;
import dev.mvc.domain.AdminVO;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.AdminDTO;
import dev.mvc.persistance.AdminDAO;

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
	
	@Override
	public List<UserVO> userList(Criteria cri) throws Exception{
		return dao.userList(cri);
	}
	
	@Override
	public int userCountPaging(Criteria cri)throws Exception{
		return dao.userCountPaging(cri);
	}
	
	@Override
	public UserVO userDetail(Integer bno)throws Exception{
		return dao.userDetail(bno);
	}
	
	@Override
	public void userUpdate(UserVO vo)throws Exception{
		dao.userUpdate(vo);
	}
	
	@Override
	public List<UserVO> studyList(Criteria cri) throws Exception{
		return dao.studyList(cri);
	}
	
	@Override
	public int studyCountPaging(Criteria cri)throws Exception{
		return dao.studyCountPaging(cri);
	}
}
