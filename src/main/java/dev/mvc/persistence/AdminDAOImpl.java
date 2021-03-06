package dev.mvc.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.admin.Criteria;
import dev.mvc.domain.AdminVO;
import dev.mvc.domain.NoticeVO;
import dev.mvc.domain.QnaVO;
import dev.mvc.domain.ReplyStudyVO;
import dev.mvc.domain.ReplyVO;
import dev.mvc.domain.StatisticVO;
import dev.mvc.domain.StudyVO;
import dev.mvc.domain.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.AdminMapper";
	

	
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
	public int chkId(String id)throws Exception{
		return session.selectOne(namespace + ".chkId", id); //어드민 계정 아이디 중복 체크
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
	public List<StudyVO> studyImage(Integer bno)throws Exception{
		return session.selectList(namespace + ".studyImage", bno); //스터디 이미지 정보 가져옴
	}
	
	@Override
	public List<StudyVO> studyDetailC(Integer bno)throws Exception{
		return session.selectList(namespace + ".studyDetailC", bno); //스터디 카테고리 정보 가져옴
	}
	
	@Override
	public List<StudyVO> studyCategory(Criteria cri) throws Exception{
		return session.selectList(namespace + ".studyCategory", cri);  //study 카테고리 정보
	}
	
	@Override
	public List<StudyVO> studyCategory2(String cDId) throws Exception{
		return session.selectList(namespace + ".studyCategory2", cDId);  //study 카테고리 소분류 가져옴
	}
	
	@Override
	public List<StudyVO> region(Criteria cri) throws Exception{
		return session.selectList(namespace + ".region", cri);   //지역 정보 대분류 가져옴  
	}
	
	@Override
	public List<StudyVO> region2(String rDId) throws Exception{
		return session.selectList(namespace + ".region2", rDId);   //지역 정보 소분류 가져옴  
	}
	
	@Override
	public List<StudyVO> applyStudy(Integer bno)throws Exception{
		return session.selectList(namespace + ".applyStudy", bno); //스터디 신청자 정보 가져옴
	}
	
	@Override
	public void studyUpdate(StudyVO vo)throws Exception{	
		session.update(namespace + ".studyUpdate", vo);   // 스터디 정보 수정
	}
	
	@Override
	public void deleteCat(StudyVO vo) throws Exception {
		session.delete(namespace+".deleteCat", vo); //스터디 카테고리 삭제
	}
	
	@Override
	public void insertCat(Map<String, Object> ca) throws Exception{
		session.insert(namespace+".insertCat", ca);  //스터디 카테고리 등록
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
	public void typeUpdate(Integer bno)throws Exception{
		session.update(namespace + ".typeUpdate", bno);   // faq 등록 처리
	}
	
	@Override
	public void typeRUpdate(Integer bno)throws Exception{
		session.update(namespace + ".typeRUpdate", bno);   // faq 미등록 처리
	}
	
	@Override
	public void qnaUpdate(QnaVO vo)throws Exception{
		session.update(namespace+".qnaUpdate", vo);	//qna 정보 업데이트
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
	public void qnaRegister2(QnaVO vo)throws Exception{
		session.update(namespace + ".qnaRegister2", vo);   // qna 등록
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
	
		
	
	@Override
	public int todayM() throws Exception{
		return session.selectOne(namespace + ".todayM");  //금일 가입자수
	}
	
	@Override
	public int yesterdayM() throws Exception{
		return session.selectOne(namespace + ".yesterdayM");  //어제 가입자수
	}

	@Override
	public List<StatisticVO> weekM() throws Exception{
		return session.selectList(namespace + ".weekM");  //최근 8일 가입자수
	}
	
	@Override
	public int totalM() throws Exception{
		return session.selectOne(namespace + ".totalM");  //총 회원수
	}
	
	@Override
	public int totalW() throws Exception{
		return session.selectOne(namespace + ".totalW");  //총 탈퇴회원수
	}
	
	@Override
	public void insertVisit() throws Exception{
		System.out.println("여기는  다오");
		session.insert(namespace + ".insertVisit");  //방문자 수 카운트
	}
	
	@Override
	public int totalV() throws Exception{
		return session.selectOne(namespace + ".totalV");  //총 방문자수
	}
	
	@Override
	public int todayV() throws Exception{
		return session.selectOne(namespace + ".todayV");  //금일 방문자수
	}
	
	@Override
	public int yesterdayV() throws Exception{
		return session.selectOne(namespace + ".yesterdayV");  //어제 방문자수
	}
	
	@Override
	public List<StatisticVO> weekV() throws Exception{
		return session.selectList(namespace + ".weekV");  //최근 8일 방문자수
	}
	
	@Override
	public List<StatisticVO> weekS() throws Exception{
		return session.selectList(namespace + ".weekS");	//최근 8일 스터디 등록 수
	}
	
	@Override
	public List<StatisticVO> weekA() throws Exception{
		return session.selectList(namespace + ".weekA");	//최근 8일 스터디 신청 수
	}
	
	@Override
	public int totalS() throws Exception{
		return session.selectOne(namespace + ".totalS");	//총 스터디 등록 수
	}
	
	@Override
	public int totalA() throws Exception{
		return session.selectOne(namespace + ".totalA");	//총 스터디 신청 수
	}
	
	@Override
	public List<StudyVO> studyTop() throws Exception{
		return session.selectList(namespace+".studyTop");	//스터디 조회 수 상위 10개
	}
	
}