package dev.mvc.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dev.mvc.commons.UploadFileUtils;


//연습합니다
//ajax 화면띄웁시다
@Controller
public class UploadController {

	@Resource(name="uploadPath")
	private String uploadPath;

	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	@RequestMapping(value="/uploadAjax", method=RequestMethod.GET)
	public void uploadAjax() {
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/uploadAjax",
	                method = RequestMethod.POST,
	                produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		
		logger.info("originalName: "+file.getOriginalFilename());
		logger.info("size: "+file.getSize());
		logger.info("contentType: "+file.getContentType());
		
		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath,
									file.getOriginalFilename(), 
									file.getBytes()),
									HttpStatus.CREATED);

	}
}
