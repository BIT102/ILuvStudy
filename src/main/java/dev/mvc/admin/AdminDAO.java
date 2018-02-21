package dev.mvc.admin;

import java.util.List;

public interface AdminDAO {
	public AdminVO login(AdminDTO dto)throws Exception;
	public void update(AdminVO vo)throws Exception;
	public List<AdminVO> adminListAll() throws Exception;
}
