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
		return session.selectOne(namespace + ".adminLogin", dto);  //�α��� ���� ���� ã��
	}
	
	@Override
	public void loginupdate(Object adminVO)throws Exception{
		session.update(namespace + ".adminLastLogin", adminVO);  //�ֱ� ������ ������Ʈ
	}
	
	@Override
	public List<AdminVO> adminList(Criteria cri) throws Exception{
		return session.selectList(namespace + ".adminList", cri);  //������ ���� ���� ����Ʈ,����¡ 
	}
	
	@Override
	public AdminVO adminDetail(Integer bno)throws Exception{
		return session.selectOne(namespace + ".adminDetail", bno);  // ������ ���� ���� �� ������
	}
	
	@Override
	public void adminUpdate(AdminVO vo)throws Exception{
		session.update(namespace + ".adminUpdate", vo);   // ������ ���� ���� ����
	}
	
	@Override
	public void adminRegister(AdminVO vo)throws Exception{
		session.insert(namespace + ".adminRegister", vo);  // ������ ���� ���� ���
	}
	
	@Override
	public int adminCountPaging(Criteria cri)throws Exception{
		return session.selectOne(namespace + ".adminCountPaging", cri); // totalCount ��ȯ
	}
	
	@Override
	public List<UserVO> userList(Criteria cri) throws Exception{
		return session.selectList(namespace + ".userList", cri);  //����� ���� ���� ����Ʈ,����¡ 
	}
	
	@Override
	public int userCountPaging(Criteria cri)throws Exception{
		return session.selectOne(namespace + ".userCountPaging", cri); // totalCount ��ȯ
	}
	
	@Override
	public UserVO userDetail(Integer bno)throws Exception{
		return session.selectOne(namespace + ".userDetail", bno);  //����� ���� ���� �� ������
	}
	
	@Override
	public void userUpdate(UserVO vo)throws Exception{
		session.update(namespace + ".userUpdate", vo);   // ����� ���� ���� ����
	}
	
	@Override
	public void userRegister(UserVO vo)throws Exception{
		session.insert(namespace + ".userRegister", vo);  // ����� ���� ���� ���
	}
	
	@Override
	public UserVO isDelUpdate(Integer bno)throws Exception{
		return session.selectOne(namespace + ".isDelUpdate", bno);  //����� ���� Ż�� ó��
	}
	
	@Override
	public List<StudyVO> userApply(Integer bno)throws Exception{
		return session.selectList(namespace + ".userApply", bno);  //����ڰ� ��û�� ���͵� ����
	}
	
	@Override
	public List<StudyVO> userStudy(Integer bno)throws Exception{
		return session.selectList(namespace + ".userStudy", bno);  //����ڰ� ������ ���͵� ����
	}
	
	@Override
	public List<StudyVO> userBookMark(Integer bno)throws Exception{
		return session.selectList(namespace + ".userBookMark", bno);  //����� ���͵� �ϸ�ũ ����
	}
	
	@Override
	public List<StudyVO> studyList(Criteria cri) throws Exception{
		return session.selectList(namespace + ".studyList", cri);  //study ���� ����Ʈ,����¡ 
	}
	
	@Override
	public int studyCountPaging(Criteria cri)throws Exception{
		return session.selectOne(namespace + ".studyCountPaging", cri); // totalCount ��ȯ
	}
	
	@Override
	public StudyVO studyDetail(Integer bno)throws Exception{
		return session.selectOne(namespace + ".studyDetail", bno);  //���͵� ���� ���� �� ������
	}
	
	@Override
	public List<StudyVO> studyDCategory(Criteria cri) throws Exception{
		return session.selectList(namespace + ".studyDCategory", cri);  //study ��ī�װ� ����
	}
	
	@Override
	public List<StudyVO> studySCategory(Criteria cri) throws Exception{
		return session.selectList(namespace + ".studySCategory", cri);  //study ��ī�װ� ����
	}
	
	@Override
	public List<StudyVO> region(Criteria cri) throws Exception{
		return session.selectList(namespace + ".region", cri);   //���� ���� ������  
	}
	
	@Override
	public List<ReplyStudyVO> replyList(Criteria cri) throws Exception{
		return session.selectList(namespace + ".replyList", cri);   //���͵� ��� ���� ������  
	}
	
	@Override
	public int replyCountPaging(Criteria cri)throws Exception{
		return session.selectOne(namespace + ".replyCountPaging", cri); // totalCount ��ȯ
	}
	
	@Override
	public List<QnaVO> qnaList(Criteria cri) throws Exception{
		return session.selectList(namespace + ".qnaList", cri);   //qna ����Ʈ ���� ������  
	}
	
	@Override
	public int qnaCountPaging(Criteria cri)throws Exception{
		return session.selectOne(namespace + ".qnaCountPaging", cri); // totalCount ��ȯ
	}
	
	@Override
	public QnaVO qnaDetail(Integer bno)throws Exception{
		return session.selectOne(namespace + ".qnaDetail", bno);  //qna ���� ���� �� ������
	}
	
	@Override
	public List<ReplyVO> qnaReply(Integer bno) throws Exception{
		return session.selectList(namespace + ".qnaReply", bno);   //qna ��� ����Ʈ ���� ������  
	}
	
	@Override
	public void qnaRegister(ReplyVO vo)throws Exception{
		session.update(namespace + ".qnaRegister", vo);   // qna ��� ���
	}
	
	@Override
	public List<NoticeVO> noticeList(Criteria cri) throws Exception{
		return session.selectList(namespace + ".noticeList", cri);   //�������� ����Ʈ ���� ������ 
	}
	
	@Override
	public int noticeCountPaging(Criteria cri)throws Exception{
		return session.selectOne(namespace + ".noticeCountPaging", cri); // totalCount ��ȯ
	}
	
	@Override
	public NoticeVO noticeDetail(Integer bno)throws Exception{
		return session.selectOne(namespace + ".noticeDetail", bno);  //�������� ���� ���� �� ������
	}
	
	@Override
	public void noticeUpdate(NoticeVO vo)throws Exception{
		session.update(namespace + ".noticeUpdate", vo);   // �������� ���� ����
	}
	
	@Override
	public void noticeRegister(NoticeVO vo)throws Exception{
		session.insert(namespace + ".noticeRegister", vo);  // �������� ���� ���
	}
	
		
}