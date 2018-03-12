package dev.mvc.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import dev.mvc.domain.AdminVO;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.LoginDTO;
import dev.mvc.service.LoginService;

@Controller
//@RequestMapping(value = "/mypage/")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private LoginService service;
	
	
	// 로그인 통합
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGet(HttpServletRequest request, Model model) throws Exception{
		
		logger.info("Login merge get.......");
	}
	
	@RequestMapping(value = "loginPost", method = RequestMethod.POST)
	public void loginPost(LoginDTO dto, HttpSession session, Model model) throws Exception{
		logger.info("Login merge post.......");
		
		// 1. Interceptor prehandler O
		
		// 2. UserLogin
		UserVO userVO = service.userLogin(dto);		
		model.addAttribute("UserVO", userVO); // 모델에 담아 인터셉터에서 활용
		if(userVO != null){
			// 로그인 유지 클릭시 관리자는 로그인 유지하지 않는다(혹시 모를 상황을 대비)
			if(dto.isUseCookies()){
				logger.info("isUseCookies.......");
				int amount = 60 * 60 * 24 * 7; // 1주일
				Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
				System.out.println("=============세션 getid==============");
				service.keepLogin(userVO.getEmail(), session.getId(), sessionLimit);
			}
		}

		// 3. AdminLogin
		AdminVO adminVO = service.adminLogin(dto);
		model.addAttribute("AdminVO", adminVO); // 모델에 담아 인터셉터에서 활용
		
		// 유저와 관리자 모두에 해당하지 않으면 return 한다.
		if(userVO == null && adminVO == null){
			return;
		}
		
		// 4. Interceptor posthandler O 
		
	}
	
	

	
	//로그아웃 컨트롤러
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String userlogout(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		logger.info("logout..........");
		Object obj = session.getAttribute("login");
		
		if(obj != null){
			UserVO vo = (UserVO) obj;
			
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null){
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getEmail(), session.getId(), new Date());
			}
		}
				
		return "/main";
	}
		
	//로그아웃 처리
		//adminLogout.jsp
		@RequestMapping(value="/adminLogout", method=RequestMethod.GET)
		public String adminlogout(HttpServletRequest request, HttpServletResponse response, 
				HttpSession session) throws Exception {
			logger.info("adminLogout get...");
			
			Object obj = session.getAttribute("login");
			
			if(obj != null){				
				session.removeAttribute("login");
				session.invalidate();
			}
			return "/adminLogout";	
		}
	
	
}