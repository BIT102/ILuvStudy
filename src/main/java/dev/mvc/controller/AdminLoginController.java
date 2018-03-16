package dev.mvc.controller;

import javax.inject.Inject;
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

import dev.mvc.domain.AdminVO;
import dev.mvc.dto.AdminDTO;
import dev.mvc.service.AdminService;

@Controller
public class AdminLoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminLoginController.class);
	
	@Inject
	private AdminService service;
	
//로그인 처리
	//adminLogin.jsp
	@RequestMapping(value="/adminLogin", method=RequestMethod.GET)
	public void loginGET(@ModelAttribute("vo") AdminVO vo){
		logger.info("adminLogin get...");
	}
	
	//adminLoginPost.jsp
	@RequestMapping(value="/adminLoginPost", method=RequestMethod.POST)
	public void loginPOST(AdminDTO dto, HttpSession session, Model model)throws Exception{
		logger.info("loginPOST post...");
		
		AdminVO vo = service.login(dto);
		
		if(vo == null){
			return;
		}
		
		model.addAttribute("AdminVO", vo);
	}
//로그인 처리 끝
	
//로그아웃 처리
	//adminLogout.jsp
	@RequestMapping(value="/adminLogout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session) throws Exception {
		logger.info("adminLogout get...");
		
		Object obj = session.getAttribute("login");
		
		if(obj != null){
			AdminVO vo = (AdminVO) obj;
			
			session.removeAttribute("login");
			session.invalidate();
		}
		return "/adminLogout";	
	}
		
}
