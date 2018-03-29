package dev.mvc.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dev.mvc.util.MediaUtils;
import dev.mvc.util.S3Util;
import dev.mvc.util.UploadFileUtils;

//연습합니다
//ajax 화면띄웁시다
@Controller
@RequestMapping("/study/*")
public class UploadController {

	@Resource(name="uploadPath")
	private String uploadPath;
	@Resource(name="uploadPathUser")
	private String uploadPathUser;
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	// AWS s3 
	S3Util s3 = new S3Util();
	String bucketName = "iluvstudy";

	
	@RequestMapping(value="/uploadAjax", method=RequestMethod.GET)
	public void uploadAjax() {
		
	}
	
	
	//파일업로드
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
	
	//데이터출력
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		HttpURLConnection uCon = null;
				
		logger.info("FILE NAME : " + fileName);
				
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			String inputDirectory = "iluvstudy";
            URL url;
			
//			in = new FileInputStream(uploadPath+fileName);
//			
//			if(mType != null){
//				headers.setContentType(mType);
//			} else {
//				
//				fileName = fileName.substring(fileName.indexOf("_")+1);
//				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//				headers.add("Content-Disposition", "attachment; filename=\""+
//							new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
//			}
			
			try {
                url = new URL(s3.getFileURL(bucketName, inputDirectory+fileName));
                System.out.println(url);
                uCon = (HttpURLConnection) url.openConnection();
                in = uCon.getInputStream(); // 이미지를 불러옴
            } catch (Exception e) {
                url = new URL(s3.getFileURL(bucketName, "default.jpg"));
                uCon = (HttpURLConnection) url.openConnection();
                in = uCon.getInputStream();
            }
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
					                            headers,
					                            HttpStatus.CREATED);
		}catch (FileNotFoundException effe){
            System.out.println("File Not found Exception");
            String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
            MediaType mType = MediaUtils.getMediaType(formatName);
            HttpHeaders headers = new HttpHeaders();
            in = new FileInputStream(uploadPath+"/noimage.jpeg");

                headers.setContentType(mType);

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
	//데이터삭제
	@ResponseBody
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {
		
		logger.info("delete file: "+fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		// 확장자 이름 추출
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		// if 이미지 파일, 원본 파일 삭제
		if(mType != null) {
			
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
		}
		
		// 일반 파일 삭제
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

}

