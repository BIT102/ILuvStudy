package dev.mvc.controller;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import dev.mvc.domain.NoticeVO;
import dev.mvc.domain.UserVO;
import dev.mvc.service.NoticeService;
import dev.mvc.service.UserService;
import dev.mvc.util.S3Util;
import dev.mvc.util.UploadFileUtils;

@Controller
public class PUploadController {
	
	S3Util s3 = new S3Util();
    String bucketName = "iluvstudy";
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	@Resource(name="uploadPathUser")
	private String uploadPathUser;
	
	@Inject
	private UserService service;
	
	@Inject
	private NoticeService noticeService;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(PUploadController.class);
	
	// 사진업로드
	@RequestMapping(value="/pUploadForm", method = RequestMethod.GET)
	public void uploadForm(){
		
	}
	
	// iframe을 활용 업로드
	@RequestMapping(value="/pUploadForm", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
//	public void uploadForm(MultipartFile file, Model model) throws Exception{
	public ResponseEntity<String> uploadForm(UserVO vo, MultipartFile file, Model model, HttpServletRequest request) throws Exception{	

		
		System.out.println("업로드시작============");
		logger.info("originalName: "+file.getOriginalFilename());
//		logger.info("size: "+file.getSize());
//		logger.info("contentType: "+file.getContentType());
		
		String uploadFile = UploadFileUtils.uploadFile(uploadPath,
				file.getOriginalFilename(), 
				file.getBytes());
		
		System.out.println("업로드패스스스" +uploadFile);
			
		HttpSession session = request.getSession();
		UserVO sUser = (UserVO)session.getAttribute("login");
		String email = sUser.getEmail();
		
		
		vo.setPhoto(uploadFile);
		
		vo.setEmail(email);
		
		service.insertImg(vo);
		
		return new ResponseEntity<>(uploadFile, HttpStatus.CREATED);
	}
	
	// iframe을 활용 업로드, 공지사항 사진 업데이트용
	@RequestMapping(value="/noticeUpload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> noticeuploadForm(NoticeVO vo, MultipartFile file, Model model, HttpServletRequest request) throws Exception{	
		
		
		System.out.println("업로드시작============");
		logger.info("originalName: "+file.getOriginalFilename());
		
		String uploadFile = UploadFileUtils.uploadFile(uploadPath,
				file.getOriginalFilename(), 
				file.getBytes());
		
		System.out.println("업로드패스스스" +uploadFile);
		
		System.out.println(request.getParameter("bno"));
		System.out.println(Integer.parseInt(request.getParameter("bno")));
		
		
		vo.setPhoto(uploadFile);

		vo.setBno(Integer.parseInt(request.getParameter("bno")));  //쿼리스트링에서 bno값 가져와서 담아줌

		noticeService.insertImg(vo); //db에 bno, photo 경로 담아줌
		
		return new ResponseEntity<>(uploadFile, HttpStatus.CREATED);
	}
	
	
	
	


/*	@ResponseBody	//byte[] 데이터가 그대로 전송
	@RequestMapping("/pDisplayFile")
	public ResponseEntity<byte[]> DisplayFile(String fileName) throws Exception{
								// 파라미터로 브라우저에서 전송받기를 원하는 파일의 이름을 받음(년/월/일/파일명 형태로)

    	System.out.println("업로드컨트롤러 : 파일 업로드 2222");
        InputStream in = null;
        ResponseEntity<byte[]> entity = null;
        HttpURLConnection uCon = null;
        System.out.println("FILE NAME: " + fileName);

        System.out.println("업로드컨트롤러 : 파일 업로드 3333");
        try{
            String formatName = fileName.substring(fileName.lastIndexOf(".")+1);

            MediaType mType = MediaUtils.getMediaType(formatName);
            HttpHeaders headers = new HttpHeaders();

            String inputDirectory = "study";
            URL url;

            //in = new FileInputStream(uploadPath+fileName);
            //System.out.println("in : "+in);
//            if(mType != null){
//                headers.setContentType(mType);
//            }else{
//
//                fileName = fileName.substring(fileName.indexOf("_")+1);
//                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//                headers.add("Content-Disposition","attachment; filename=\""+new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");
//            }
            
            System.out.println("업로드컨트롤러 : 파일 업로드 44444");

            try {
                url = new URL(s3.getFileURL(bucketName, inputDirectory+fileName));
                System.out.println("https://s3.ap-northeast-2.amazonaws.com/"+inputDirectory+"/study"+fileName);
                System.out.println("유알엘 :" + url);
                uCon = (HttpURLConnection) url.openConnection();
                System.out.println("유콘 :" + uCon);
                in = uCon.getInputStream(); // 이미지를 불러옴
                System.out.println("인인인 :" + in);
            } catch (Exception e) {
                url = new URL(s3.getFileURL(bucketName, "default.jpg"));
                uCon = (HttpURLConnection) url.openConnection();
                in = uCon.getInputStream();
            }

            System.out.println("업로드컨트롤러 : 파일 업로드 55555");
            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
            headers,
            HttpStatus.CREATED);
        }catch (FileNotFoundException effe){
            System.out.println("File Not found Exception");
            String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
            MediaType mType = MediaUtils.getMediaType(formatName);
            HttpHeaders headers = new HttpHeaders();
            in = new FileInputStream(uploadPath+"/noimg.jpg");

                headers.setContentType(mType);

            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
                    headers,
                    HttpStatus.CREATED);
            System.out.println("업로드컨트롤러 : 파일 업로드 666666");
        }catch (Exception e){
            e.printStackTrace();
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        }finally {
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
	}*/
	
}
