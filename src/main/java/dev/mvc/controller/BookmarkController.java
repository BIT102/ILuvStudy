package dev.mvc.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dev.mvc.domain.BookmarkVO;
import dev.mvc.service.BookmarkService;

@Controller
@RequestMapping("/study/bookmark/*")
public class BookmarkController {

	private static final Logger logger = LoggerFactory.getLogger(BookmarkController.class);
	
	@Inject
	private BookmarkService service;
	
	
	//ºÏ¸¶Å©µî·Ï
	@RequestMapping(value="/a", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody BookmarkVO vo) {
	
		ResponseEntity<String> entity = null;
		
		try {
			service.addBookmark(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch(Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	
/*	@RequestMapping(value="/b", method=RequestMethod.POST)
	public ResponseEntity<String> remove(@RequestBody BookmarkVO vo) {
	
		String userEmail = "abc1@gmail.com";
		
		int bsBno = vo.getBsBno();
		
		System.out.println("±è»ó¿í±è»ó¿í±è»ó¿í±è»ó¿í");
		System.out.println();
		System.out.println("±è»ó¿í±è»ó¿í±è»ó¿í±è»ó¿í");
		
		ResponseEntity<String> entity = null;
		try {
			service.removeBookmark(bsBno, userEmail);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e){
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}*/
	
	//ºÏ¸¶Å© ºÒ·¯¿À±â
	@RequestMapping(value="/all/{bsBno}", method=RequestMethod.GET)
	public ResponseEntity<List<BookmarkVO>> list(@PathVariable("bsBno") Integer bsBno) {
		
		ResponseEntity<List<BookmarkVO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.listBookmark(bsBno), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new  ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//ºÏ¸¶Å© Ãë¼Ò
	@ResponseBody
	@RequestMapping(value="/dee", method=RequestMethod.POST)
	public ResponseEntity<String> remove(@RequestParam("bsBno") Integer bsBno) {
		
		String userEmail = "abc1@gmail.com";
		
		
		System.out.println("±è»ó¿í±è»ó¿í±è»ó¿í±è»ó¿í");
		System.out.println(bsBno);
		System.out.println("±è»ó¿í±è»ó¿í±è»ó¿í±è»ó¿í");
		
		ResponseEntity<String> entity = null;
		try {
			service.removeBookmark(bsBno, userEmail);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e){
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
}
