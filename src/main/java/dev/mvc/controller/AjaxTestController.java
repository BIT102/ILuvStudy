package dev.mvc.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dev.mvc.domain.UserVO;
import dev.mvc.dto.UserLoginDTO;
import dev.mvc.persistance.UserDAO;
import dev.mvc.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
//@RequestMapping(value = "/mypage/")
public class AjaxTestController {
	
	private static final Logger logger = LoggerFactory.getLogger(AjaxTestController.class);
	
	@Inject
	UserDAO dao;

	@Inject
	private UserService service;
	

	@RequestMapping(value = "/ajaxTest", method = RequestMethod.GET)
	public String changePwGET(Model model, String password) throws Exception {
		
		return "/mypage/ajaxTest";
	}
	
	
	//ajax 비번 수정
	@RequestMapping(value = "/ajaxTest", method = RequestMethod.POST)
	public ResponseEntity<String> changePw(@RequestParam("nowPw")String nowPw,
									@RequestParam("newPw1") String newPw1, @RequestParam("newPw2") String newPw2, HttpServletRequest request) throws Exception{
	
		
		System.out.println("======nowPw 나우Pw=============");
		System.out.println(nowPw);
		System.out.println(newPw1);
		System.out.println(newPw2);
		
		HttpSession session = request.getSession();
		UserVO sUser = (UserVO)session.getAttribute("login");
		String email = sUser.getEmail();
		
		UserVO vo = service.read(email);
		vo.getPassword();
		
		
		
		
		
		ResponseEntity<String> entity = null;
		
		try{
			if(newPw1.equals(newPw2)){
			entity = new ResponseEntity<String>("pw equal", HttpStatus.OK); // "" 이 안에 값이 jsp파일에 result값이 됨
			System.out.println("============pw1pw2 같니??=============");
		}
			
		}catch(Exception e){
			entity =  new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	
}
