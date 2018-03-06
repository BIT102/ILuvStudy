/*package dev.mvc.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dev.mvc.domain.UserVO;
import dev.mvc.service.LoginService;

*//**
 * Handles requests for the application home page.
 *//*
@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	LoginService service;
	
	*//**
	 * Simply selects the home view to render by returning its name.
	 *//*
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGet() {
		logger.info("login joined...................");
		
	}
	
	//로그인 시 DB값과 비교
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(UserVO vo, Model model) throws Exception{
		
		logger.info("login OK joined...................");
		UserVO loginUser = service.login(vo);
		
		if(loginUser != null){ // 값이 담겨 있으면 메인화면으로 이동
			model.addAttribute("vo", loginUser);
			model.addAttribute("result","success");
			return "home";
		}
		
		model.addAttribute("result","fail");
		// 담겨있지 않다면 본래 화면으로 이동
		return "login";
		
	}
	
}
*/