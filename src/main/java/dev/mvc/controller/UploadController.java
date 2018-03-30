package dev.mvc.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.annotation.Resource;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dev.mvc.util.MediaUtils;
import dev.mvc.util.S3Util;
import dev.mvc.util.UploadFileUtils;


//�����մϴ�
//ajax ȭ����ô�
@Controller
@RequestMapping("/study/*")
public class UploadController {
	
	S3Util s3 = new S3Util();
    String bucketName = "iluvstudy";
	

	@Resource(name="uploadPath")
	private String uploadPath;
	@Resource(name="uploadPathUser")
	private String uploadPathUser;
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	   @RequestMapping(value ="/uploadAjax", method =RequestMethod.GET)
	   public void uploadAjax(){
	      
	   }
	   
	   //���Ͼ��ε�
		@ResponseBody
		@RequestMapping(value = "/uploadAjax",
		                method = RequestMethod.POST,
		                produces = "text/plain;charset=UTF-8")
		public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
			
			logger.info("originalName: "+file.getOriginalFilename());
//			logger.info("size: "+file.getSize());
//			logger.info("contentType: "+file.getContentType());
			
			System.out.println("���ε���Ʈ�ѷ� : ���� ���ε� 11111");
			
			
			// **************�� �Ʒ� �� ���Ϳ� �Ф� **************************************
			// �̰� �� ����.........................................
			System.out.println("���ε��н�����" +UploadFileUtils.uploadFile(uploadPath,
					file.getOriginalFilename(), 
					file.getBytes()));
			
			return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath,
					file.getOriginalFilename(), 
					file.getBytes()),
					HttpStatus.CREATED);
			
//			(file.getOriginalFilename(), HttpStatus.CREATED);
		}
	   
	   //���� ǥ��
	    @ResponseBody
	    @RequestMapping("/displayFile")
	    public ResponseEntity<byte[]> displayFile(String fileName)throws Exception{

	    	System.out.println("���ε���Ʈ�ѷ� : ���� ���ε� 2222");
	        InputStream in = null;
	        ResponseEntity<byte[]> entity = null;
	        HttpURLConnection uCon = null;
	        System.out.println("FILE NAME: " + fileName);

	        System.out.println("���ε���Ʈ�ѷ� : ���� ���ε� 3333");
	        try{
	            String formatName = fileName.substring(fileName.lastIndexOf(".")+1);

	            MediaType mType = MediaUtils.getMediaType(formatName);
	            HttpHeaders headers = new HttpHeaders();

	            String inputDirectory = "study";
	            URL url;

	            //in = new FileInputStream(uploadPath+fileName);
	            //System.out.println("in : "+in);
//	            if(mType != null){
//	                headers.setContentType(mType);
//	            }else{
	//
//	                fileName = fileName.substring(fileName.indexOf("_")+1);
//	                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//	                headers.add("Content-Disposition","attachment; filename=\""+new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");
//	            }
	            
	            System.out.println("���ε���Ʈ�ѷ� : ���� ���ε� 44444");

	            try {
	                url = new URL(s3.getFileURL(bucketName, inputDirectory+fileName));
	                System.out.println("https://s3.ap-northeast-2.amazonaws.com/"+inputDirectory+"/study"+fileName);
	                System.out.println("���˿� :" + url);
	                uCon = (HttpURLConnection) url.openConnection();
	                System.out.println("���� :" + uCon);
	                in = uCon.getInputStream(); // �̹����� �ҷ���
	                System.out.println("������ :" + in);
	            } catch (Exception e) {
	                url = new URL(s3.getFileURL(bucketName, "default.jpg"));
	                uCon = (HttpURLConnection) url.openConnection();
	                in = uCon.getInputStream();
	            }

	            System.out.println("���ε���Ʈ�ѷ� : ���� ���ε� 55555");
	            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
	            headers,
	            HttpStatus.CREATED);
	        }catch (FileNotFoundException effe){
	            System.out.println("File Not found Exception");
	            String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	            MediaType mType = MediaUtils.getMediaType(formatName);
	            HttpHeaders headers = new HttpHeaders();
	            in = new FileInputStream(uploadPath+"/noimage11.jpeg");

	                headers.setContentType(mType);

	            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
	                    headers,
	                    HttpStatus.CREATED);
	            System.out.println("���ε���Ʈ�ѷ� : ���� ���ε� 666666");
	        }catch (Exception e){
	            e.printStackTrace();
	            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	        }finally {
	            in.close();
	        }
	        return entity;
	    }
	//   @ResponseBody
	//   @RequestMapping("/displayFile")
	//   public ResponseEntity<byte[]> displayFile(String fileName)throws Exception{
//	      
//	      InputStream in =null;
//	      ResponseEntity<byte[]> entity = null;
//	      
//	      logger.info("FILE NAME : " + fileName);
//	      
//	      try {
//	         String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
//	         //Ȯ���� �̸� ����
//	         MediaType mType = MediaUtils.getMediaType(formatName);
//	         HttpHeaders headers = new HttpHeaders();
//	         in = new FileInputStream(uploadPath+fileName);
//	         
//	         
//	         //�̹��������ΰ��
//	         if(mType != null) {
//	            headers.setContentType(mType);
//	         }else{
//	            //�̹������ϾƴѰ��
//	            fileName = fileName.substring(fileName.indexOf("_")+1);
//	            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//	            //headers.setContentLength(IOUtils.toByteArray(in).length);
//	            headers.add("Content-Disposition", "attachment; filename=\""+
//	            new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");
//	         }
//	         
//	         logger.info("headers : " + headers);
//	         entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
//	      } catch (Exception e) {
//	         e.printStackTrace();
//	         entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
//	      }finally{
//	         in.close();
//	      }
//	      return entity;
	//   }
	   
	   //���� ����
	   @ResponseBody
	   @RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	   public ResponseEntity<String> deleteFile(String fileName){
	      logger.info("delete file: "+fileName);
	      
	      String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	      
	      //Ȯ���� �̸� ����
	      MediaType mType = MediaUtils.getMediaType(formatName);
	      
	      //�̹��������ΰ�� �������� ���� ����
	      if(mType != null) {
	         String front = fileName.substring(0, 12);
	         String end = fileName.substring(14);
	         //���ϻ���
	         new File(uploadPath + (front+end).replace('/',File.separatorChar)).delete();
	      }
	      //�Ϲ� ���� ����
	      new File(uploadPath + fileName.replace('/',File.separatorChar)).delete();
	      
	      return new ResponseEntity<String>("deleted", HttpStatus.OK);
	   }
	}