package dev.mvc.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dev.mvc.domain.UserVO;
import dev.mvc.persistance.UserDAO;
import dev.mvc.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
//@RequestMapping(value = "/mypage/")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	UserDAO dao;
	@Inject
	UserService service;
	
	//회원가입 컨트롤러
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinUserGET(UserVO vo, Model model) {
		
		System.out.println("YWTEST................");
		return "join";
	}
	
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinUserPOST(UserVO vo, Model model) {
		
		try {
			dao.joinUser(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "join";
	}
	
	// profile 컨트롤러
		@RequestMapping(value = "/profile", method = RequestMethod.GET)
		public String profileGET(Model model, String email) throws Exception {
			
			UserVO vo = dao.read(email);
			//dao.read(email);
			//System.out.println(dao.read(email));
			//model.addAttribute(email);
			model.addAttribute("vo", vo);
			
			return "/mypage/profile";
		}
	
		@RequestMapping(value = "/profile", method = RequestMethod.POST)
		public String update(UserVO vo, Model model) throws Exception {
			
			dao.update(vo);
			model.addAttribute("vo", vo);
	
			return "/mypage/profile";
		}
		
	// 부가정보(addinfo) 컨트롤러
		@RequestMapping(value = "/addInfo", method = RequestMethod.GET)
		public String addInfo(Model model, String email) throws Exception {
			
			UserVO vo = dao.read("j");
			model.addAttribute("vo", vo);
			
			return "/mypage/addInfo";
		}
		
		@RequestMapping(value = "/addInfo", method = RequestMethod.POST)
		public String updateaddInfo(UserVO vo, Model model) throws Exception {
			
			dao.updateAddInfo(vo);
			model.addAttribute("vo", vo);
			
			return "/mypage/addInfo";
		}
	
	
	// 비밀번호 변경(changePw) 컨트롤러
	@RequestMapping(value = "/changePw", method = RequestMethod.GET)
	public String changePwGET(Model model, String password) throws Exception {
		
		UserVO vo = dao.read(password);
		model.addAttribute("vo", vo);
		
		return "/mypage/changePw";
	}
	
	@RequestMapping(value = "/changePw", method = RequestMethod.POST)
	public String changePwPOST(UserVO vo, Model model) throws Exception {
		
		dao.changePw(vo);
		model.addAttribute("vo", vo);

		return "/mypage/changePw";
		
	}
	
	
	// 회원 탈퇴(quit) 컨트롤러
	@RequestMapping(value = "/quit", method = RequestMethod.GET)
	public String quit(Model model, String email) throws Exception {
		
		UserVO vo = dao.read(email);
		model.addAttribute("vo", vo);
		
		return "/mypage/quit";
	}
	
	@RequestMapping(value = "/quit", method = RequestMethod.POST)
	public String quitget(Model model, UserVO vo) throws Exception {
		
		dao.quit(vo);
		model.addAttribute("vo", vo);
		
		return "/mypage/quit";
	}
	
	// 북마크 (bookmark) 컨트롤러
	@RequestMapping(value = "/bookmark", method = RequestMethod.GET)
	public String bookmark() {
		
		return "/mypage/bookmark";
	}
	
	// 모집 (recruit) 컨트롤러
	@RequestMapping(value = "/recruit", method = RequestMethod.GET)
	public String recruit() {
		
		return "/mypage/recruit";
	}
	
	// 신청 (application) 컨트롤러
		@RequestMapping(value = "/application", method = RequestMethod.GET)
		public String application() {
			
			return "/mypage/application";
		}
		
	// 	완료(completed) 컨트롤러
		@RequestMapping(value = "/completed", method = RequestMethod.GET)
		public String completed() {
			
			return "/mypage/completed";
		}
		
		// =====================================================================================================
		// Sangwook
		
		
		// 회원가입
		// 이메일테스트  Ajax 로 필요함.
		@RequestMapping(value = "/chkEmail", method = RequestMethod.POST)
		public String emailTest(HttpServletRequest request, Model model) throws Exception {
			
			logger.info("chkEmail.......................");
			
			String email = request.getParameter("email1")+"@"+request.getParameter("email2");
						
			if(service.chkEmail(email)==-1){
				model.addAttribute("result","유효하지 않은 이메일입니다.");
				System.out.println("유효하지 않은 이메일입니다.");
			}else if(service.chkEmail(email)==1){
				model.addAttribute("result","이미 가입된 이메일입니다.");
				System.out.println("이미가입된이메일");
			}else{
				model.addAttribute("인증번호를 입력하세요.");
				// 인증번호 이메일 전송
				service.sendEmail(email);
			}
			
			return "/mypage/completed";
		}
		
		
	
}
