package dev.mvc.persistance;

import java.util.List;

import dev.mvc.domain.AdminVO;
import dev.mvc.domain.Criteria;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.AdminDTO;

public interface AdminDAO {
	public AdminVO login(AdminDTO dto)throws Exception;
	public void loginupdate(Object adminVO)throws Exception;
	public List<AdminVO> adminList(Criteria cri) throws Exception;
	public AdminVO adminDetail(Integer bno)throws Exception;
	public void adminUpdate(AdminVO vo)throws Exception;
	public void adminRegister(AdminVO vo)throws Exception;
	public List<AdminVO> adminListPage(int page)throws Exception;
	public int adminCountPaging(Criteria cri)throws Exception;
	
	public List<UserVO> userList(Criteria cri) throws Exception;
	public int userCountPaging(Criteria cri)throws Exception;
	public UserVO userDetail(Integer bno)throws Exception;
	public void userUpdate(UserVO vo)throws Exception;
}
