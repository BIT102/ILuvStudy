package dev.mvc.service;

import java.util.List;

import dev.mvc.admin.Criteria;
import dev.mvc.domain.AdminVO;
import dev.mvc.domain.NoticeVO;
import dev.mvc.domain.QnaVO;
import dev.mvc.domain.ReplyStudyVO;
import dev.mvc.domain.ReplyVO;
import dev.mvc.domain.StatisticVO;
import dev.mvc.domain.StudyVO;
import dev.mvc.domain.UserVO;

public interface AdminService {
	
	
	public List<AdminVO> adminList(Criteria cri) throws Exception;
	public AdminVO adminDetail(Integer bno)throws Exception;
	public void adminUpdate(AdminVO vo)throws Exception;
	public void adminRegister(AdminVO vo)throws Exception;
	public int adminCountPaging(Criteria cri)throws Exception;
	public int chkId(String id)throws Exception;
	
	public List<UserVO> userList(Criteria cri) throws Exception;
	public int userCountPaging(Criteria cri)throws Exception;
	public UserVO userDetail(Integer bno)throws Exception;
	public void userUpdate(UserVO vo)throws Exception;
	public void userRegister(UserVO vo)throws Exception;
	public UserVO isDelUpdate(Integer bno)throws Exception;
	public List<StudyVO> userApply(Integer bno)throws Exception;
	public List<StudyVO> userStudy(Integer bno)throws Exception;
	public List<StudyVO> userBookMark(Integer bno)throws Exception;
	
	public List<StudyVO> studyList(Criteria cri) throws Exception;
	public int studyCountPaging(Criteria cri)throws Exception;
	public StudyVO studyDetail(Integer bno)throws Exception;
	public List<StudyVO> studyImage(Integer bno)throws Exception;
	public List<StudyVO> studyDetailC(Integer bno)throws Exception;
	public List<StudyVO> studyCategory(Criteria cri) throws Exception;
	public List<StudyVO> studyCategory2(String cDId) throws Exception;
	public List<StudyVO> region(Criteria cri) throws Exception;
	public List<StudyVO> region2(String rDId) throws Exception;
	public List<StudyVO> applyStudy(Integer bno)throws Exception;
	public void studyUpdate(Integer bno, StudyVO vo)throws Exception;
	
	public List<ReplyStudyVO> replyList(Criteria cri) throws Exception;
	public int replyCountPaging(Criteria cri)throws Exception;
	
	public List<QnaVO> qnaList(Criteria cri) throws Exception;
	public int qnaCountPaging(Criteria cri)throws Exception;
	public QnaVO qnaDetail(Integer bno)throws Exception;
	public void typeUpdate(Integer bno)throws Exception;
	public void typeRUpdate(Integer bno)throws Exception;
	public void qnaUpdate(QnaVO vo)throws Exception;
	
	public List<ReplyVO> qnaReply(Integer bno) throws Exception;
	public void qnaRegister(ReplyVO vo)throws Exception;
	public void qnaRegister2(QnaVO vo)throws Exception;
	
	public List<NoticeVO> noticeList(Criteria cri) throws Exception;
	public int noticeCountPaging(Criteria cri)throws Exception;
	public NoticeVO noticeDetail(Integer bno)throws Exception;
	public void noticeUpdate(NoticeVO vo)throws Exception;
	public void noticeRegister(NoticeVO vo)throws Exception;
	
	public StatisticVO memberS(StatisticVO vo) throws Exception;
	public List<StatisticVO> weekM() throws Exception;
	public List<StatisticVO> weekV() throws Exception;
	public List<StatisticVO> weekS() throws Exception;
	public List<StatisticVO> weekA() throws Exception;
	public List<StudyVO> studyTop() throws Exception;
}
