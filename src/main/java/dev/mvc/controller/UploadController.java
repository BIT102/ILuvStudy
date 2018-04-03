package dev.mvc.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dev.mvc.service.StudyService;
import dev.mvc.util.MediaUtils;
import dev.mvc.util.UploadFileUtils;


//�����մϴ�
//ajax ȭ����ô�
@Controller
@RequestMapping("/study/*")
public class UploadController {

	@Resource(name="uploadPath")
	private String uploadPath;
	@Resource(name="uploadPathUser")
	private String uploadPathUser;
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	@Inject 
	private StudyService service;
	
	@RequestMapping(value="/uploadAjax", method=RequestMethod.GET)
	public void uploadAjax() {
		
	}
	
	//���Ͼ��ε�
	@ResponseBody
	@RequestMapping(value = "/uploadAjax",
	                method = RequestMethod.POST,
	                produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		
		logger.info("originalName: "+file.getOriginalFilename());
//		logger.info("size: "+file.getSize());
//		logger.info("contentType: "+file.getContentType());
		
	
		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath,
				file.getOriginalFilename(), 
				file.getBytes()),
				HttpStatus.CREATED);
		
//		(file.getOriginalFilename(), HttpStatus.CREATED);
	}
	//���������
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
				
				logger.info("FILE NAME : " + fileName);
				
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			
			
			in = new FileInputStream(uploadPath+fileName);
			
			if(mType != null){
				headers.setContentType(mType);
			} else {
				
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+
							new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
					                            headers,
					                            HttpStatus.CREATED);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			} finally {
				in.close();

			}
		return entity;
		}
	//�����ͻ���
	//�㤿��������
	@ResponseBody
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("bsBno") Integer bsBno, String fileName) throws Exception {
		
		System.out.println("***********************************************");
		System.out.println(fileName);
		System.out.println("***********************************************");
		
		logger.info("delete file: "+fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType = MediaUtils.getMediaType(formatName);
	

		if(mType != null) {
			
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			
			service.deleteFile(bsBno, fileName);
			new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
		}
		
		service.deleteFile(bsBno, fileName);
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

}
