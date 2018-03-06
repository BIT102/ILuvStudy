package dev.mvc.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dev.mvc.domain.ApplyVO;
import dev.mvc.service.ApplyService;

@Controller
@RequestMapping("/study/*")
public class ApplyController {

	@Inject
	private ApplyService service;
	
	
	//스터디 등록
	@RequestMapping(value="/apply/create", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ApplyVO vo) {
		
		ResponseEntity<String> entity = null;
		
		try {
			service.addApply(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			 
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//스터디 신청자 불러오기
	@RequestMapping(value="/apply/{bsBno}", method=RequestMethod.GET)
	public ResponseEntity<List<ApplyVO>> list(@PathVariable("bsBno") Integer bsBno) {
		
		ResponseEntity<List<ApplyVO>> entity = null;
		
		try {
			entity = new ResponseEntity<List<ApplyVO>>(service.list(bsBno), HttpStatus.OK);
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<ApplyVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//스터디 상태값 업데이트 
	@RequestMapping(value="/apply/update", method={RequestMethod.PATCH, RequestMethod.PUT})
	public ResponseEntity<String> update(@RequestBody ApplyVO vo) {
		
		ResponseEntity<String> entity = null;
		
		try {
			service.modifyApply(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//스터디 등록 취소

	@RequestMapping(value="/apply/de", method=RequestMethod.POST)
	public ResponseEntity<String> remove(@RequestBody ApplyVO vo) {
		
		System.out.println("김상욱======================================");
		System.out.println(vo);
		System.out.println("김상욱======================================");
		
		ResponseEntity<String> entity = null;
		
		try {
			service.removeApply(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		} catch(Exception e) {
			e.getMessage();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
