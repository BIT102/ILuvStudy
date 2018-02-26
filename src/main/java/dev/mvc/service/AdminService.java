package dev.mvc.service;

import java.util.List;

import dev.mvc.admin.Criteria;
import dev.mvc.domain.AdminVO;
import dev.mvc.dto.AdminDTO;

public interface AdminService {
	public AdminVO login(AdminDTO dto) throws Exception;
	public void loginupdate(Object adminVO) throws Exception;
	public List<AdminVO> adminList(Criteria cri) throws Exception;
	public AdminVO adminDetail(Integer bno)throws Exception;
	public void adminUpdate(AdminVO vo)throws Exception;
	public void adminRegister(AdminVO vo)throws Exception;
	public int adminCountPaging(Criteria cri)throws Exception;
}
