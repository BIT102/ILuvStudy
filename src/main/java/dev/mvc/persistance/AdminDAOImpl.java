package dev.mvc.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.domain.AdminVO;
import dev.mvc.domain.Criteria;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.AdminDTO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.AdminMapper";
	
	@Override
	public AdminVO login(AdminDTO dto)throws Exception{
		return session.selectOne(namespace + ".adminLogin", dto);  //로그인 계정 정보 찾음
	}
	
	@Override
	public void loginupdate(Object adminVO)throws Exception{
		session.update(namespace + ".adminLastLogin", adminVO);  //최근 접속일 업데이트
	}
	
	@Override
	public List<AdminVO> adminList(Criteria cri) throws Exception{
		return session.selectList(namespace + ".adminList", cri);  //관리자 계정 정보 리스트,페이징 
	}
	
	@Override
	public AdminVO adminDetail(Integer bno)throws Exception{
		return session.selectOne(namespace + ".adminDetail", bno);  // 관리자 계정 정보 상세 가져옴
	}
	
	@Override
	public void adminUpdate(AdminVO vo)throws Exception{
		session.update(namespace + ".adminUpdate", vo);   // 관리자 계정 정보 수정
	}
	
	@Override
	public void adminRegister(AdminVO vo)throws Exception{
		session.insert(namespace + ".adminRegister", vo);  // 관리자 계정 정보 등록
	}
	
	@Override
	public List<AdminVO> adminListPage(int page)throws Exception{
		if(page<=0){
			page = 1;
		}
		
		page = (page-1)*10;
		
		return session.selectList(namespace + ".adminListPage", page); // 관리자 계정 리스트 페이지 페이징 처리
	}
	
	@Override
	public int adminCountPaging(Criteria cri)throws Exception{
		return session.selectOne(namespace + ".adminCountPaging", cri); // totalCount 반환
	}
	
	@Override
	public List<UserVO> userList(Criteria cri) throws Exception{
		return session.selectList(namespace + ".userList", cri);  //사용자 계정 정보 리스트,페이징 
	}
	
	@Override
	public int userCountPaging(Criteria cri)throws Exception{
		return session.selectOne(namespace + ".userCountPaging", cri); // totalCount 반환
	}
	
	@Override
	public UserVO userDetail(Integer bno)throws Exception{
		return session.selectOne(namespace + ".userDetail", bno);  //사용자 계정 정보 상세 가져옴
	}
	
	@Override
	public void userUpdate(UserVO vo)throws Exception{
		session.update(namespace + ".userUpdate", vo);   // 사용자 계정 정보 수정
	}
}