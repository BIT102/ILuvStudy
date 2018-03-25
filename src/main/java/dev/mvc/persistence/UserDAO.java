package dev.mvc.persistence;

import java.util.Date;
import java.util.List;

import dev.mvc.domain.StudyVO;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.LoginDTO;

public interface UserDAO {

	//회원 가입 메소드
	public void joinUser(UserVO vo) throws Exception;
	
	//프로필 개인정보 조회
	public UserVO read(String email) throws Exception;
	
	//프로필 개인정보 수정
	public void update(UserVO vo) throws Exception;
	
	//사용자 부가 정보 수정
	public void updateAddInfo(UserVO vo) throws Exception;
	
	//사용자 비밀번호 변경
	public void changePw(UserVO vo) throws Exception;
	
	//사용자 탙뢰
	public void quit(UserVO vo) throws Exception;
	
	
	
/*	//회원 전체 리스트 조회
	public List<UserVO> listAll() throws Exception;*/
	
	
	// ========================================================
	// sangwook
	
	// email 중복체크
	public int chkEmail(String email) throws Exception;
	
	public int chkNickname(String nickName) throws Exception;

	
	public void emailConf(String email) throws Exception;
}
