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
import dev.mvc.persistence.UserDAO;
import dev.mvc.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
//@RequestMapping(value = "/mypage/")
public class AjaxTestController {
	
	private static final Logger logger = LoggerFactory.getLogger(AjaxTestController.class);
	
	

	@RequestMapping(value = "/ajaxTest", method = RequestMethod.GET)
	public String changePwGET(Model model) throws Exception {
		System.out.println("=======ajaxtest 찍힘??===========================");
		return "/mypage/ajaxTest";
		
		
	}

	
	
	@RequestMapping(value = "/ajaxTest", method = RequestMethod.POST)
	public ResponseEntity<String> changePw(@RequestParam("nnowPw1") String nowPw1, 
			@RequestParam("nnowPw2") String nowPw2){ // nnowPw2=key, nowPw2=변수

		System.out.println("==========왜 에러??======");
		
		ResponseEntity<String> entity = null;
		
		try{
			if(nowPw1.equals(nowPw2)){
				entity = new ResponseEntity<String>("hellohello", HttpStatus.OK); //" "이 안에 값이 jsp파일 result값
				System.out.println("==========test===============");
			}
		}catch(Exception e){
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			
		}
		return entity;
	}
	
	
	@RequestMapping(value="/test", method = RequestMethod.GET)
	public String abcGET(Model model) throws Exception{
		
		System.out.println("========test 됨?=======");
		return "/mypage/test";
	}
	
	
	
	@RequestMapping(value = "/test", method = RequestMethod.POST)
	public ResponseEntity<String> abcPOST(@RequestParam("abc") String abc1, //jsp파일 ajax의 data key값. 변수명
			@RequestParam("def") String abc2, @RequestParam("ghi") String abc3){
		
		System.out.println("==========test post 들어옴?=======");
		ResponseEntity<String> entity = null;
		
		try{
			if(abc1.equals(abc2) && abc2.equals(abc3)){
				entity = new ResponseEntity<String>("hihihi", HttpStatus.OK); //" "이 안에 값이 jsp파일 result값
				System.out.println("==========test===============");
			}else{
				entity = new ResponseEntity<String>("false", HttpStatus.OK);
			}
		}catch(Exception e){
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			
		}
		return entity;
	}
	
	
	
	
	

	
	
}
