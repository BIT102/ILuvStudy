package dev.mvc.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.domain.StudyVO;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.LoginDTO;

@Repository
public class UserDAOImpl implements UserDAO {

	
	@Inject
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.userMapper";
	
	
	
	//회원가입 
	@Override
	public void joinUser(UserVO vo) throws Exception {
		session.insert(namespace+".joinUser", vo);

	}
	
	// 프로필 회원정보 읽어오기
	@Override
	public UserVO read(String email) throws Exception {
		return session.selectOne(namespace+".read", email);
	}

	// 프로필 회원 정보 수정
	@Override
	public void update(UserVO vo) throws Exception {
		session.update(namespace+".update", vo);
	}

	// 개인 부가 정보 수정
	@Override
	public void updateAddInfo(UserVO vo) throws Exception {
		session.update(namespace+".updateAddInfo", vo);
	}

	// 비밀번호 변경
	@Override
	public void changePw(UserVO vo) throws Exception {
		session.update(namespace+".changePw", vo);
	}

	// 사용자 탈퇴
	@Override
	public void quit(UserVO vo) throws Exception {
		session.update(namespace+".quit", vo);
	}

	// 닉네임 중복 체크
	@Override
	public int nickCheck(String nickName) throws Exception {
		return session.selectOne(namespace+".nickCheck", nickName);
	}
	
	//프로필 사진 수정
	@Override
	public void insertImg(UserVO vo) throws Exception { //data가 여기서만
		session.update(namespace+".insertImg", vo);
	}
	
/*	//북마크 리스트 불러오기
	@Override
	public List<StudyVO> bookmarkList(String email) throws Exception {
		return session.selectList(namespace+".bookmarkList", email);
	}*/
	
	// 북마크 즐겨찾기 숫자
	@Override
	public int bookmarkCount(int bno) throws Exception {
		return session.selectOne(namespace +".bookmarkCount", bno);
	}
	
	@Override
	public StudyVO bookmarkCount2(int bno) throws Exception {
		return session.selectOne(namespace+".bookmarkCount", bno);
	}
	
	//모집 스터디 불러오기
	@Override
	public List<StudyVO> recruitList(String email) throws Exception {
		return session.selectList(namespace +".recruitList", email);
	}

	
	

	//=================================================
		// sangwook
		
		@Override
		public int chkEmail(String email) throws Exception {
			return session.selectOne(namespace+".chkEmail", email);
		}
		
		@Override
		public int chkNickname(String nickName) throws Exception{
			return session.selectOne(namespace+".chkNickname", nickName);
		}

		@Override
		public void emailConf(String email) throws Exception {
			session.update(namespace+".emailConf",email);
			
		}


	
}