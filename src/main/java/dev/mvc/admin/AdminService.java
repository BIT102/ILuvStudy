package dev.mvc.admin;

import java.util.List;

public interface AdminService {
	public AdminVO login(AdminDTO dto) throws Exception;
	public void modify(AdminVO board) throws Exception;
	public List<AdminVO> adminListAll() throws Exception;
}
