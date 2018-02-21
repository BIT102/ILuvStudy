package dev.mvc.admin;

import java.util.List;

public interface AdminService {
	public AdminVO login(AdminDTO dto) throws Exception;
	public void loginupdate(Object adminVO) throws Exception;
	public List<AdminVO> adminListAll() throws Exception;
	public AdminVO adminDetail(Integer bno)throws Exception;
}
