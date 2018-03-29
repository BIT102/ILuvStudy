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
	
	
	
	//ȸ������ 
	@Override
	public void joinUser(UserVO vo) throws Exception {
		session.insert(namespace+".joinUser", vo);

	}
	
	// ������ ȸ������ �о����
	@Override
	public UserVO read(String email) throws Exception {
		return session.selectOne(namespace+".read", email);
	}

	// ������ ȸ�� ���� ����
	@Override
	public void update(UserVO vo) throws Exception {
		session.update(namespace+".update", vo);
	}

	// ���� �ΰ� ���� ����
	@Override
	public void updateAddInfo(UserVO vo) throws Exception {
		session.update(namespace+".updateAddInfo", vo);
	}

	// ��й�ȣ ����
	@Override
	public void changePw(UserVO vo) throws Exception {
		session.update(namespace+".changePw", vo);
	}

	// ����� Ż��
	@Override
	public void quit(UserVO vo) throws Exception {
		session.update(namespace+".quit", vo);
	}

	// �г��� �ߺ� üũ
	@Override
	public int nickCheck(String nickName) throws Exception {
		return session.selectOne(namespace+".nickCheck", nickName);
	}
	
	//������ ���� ����
	@Override
	public void insertImg(UserVO vo) throws Exception { //data�� ���⼭��
		session.update(namespace+".insertImg", vo);
	}
	
/*	//�ϸ�ũ ����Ʈ �ҷ�����
	@Override
	public List<StudyVO> bookmarkList(String email) throws Exception {
		return session.selectList(namespace+".bookmarkList", email);
	}*/
	
	// �ϸ�ũ ���ã�� ����
	@Override
	public int bookmarkCount(int bno) throws Exception {
		return session.selectOne(namespace +".bookmarkCount", bno);
	}
	
	@Override
	public StudyVO bookmarkCount2(int bno) throws Exception {
		return session.selectOne(namespace+".bookmarkCount", bno);
	}
	
	//���� ���͵� �ҷ�����
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