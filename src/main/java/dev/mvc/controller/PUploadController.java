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
	
	// 사진업로드
	@RequestMapping(value="/pUploadForm", method = RequestMethod.GET)
	public void uploadForm(){
		
	}
	
	// iframe을 활용 업로드
	@RequestMapping(value="/pUploadForm", method = RequestMethod.POST)
//	public void uploadForm(MultipartFile file, Model model) throws Exception{
	public String uploadForm(MultipartFile file, Model model) throws Exception{	
		
		logger.info("orginalName:" + file.getOriginalFilename());
		logger.info("size:" + file.getSize());
		logger.info("contentType:" + file.getContentType());
		
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		
		model.addAttribute("savedName", savedName);
		
		return "pUploadResult";  // iframe 동작을 위해 String타입 변환하여 pUploadResult 페이지로 리턴 시킴
	}

	
	// 파일 업로드 파일명 키값 생성
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		
		UUID uid = UUID.randomUUID(); // UUID - 중복되지 않는 고유한 키 값을 설정할 때 사용
		
		String savedName = uid.toString() + "_"+ originalName; // uid에 담긴 UUID_실제파일명
		
		File target = new File(uploadPath, savedName);
		
		FileCopyUtils.copy(fileData, target); // 패키지에 설정된 클래스
		
		return savedName;
	}

	// Ajax 업로드
	@RequestMapping(value="/pUploadAjax", method = RequestMethod.GET)
	public void uploadAjax(){
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/pUploadAjax", method = RequestMethod.POST, 
					produces = "text/plain; charset=UTF-8") // produces는 한국어를 정상적으로 전달하기 위함
	public ResponseEntity<String> pUploadAjax(MultipartFile file) throws Exception{
		
		logger.info("orginalName:" + file.getOriginalFilename());
		logger.info("size:" + file.getSize());
		logger.info("contentType:" + file.getContentType());
		
		return
	//		new ResponseEntity<String>(file.getOriginalFilename(), HttpStatus.CREATED); // HttpStatus.OK와 같음
			new ResponseEntity<>(pUploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	}
	
	@ResponseBody	//byte[] 데이터가 그대로 전송
	@RequestMapping("/pDisplayFile")
	public ResponseEntity<byte[]> DisplayFile(String fileName) throws Exception{
								// 파라미터로 브라우저에서 전송받기를 원하는 파일의 이름을 받음(년/월/일/파일명 형태로)

		InputStream in = null;
		ResponseEntity<byte[]> entity = null; // 리턴타입이 ResponseEntity<byte[]> 결과는 실제 파일의 데이터
				
				logger.info("FILE NAME : " + fileName);
				
		try { 
			System.out.println(fileName);
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1); // 파일에서 확장자 추출
	
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
