package dev.mvc.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.admin.Criteria;
import dev.mvc.domain.AdminVO;
import dev.mvc.domain.NoticeVO;
import dev.mvc.domain.QnaVO;
import dev.mvc.domain.ReplyStudyVO;
import dev.mvc.domain.ReplyVO;
import dev.mvc.domain.StudyVO;
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
	
	@Override
	public void userRegister(UserVO vo)throws Exception{
		session.insert(namespace + ".userRegister", vo);  // 사용자 계정 정보 등록
	}
	
	@Override
	public UserVO isDelUpdate(Integer bno)throws Exception{
		return session.selectOne(namespace + ".isDelUpdate", bno);  //사용자 계정 탈퇴 처리
	}
	
	@Override
	public List<StudyVO> userApply(Integer bno)throws Exception{
		return session.selectList(namespace + ".userApply", bno);  //사용자가 신청한 스터디 정보
	}
	
	@Override
	public List<StudyVO> userStudy(Integer bno)throws Exception{
		return session.selectList(namespace + ".userStudy", bno);  //사용자가 모집한 스터디 정보
	}
	
	@Override
	public List<StudyVO> userBookMark(Integer bno)throws Exception{
		return session.selectList(namespace + ".userBookMark", bno);  //사용자 스터디 북마크 정보
	}
	
	@Override
	public List<StudyVO> studyList(Criteria cri) throws Exception{
		return session.selectList(namespace + ".studyList", cri);  //study 정보 리스트,페이징 
	}
	
	@Override
	public int studyCountPaging(Criteria cri)throws Exception{
		return session.selectOne(namespace + ".studyCountPaging", cri); // totalCount 반환
	}
	
	@Override
	public StudyVO studyDetail(Integer bno)throws Exception{
		return session.selectOne(namespace + ".studyDetail", bno);  //스터디 정보 정보 상세 가져옴
	}
	
	@Override
	public List<StudyVO> studyDCategory(Criteria cri) throws Exception{
		return session.selectList(namespace + ".studyDCategory", cri);  //study 대카테고리 정보
	}
	
	@Override
	public List<StudyVO> studySCategory(Criteria cri) throws Exception{
		return session.selectList(namespace + ".studySCategory", cri);  //study 소카테고리 정보
	}
	
	@Override
	public List<StudyVO> region(Criteria cri) throws Exception{
		return session.selectList(namespace + ".region", cri);   //지역 정보 가져옴  
	}
	
	@Override
	public List<ReplyStudyVO> replyList(Criteria cri) throws Exception{
		return session.selectList(namespace + ".replyList", cri);   //스터디 댓글 정보 가져옴  
	}
	
	@Override
	public int replyCountPaging(Criteria cri)throws Exception{
		return session.selectOne(namespace + ".replyCountPaging", cri); // totalCount 반환
	}
	
	@Override
	public List<QnaVO> qnaList(Criteria cri) throws Exception{
		return session.selectList(namespace + ".qnaList", cri);   //qna 리스트 정보 가져옴  
	}
	
	@Override
	public int qnaCountPaging(Criteria cri)throws Exception{
		return session.selectOne(namespace + ".qnaCountPaging", cri); // totalCount 반환
	}
	
	@Override
	public QnaVO qnaDetail(Integer bno)throws Exception{
		return session.selectOne(namespace + ".qnaDetail", bno);  //qna 정보 정보 상세 가져옴
	}
	
	@Override
	public List<ReplyVO> qnaReply(Integer bno) throws Exception{
		return session.selectList(namespace + ".qnaReply", bno);   //qna 댓글 리스트 정보 가져옴  
	}
	
	@Override
	public void qnaRegister(ReplyVO vo)throws Exception{
		session.update(namespace + ".qnaRegister", vo);   // qna 댓글 등록
	}
	
	@Override
	public List<NoticeVO> noticeList(Criteria cri) throws Exception{
		return session.selectList(namespace + ".noticeList", cri);   //공지사항 리스트 정보 가져옴 
	}
	
	@Override
	public int noticeCountPaging(Criteria cri)throws Exception{
		return session.selectOne(namespace + ".noticeCountPaging", cri); // totalCount 반환
	}
	
	@Override
	public NoticeVO noticeDetail(Integer bno)throws Exception{
		return session.selectOne(namespace + ".noticeDetail", bno);  //공지사항 정보 정보 상세 가져옴
	}
	
	@Override
	public void noticeUpdate(NoticeVO vo)throws Exception{
		session.update(namespace + ".noticeUpdate", vo);   // 공지사항 정보 수정
	}
	
	@Override
	public void noticeRegister(NoticeVO vo)throws Exception{
		session.insert(namespace + ".noticeRegister", vo);  // 공지사항 정보 등록
	}
	
		
}