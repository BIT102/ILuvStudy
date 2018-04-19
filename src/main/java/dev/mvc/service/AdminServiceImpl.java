package dev.mvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dev.mvc.admin.Criteria;
import dev.mvc.domain.AdminVO;
import dev.mvc.domain.NoticeVO;
import dev.mvc.domain.QnaVO;
import dev.mvc.domain.ReplyStudyVO;
import dev.mvc.domain.ReplyVO;
import dev.mvc.domain.StatisticVO;
import dev.mvc.domain.StudyVO;
import dev.mvc.domain.UserVO;
import dev.mvc.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{

	@Inject
	private AdminDAO dao;
	
	
	@Override
	public List<AdminVO> adminList(Criteria cri) throws Exception{
		return dao.adminList(cri);
	}
	
	@Override
	public AdminVO adminDetail(Integer bno)throws Exception{
		return dao.adminDetail(bno);
	}
	
	@Override
	public void adminUpdate(AdminVO vo)throws Exception{
		dao.adminUpdate(vo);
	}
	
	@Override
	public void adminRegister(AdminVO vo)throws Exception{
		dao.adminRegister(vo);
	}
	
	@Override
	public int chkId(String id)throws Exception{
		return dao.chkId(id); 
	}
	
	@Override
	public int adminCountPaging(Criteria cri)throws Exception{
		return dao.adminCountPaging(cri);
	}
	
	@Override
	public List<UserVO> userList(Criteria cri) throws Exception{
		return dao.userList(cri);
	}
	
	@Override
	public int userCountPaging(Criteria cri)throws Exception{
		return dao.userCountPaging(cri);
	}
	
	@Override
	public UserVO userDetail(Integer bno)throws Exception{
		return dao.userDetail(bno);
	}
	
	@Override
	public void userUpdate(UserVO vo)throws Exception{
		dao.userUpdate(vo);
	}
	
	@Override
	public void userRegister(UserVO vo)throws Exception{
		dao.userRegister(vo);
	}
	
	@Override
	public UserVO isDelUpdate(Integer bno)throws Exception{
		return dao.isDelUpdate(bno);
	}
	
	@Override
	public List<StudyVO> userApply(Integer bno)throws Exception{
		return dao.userApply(bno);
	}
	
	@Override
	public List<StudyVO> userStudy(Integer bno)throws Exception{
		return dao.userStudy(bno);
	}
	
	@Override
	public List<StudyVO> userBookMark(Integer bno)throws Exception{
		return dao.userBookMark(bno);
	}
	
	@Override
	public List<StudyVO> studyList(Criteria cri) throws Exception{
		return dao.studyList(cri);
	}
	
	@Override
	public int studyCountPaging(Criteria cri)throws Exception{
		return dao.studyCountPaging(cri);
	}
	
	@Override
	public StudyVO studyDetail(Integer bno)throws Exception{
		return dao.studyDetail(bno); //스터디 정보 가져옴
	}
	
	@Override
	public List<StudyVO> studyImage(Integer bno)throws Exception{
		return dao.studyImage(bno);
	}
	
	@Override
	public List<StudyVO> studyDetailC(Integer bno)throws Exception{
		return dao.studyDetailC(bno);
	}

	@Override
	public List<StudyVO> studyCategory(Criteria cri) throws Exception{
		return dao.studyCategory(cri);
	}
	
	@Override
	public List<StudyVO> studyCategory2(String cDId) throws Exception{
		return dao.studyCategory2(cDId);
	}
	
	@Override
	public List<StudyVO> region(Criteria cri) throws Exception{
		return dao.region(cri);
	}
	
	@Override
	public List<StudyVO> region2(String rDId) throws Exception{
		return dao.region2(rDId);
	}
	
	@Override
	public List<StudyVO> applyStudy(Integer bno)throws Exception{
		return dao.applyStudy(bno);
	}
	
	@Transactional
	@Override
	public void studyUpdate(Integer bno, StudyVO vo)throws Exception{
		
		dao.deleteCat(vo); //스터디 카테고리 삭제
		
		//카테고리 등록하기
		Map<String, Object> ca = new HashMap<>();
		

		String[] D = vo.getCategoryD();
		String[] S = vo.getCategoryS();
		
		for(int i=0; i<S.length; i++) {
			String caD = D[i];
			String caS = S[i];
				
			ca.put("bno", bno);
			ca.put("categoryD", caD);
			ca.put("categoryS", caS);
			
			System.out.println("========================");
			System.out.println(ca);
			System.out.println("========================");
				
			dao.insertCat(ca); //스터디 카테고리 등록 
		}
		
		dao.studyUpdate(vo); //스터디 정보 업데이트
	}
	
	@Override
	public List<ReplyStudyVO> replyList(Criteria cri) throws Exception{
		return dao.replyList(cri);
	}
	
	@Override
	public int replyCountPaging(Criteria cri)throws Exception{
		return dao.replyCountPaging(cri);
	}
	
	@Override
	public List<QnaVO> qnaList(Criteria cri) throws Exception{
		return dao.qnaList(cri);
	}
	
	@Override
	public int qnaCountPaging(Criteria cri)throws Exception{
		return dao.qnaCountPaging(cri);
	}
	
	@Override
	public QnaVO qnaDetail(Integer bno)throws Exception{
		return dao.qnaDetail(bno);
	}
	
	@Override
	public void typeUpdate(Integer bno)throws Exception{
		dao.typeUpdate(bno);
	}

	@Override
	public void typeRUpdate(Integer bno)throws Exception{
		dao.typeRUpdate(bno);
	}
	
	@Override
	public void qnaUpdate(QnaVO vo)throws Exception{
		dao.qnaUpdate(vo);
	}
	
	@Override
	public List<ReplyVO> qnaReply(Integer bno) throws Exception{
		return dao.qnaReply(bno);
	}
	
	@Override
	public void qnaRegister(ReplyVO vo)throws Exception{
		dao.qnaRegister(vo);
	}
	
	@Override
	public void qnaRegister2(QnaVO vo)throws Exception{
		dao.qnaRegister2(vo);
	}
	
	@Override
	public List<NoticeVO> noticeList(Criteria cri) throws Exception{
		return dao.noticeList(cri);
	}
	
	@Override
	public int noticeCountPaging(Criteria cri)throws Exception{
		return dao.noticeCountPaging(cri);
	}
	
	@Override
	public NoticeVO noticeDetail(Integer bno)throws Exception{
		return dao.noticeDetail(bno);
	}
	
	@Override
	public void noticeUpdate(NoticeVO vo)throws Exception{
		dao.noticeUpdate(vo);
	}
	
	@Override
	public void noticeRegister(NoticeVO vo)throws Exception{
		dao.noticeRegister(vo);
	}
	
	
// =========== 통계 ==========
	@Override
	public StatisticVO memberS(StatisticVO vo) throws Exception{
		vo.setToDMember(dao.todayM());   		//금일 가입자수
		vo.setYesterDMember(dao.yesterdayM());	//어제 가입자수
		vo.setTotalMember(dao.totalM());		//총 회원수
		vo.setTotalWithdrawal(dao.totalW());	//총 탈퇴회원수
		
		vo.setTotalVisit(dao.totalV());			//총 방문자수
		vo.setToDVisit(dao.todayV());			//오늘 방문자수
		vo.setYesterDVisit(dao.yesterdayV());	//어제 방문자수
		
		
		vo.setTotalStudy(dao.totalS());		//총 스터디 등록 수
		vo.setTotalApply(dao.totalA());		//총 스터디 신청 수
		//System.out.println("===============");
		//System.out.println(vo);
		return vo;
	}
	
	@Override
	public List<StatisticVO> weekM() throws Exception{
		return dao.weekM();  //최근 8일 가입자 수 통계
	}
	
	@Override
	public List<StatisticVO> weekV() throws Exception{
		return dao.weekV(); //최근 8일 방문자 수 통계
	}
	
	@Override
	public List<StatisticVO> weekS() throws Exception{
		return dao.weekS(); //최근 8일 스터디 등록 수 통계
	}
	
	@Override
	public List<StatisticVO> weekA() throws Exception{
		return dao.weekA(); //최근 8일 스터디 신청 수 통계
	}
	
	@Override
	public List<StudyVO> studyTop() throws Exception{
		return dao.studyTop();	//스터디 조회 수 상위 10개
	}

}
