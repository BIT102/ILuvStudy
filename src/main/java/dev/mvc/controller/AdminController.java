package dev.mvc.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.domain.AdminVO;
import dev.mvc.admin.Criteria;
import dev.mvc.domain.NoticeVO;
import dev.mvc.admin.PageMaker;
import dev.mvc.domain.ReplyVO;
import dev.mvc.domain.StudyVO;
import dev.mvc.domain.UserVO;
import dev.mvc.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private AdminService service;
	
//admin관리 > 계정관리
	//admin/adminList.jsp
	@RequestMapping(value = "/adminList", method = RequestMethod.GET)
	public void adminList(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		logger.info("adminList get...");
		logger.info(cri.toString());
		model.addAttribute("list", service.adminList(cri));  //페이징 처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.adminCountPaging(cri));  //totalCount 반환
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	//admin/adminDetail.jsp
	@RequestMapping(value="/adminDetail", method = RequestMethod.GET)
	public void adminDetail(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, 
						Model model) throws Exception{
		logger.info("adminDetail get...");
		logger.info(cri.toString());
		model.addAttribute(service.adminDetail(bno));
	}
	
	//admin/adminDetail.jsp 에서 계정 정보 수정 시
	@RequestMapping(value="/adminDetail", method = RequestMethod.POST)
	public String adminUpdate(AdminVO vo, Criteria cri, RedirectAttributes rttr) throws Exception{
		logger.info("adminDetail post...");
		logger.info(cri.toString());
		service.adminUpdate(vo);
		
		//페이징 정보 유지
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		//검색 정보 유지
		rttr.addAttribute("statusType", cri.getStatusType());
		rttr.addAttribute("idKeyword", cri.getIdKeyword());
		rttr.addAttribute("nameKeyword", cri.getNameKeyword());
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/admin/adminList";
	}
	
	//admin/adminRegister.jsp 페이지 이동
	@RequestMapping(value="/adminRegister", method = RequestMethod.GET)
	public void adminRegister(AdminVO vo) throws Exception{
		logger.info("adminRegister get...");
	}
	
	//admin/adminRegister.jsp 패아자애서 계정 등록
	@RequestMapping(value="/adminRegister", method = RequestMethod.POST)
	public String adminRegisterPOST(AdminVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("adminRegister post...");
		logger.info(vo.toString());
		
		service.adminRegister(vo);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/admin/adminList";
	}
	
	//admin/adminRegister.jsp에서 계정 등록 시 아이디 중복확인
	@RequestMapping(value="/id",method = RequestMethod.POST)
	public ResponseEntity<String> chkId(@RequestParam("id") String id) throws Exception{
		
		System.out.println("idChk.................");
		
		ResponseEntity<String> entity = null;
		
		try{
			if(service.chkId(id)==0){
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}else{
				entity = new ResponseEntity<String>("dup", HttpStatus.OK);
			}
			
		}catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	} 
//admin관리 > 계정관리 끝

//회원관리 > 회원조회
	//admin/userList.jsp
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public void userList(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("userList get...");
		logger.info(cri.toString());
		model.addAttribute("list", service.userList(cri));  //페이징 처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.userCountPaging(cri));  //totalCount 반환
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	//admin/userDetail.jsp
	@RequestMapping(value="/userDetail", method = RequestMethod.GET)
	public void userDetail(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, 
						Model model) throws Exception{
		logger.info("userDetail get...");
		logger.info(cri.toString());
		model.addAttribute(service.userDetail(bno)); //사용자 상세 정보
		model.addAttribute("userApply", service.userApply(bno)); //사용자가 신청한 스터디 정보
		model.addAttribute("userStudy", service.userStudy(bno)); //사용자가 모집한 스터디 정보
		model.addAttribute("userBookMark", service.userBookMark(bno)); //사용자 북마크 정보
	}
	
	//admin/userDetail.jsp 에서 탈퇴 처리 시
	@RequestMapping(value="/isDelUpdate", method = RequestMethod.POST)
	public String isDelUpdate(@RequestParam("bno") int bno, Criteria cri, 
			RedirectAttributes rttr) throws Exception{
		logger.info("isDelUpdate get...");
		logger.info(cri.toString());
		
		service.isDelUpdate(bno);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/admin/userList";
	}
	
	//admin/userDetail.jsp 에서 계정 정보 수정 시
	@RequestMapping(value="/userDetail", method = RequestMethod.POST)
	public String userUpdate(UserVO vo, Criteria cri, RedirectAttributes rttr) throws Exception{
		logger.info("userDetail post...");
		logger.info(cri.toString());
		
		service.userUpdate(vo);
		
		//페이징 정보 유지
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		//검색 정보 유지
		rttr.addAttribute("isDelType", cri.getIsDelType());
		rttr.addAttribute("emailKeyword", cri.getEmailKeyword());
		rttr.addAttribute("nickNameKeyword", cri.getNickNameKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/admin/userList";
	}
	
	//admin/userRegister.jsp 페이지 이동
	@RequestMapping(value="/userRegister", method = RequestMethod.GET)
	public void userRegister(UserVO vo) throws Exception{
		logger.info("userRegister get...");
	}
	
	//admin/userRegister.jsp 패아자애서 계정 등록
	@RequestMapping(value="/userRegister", method = RequestMethod.POST)
	public String userRegisterPOST(UserVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("userRegister post...");
		logger.info(vo.toString());
		
		service.userRegister(vo);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/admin/userList";
	}
//회원관리 > 회원조회 끝
	
//스터디관리 > 스터디목록
	//admin/studyList.jsp
	@RequestMapping(value = "/studyList", method = RequestMethod.GET)
	public void studyList(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("studyList get...");
		logger.info(cri.toString());
		model.addAttribute("list", service.studyList(cri));  //페이징 처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.studyCountPaging(cri));  //totalCount 반환
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	//admin/studyDetail.jsp
	@RequestMapping(value="/studyDetail", method = RequestMethod.GET)
	public void studyDetail(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, 
						Model model) throws Exception{
		logger.info("studyDetail get...");
		logger.info(cri.toString());
		
		//스터디 카테고리 정보 가져옴
		model.addAttribute("studyCategory", service.studyCategory(cri));
		//지역테이블 정보
		model.addAttribute("region", service.region(cri));
		//스터디 상세 정보
		model.addAttribute(service.studyDetail(bno));
		//스터디 카테고리 선택 정보
		model.addAttribute("studyDC", service.studyDetailC(bno));
		//스터디 신청자 정보
		model.addAttribute("applyStudy", service.applyStudy(bno));
	}
	
	@RequestMapping(value="/studyDetailTest", method = RequestMethod.POST)
	public String sdTest() throws Exception{
		
		System.out.println("====================");
		System.out.println("Test input");
		System.out.println("====================");
		
		return "login";
	}
	
	@ResponseBody
	@RequestMapping(value="/region/{rDId}", method = RequestMethod.POST)
	public ResponseEntity<List<StudyVO>> region(@PathVariable("rDId") String rDId) throws Exception{
		logger.info("region post...");
		
		ResponseEntity<List<StudyVO>> entity=null;
		
		//지역테이블 정보
		entity = new ResponseEntity<List<StudyVO>>(service.region2(rDId), HttpStatus.OK);
		
		return entity;
	}
	
	
	//admin/studyDetail.jsp 에서 스터디 정보 수정 시
	@RequestMapping(value="/studyDetail", method = RequestMethod.POST)
	public String studyDetailPOST(StudyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("studyDetail post...");
//		logger.info(cri.toString());
		
		service.studyUpdate(vo);
		
		//페이징 정보 유지
		/*rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		//검색 정보 유지
		rttr.addAttribute("stStatusType", cri.getStStatusType());
		rttr.addAttribute("titleKeyword", cri.getTitleKeyword());
		rttr.addAttribute("writerKeyword", cri.getWriterKeyword());*/
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/admin/studyList";
	}


//스터디 관리 > 댓글 관리
	//admin/replyList.jsp
	@RequestMapping(value = "/replyList", method = RequestMethod.GET)
	public void replyList(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("replyList get...");
		logger.info(cri.toString());
		model.addAttribute("list", service.replyList(cri));  //페이징 처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.replyCountPaging(cri));  //totalCount 반환
		
		model.addAttribute("pageMaker", pageMaker);
	}
//스터디 관리 > 댓글 관리 끝

	
//사이트관리 > qna 관리
	//admin/qnaList.jsp
	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
	public void qnaList(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		logger.info("qnaList get...");
		logger.info(cri.toString());
		model.addAttribute("list", service.qnaList(cri));  //페이징 처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.qnaCountPaging(cri));  //totalCount 반환
		
		model.addAttribute("pageMaker", pageMaker);
	}	
		
	//admin/qnaDetail.jsp
	@RequestMapping(value="/qnaDetail", method = RequestMethod.GET)
	public void qnaDetail(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, 
						Model model) throws Exception{
		logger.info("qnaDetail get...");
		logger.info(cri.toString());
		
		model.addAttribute(service.qnaDetail(bno));
		model.addAttribute("list", service.qnaReply(bno));
	}
		
	//admin/qnaDetail.jsp 에서 댓글 정보 등록 시
	@RequestMapping(value="/qnaDetail", method = RequestMethod.POST)
	public String qnaDetail(ReplyVO vo, Model model, Criteria cri, RedirectAttributes rttr) throws Exception{
		logger.info("qnaDetail post...");
		logger.info(cri.toString());
		logger.info(vo.toString());
		service.qnaRegister(vo);
	
		//페이징 정보 유지
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		//검색 정보 유지
		rttr.addAttribute("faqType", cri.getFaqType());
		rttr.addAttribute("emailKeyword", cri.getEmailKeyword());
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/admin/qnaList";
	}
	
	//admin/qnaDetail.jsp 에서 faq 등록 시
	@RequestMapping(value="/typeUpdate", method = RequestMethod.POST)
	public String typeUpdate(@RequestParam("bno") int bno, Criteria cri, 
			RedirectAttributes rttr) throws Exception{
		logger.info("typeUpdate post...");
		logger.info(cri.toString());
		
		service.typeUpdate(bno);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/admin/qnaList";
	}
	
	//admin/qnaDetail.jsp 에서 faq 미등록 시
	@RequestMapping(value="/typeRUpdate", method = RequestMethod.POST)
	public String typeRUpdate(@RequestParam("bno") int bno, Criteria cri, 
			RedirectAttributes rttr) throws Exception{
		logger.info("typeRUpdate post...");
		logger.info(cri.toString());
		
		service.typeRUpdate(bno);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/admin/qnaList";
	}
	
	
//사이트관리 > qna 관리 끝
	
//사이트관리 > 공지사항 등록	
	//admin/noticeList.jsp
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public void noticeList(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		logger.info("noticeList get...");
		logger.info(cri.toString());
		model.addAttribute("list", service.noticeList(cri));  //페이징 처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.noticeCountPaging(cri));  //totalCount 반환
		
		model.addAttribute("pageMaker", pageMaker);
	}	
	
	//admin/noticeDetail.jsp
	@RequestMapping(value="/noticeDetail", method = RequestMethod.GET)
	public void noticeDetail(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, 
						Model model) throws Exception{
		logger.info("noticeDetail get...");
		logger.info(cri.toString());
		
		model.addAttribute(service.noticeDetail(bno));
	}
	
	//admin/noticeDetail.jsp 에서 공지사항 수정 시
	@RequestMapping(value="/noticeDetail", method = RequestMethod.POST)
	public String noticeUpdate(NoticeVO vo, Criteria cri, RedirectAttributes rttr) throws Exception{
		logger.info("noticeDetail post...");
		logger.info(cri.toString());
		service.noticeUpdate(vo);
		
		//페이징 정보 유지
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		//검색 정보 유지
		rttr.addAttribute("titleKeyword", cri.getTitleKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/admin/noticeList";
	}
	
	//admin/noticeRegister.jsp 페이지 이동
	@RequestMapping(value="/noticeRegister", method = RequestMethod.GET)
	public void noticeRegister(NoticeVO vo) throws Exception{
		logger.info("noticeRegister get...");
	}
	
	//admin/noticeRegister.jsp 패아자애서 계정 등록
	@RequestMapping(value="/noticeRegister", method = RequestMethod.POST)
	public String noticeRegisterPOST(NoticeVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("noticeRegister post...");
		logger.info(vo.toString());
		
		service.noticeRegister(vo);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/admin/noticeList";
	}
//사이트관리 > 공지사항 등록 끝

}
