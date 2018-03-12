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
	
	
	// �α��� ����
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
		model.addAttribute("UserVO", userVO); // �𵨿� ��� ���ͼ��Ϳ��� Ȱ��
		if(userVO != null){
			// �α��� ���� Ŭ���� �����ڴ� �α��� �������� �ʴ´�(Ȥ�� �� ��Ȳ�� ���)
			if(dto.isUseCookies()){
				logger.info("isUseCookies.......");
				int amount = 60 * 60 * 24 * 7; // 1����
				Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
				System.out.println("=============���� getid==============");
				service.keepLogin(userVO.getEmail(), session.getId(), sessionLimit);
			}
		}

		// 3. AdminLogin
		AdminVO adminVO = service.adminLogin(dto);
		model.addAttribute("AdminVO", adminVO); // �𵨿� ��� ���ͼ��Ϳ��� Ȱ��
		
		// ������ ������ ��ο� �ش����� ������ return �Ѵ�.
		if(userVO == null && adminVO == null){
			return;
		}
		
		// 4. Interceptor posthandler O 
		
	}
	
	

	
	//�α׾ƿ� ��Ʈ�ѷ�
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
		
	//�α׾ƿ� ó��
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