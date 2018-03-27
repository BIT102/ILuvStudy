package dev.mvc.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dev.mvc.util.MediaUtils;
import dev.mvc.util.pMediaUtils;
import dev.mvc.util.pUploadFileUtils;

@Controller
public class PUploadController {
	
	@Resource(name = "uploadPath")
	private String uploadPath;

	
	private static final Logger logger = 
			LoggerFactory.getLogger(PUploadController.class);
	
	// �������ε�
	@RequestMapping(value="/pUploadForm", method = RequestMethod.GET)
	public void uploadForm(){
		
	}
	
	// iframe�� Ȱ�� ���ε�
	@RequestMapping(value="/pUploadForm", method = RequestMethod.POST)
//	public void uploadForm(MultipartFile file, Model model) throws Exception{
	public String uploadForm(MultipartFile file, Model model) throws Exception{	
		
		logger.info("orginalName:" + file.getOriginalFilename());
		logger.info("size:" + file.getSize());
		logger.info("contentType:" + file.getContentType());
		
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		
		model.addAttribute("savedName", savedName);
		
		return "pUploadResult";  // iframe ������ ���� StringŸ�� ��ȯ�Ͽ� pUploadResult �������� ���� ��Ŵ
	}

	
	// ���� ���ε� ���ϸ� Ű�� ����
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		
		UUID uid = UUID.randomUUID(); // UUID - �ߺ����� �ʴ� ������ Ű ���� ������ �� ���
		
		String savedName = uid.toString() + "_"+ originalName; // uid�� ��� UUID_�������ϸ�
		
		File target = new File(uploadPath, savedName);
		
		FileCopyUtils.copy(fileData, target); // ��Ű���� ������ Ŭ����
		
		return savedName;
	}

	// Ajax ���ε�
	@RequestMapping(value="/pUploadAjax", method = RequestMethod.GET)
	public void uploadAjax(){
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/pUploadAjax", method = RequestMethod.POST, 
					produces = "text/plain; charset=UTF-8") // produces�� �ѱ�� ���������� �����ϱ� ����
	public ResponseEntity<String> pUploadAjax(MultipartFile file) throws Exception{
		
		logger.info("orginalName:" + file.getOriginalFilename());
		logger.info("size:" + file.getSize());
		logger.info("contentType:" + file.getContentType());
		
		return
	//		new ResponseEntity<String>(file.getOriginalFilename(), HttpStatus.CREATED); // HttpStatus.OK�� ����
			new ResponseEntity<>(pUploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	}
	
	@ResponseBody	//byte[] �����Ͱ� �״�� ����
	@RequestMapping("/pDisplayFile")
	public ResponseEntity<byte[]> DisplayFile(String fileName) throws Exception{
								// �Ķ���ͷ� ���������� ���۹ޱ⸦ ���ϴ� ������ �̸��� ����(��/��/��/���ϸ� ���·�)

		InputStream in = null;
		ResponseEntity<byte[]> entity = null; // ����Ÿ���� ResponseEntity<byte[]> ����� ���� ������ ������
				
				logger.info("FILE NAME : " + fileName);
				
		try { 
			System.out.println(fileName);
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1); // ���Ͽ��� Ȯ���� ����
	
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
	
	@ResponseBody
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		
		logger.info("delete file:" + fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null){
			
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
		}
		
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
}
