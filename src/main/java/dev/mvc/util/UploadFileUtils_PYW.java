package dev.mvc.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;


//// ============================영원 수정본=========



//우선연습할께용
public class UploadFileUtils_PYW {

	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils_PYW.class);
	
	public static String uploadFile(String uploadPath,
			                        String originalName,
			                        byte[] fileData) throws Exception {
		
		// AWS s3 추가
		S3Util s3 = new S3Util();
		String bucketName = "iluvstudy";
		// s3 끝
		
		//파일 이름 중복 안하기위해서합니다
		UUID uid = UUID.randomUUID();
		
		
//		String saverDName = uid.toString() + "_" +originalName;
		String saverDName = "/"+ uid.toString() + "_" +originalName;
		
		logger.info("업로드 경로 : " + uploadPath);
		
		//저장파일(날짜)
		String savedPath = calcPath(uploadPath);
	
		File target = new File(uploadPath + savedPath, saverDName);
		//원본저장
		FileCopyUtils.copy(fileData, target);
		//확장자
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		
		String uploadedFileName = null;
		
		// s3 추가 시작
		uploadedFileName = (savedPath + saverDName).replace(File.separatorChar, '/');
		//S3Util 의 fileUpload 메서드로 파일을 업로드한다.
		s3.fileUpload(bucketName, uploadPath+uploadedFileName, fileData);		
		logger.info("업로드 파일명:"+ uploadedFileName);
		// s3 추가 끝
		
		
		//확장자확인
		if(MediaUtils.getMediaType(formatName) != null) {
			uploadedFileName = makeThumbnail(uploadPath, savedPath, saverDName);
		} else {
			uploadedFileName = makeIcon(uploadPath, savedPath, saverDName);
		}
		return uploadedFileName;
	} 
	
	private static String makeIcon(String uploadPath,
			                       String path,
			                       String fileName) throws Exception {
		
		String iconName = uploadPath + path + File.separator + fileName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	//날짜펼로 저장하기위해서 파일이용
	private static String calcPath(String uploadPath) {
		
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator+cal.get(Calendar.YEAR);
		
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		logger.info(datePath);
		
		return datePath;
	}
	
	private static void makeDir(String uploadPath, String... paths) {
		
		if(new File(uploadPath + paths[paths.length-1]).exists()) return;
			
		
		for(String path:paths) {
			
			File dirPath = new File(uploadPath+path);
			
			if(! dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
	// 썸네일 생성하기 (이미지 파일이라면 썸네일 파일 이름으로 반환)
	private static String makeThumbnail(String uploadPath,
			                            String path,
										String fileName) throws Exception {
	
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath+path, fileName));
		//크기
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);
		
		String thumbnailName = uploadPath + path + File.separator + "S_" + fileName;
		
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg,  formatName.toUpperCase(), newFile);
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}	
}//uploadfileutile 클래스종료
