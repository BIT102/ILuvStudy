package dev.mvc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dev.mvc.domain.AdminVO;
import dev.mvc.admin.Criteria;
import dev.mvc.domain.NoticeVO;
import dev.mvc.domain.QnaVO;
import dev.mvc.domain.ReplyStudyVO;
import dev.mvc.domain.ReplyVO;
import dev.mvc.domain.StudyVO;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.LoginDTO;
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
		return dao.studyDetail(bno);
	}

	@Override
	public List<StudyVO> studyCategory(Criteria cri) throws Exception{
		return dao.studyCategory(cri);
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
	
	@Override
	public void studyUpdate(StudyVO vo)throws Exception{
		dao.studyUpdate(vo);
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
	public List<ReplyVO> qnaReply(Integer bno) throws Exception{
		return dao.qnaReply(bno);
	}
	
	@Override
	public void qnaRegister(ReplyVO vo)throws Exception{
		dao.qnaRegister(vo);
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
}
