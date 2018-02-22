package dev.mvc.user;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
//@RequestMapping(value = "/mypage/")
public class UserControllerUser {
	
	private static final Logger logger = LoggerFactory.getLogger(UserControllerUser.class);
	
	@Inject
	UserDAO dao;
	
	
	//회원가입 컨트롤러
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinUserGET(UserVO vo, Model model) {
		
	}
	
	@RequestMapping(value = "/joinUser", method = RequestMethod.POST)
	public String joinUser(UserVO vo, Model model) {
		
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
	public String profile(UserVO vo, Model model) {
		
		return "/mypage/profile";
	}
	
	// 부가정보(addinfo) 컨트롤러
	@RequestMapping(value = "/addInfo", method = RequestMethod.GET)
	public String addInfo(UserVO vo, Model model) {
		
		return "/mypage/addInfo";
	}
	
	// 비밀번호 변경(changePw) 컨트롤러
	@RequestMapping(value = "/changePw", method = RequestMethod.GET)
	public String changePw(UserVO vo, Model model) {
		
		return "/mypage/changePw";
	}
	
	// 회원 탈퇴(quit) 컨트롤러
	@RequestMapping(value = "/quit", method = RequestMethod.GET)
	public String quit(UserVO vo, Model model) {
		
		return "/mypage/quit";
	}
	
	// 북마크 (bookmark) 컨트롤러
	@RequestMapping(value = "/bookmark", method = RequestMethod.GET)
	public String bookmark(UserVO vo, Model model) {
		
		return "/mypage/bookmark";
	}
	
	// 모집 (recruit) 컨트롤러
	@RequestMapping(value = "/recruit", method = RequestMethod.GET)
	public String recruit(UserVO vo, Model model) {
		
		return "/mypage/recruit";
	}
	
	// 신청 (application) 컨트롤러
		@RequestMapping(value = "/application", method = RequestMethod.GET)
		public String application(UserVO vo, Model model) {
			
			return "/mypage/application";
		}
		
	// 	완료(completed) 컨트롤러
		@RequestMapping(value = "/completed", method = RequestMethod.GET)
		public String completed(UserVO vo, Model model) {
			
			return "/mypage/completed";
		}
	
}
