package dev.mvc.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dev.mvc.domain.BookmarkVO;
import dev.mvc.domain.UserVO;
import dev.mvc.service.BookmarkService;

@Controller
@RequestMapping("/study/bookmark/*")
public class BookmarkController {

	private static final Logger logger = LoggerFactory.getLogger(BookmarkController.class);
	
	@Inject
	private BookmarkService service;
	
	
	//ºÏ¸¶Å©µî·Ï
	@RequestMapping(value="/a", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody BookmarkVO vo,  HttpServletRequest request) {
	
		ResponseEntity<String> entity = null;
		
		HttpSession session = request.getSession();
		UserVO sUser = (UserVO)session.getAttribute("login");
		String email = sUser.getEmail();
		
		vo.setUserEmail(email);
		
		try {
			service.addBookmark(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch(Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}


	//ºÏ¸¶Å© Ãë¼Ò
	@ResponseBody
	@RequestMapping(value="/dee", method=RequestMethod.POST)
	public ResponseEntity<String> remove(@RequestParam("bsBno") Integer bsBno, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO sUser = (UserVO)session.getAttribute("login");
		String email = sUser.getEmail();
		
		
		System.out.println("±è»ó¿í±è»ó¿í±è»ó¿í±è»ó¿í");
		System.out.println(bsBno);
		System.out.println("±è»ó¿í±è»ó¿í±è»ó¿í±è»ó¿í");
		
		ResponseEntity<String> entity = null;
		try {
			service.removeBookmark(bsBno, email);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e){
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
}
