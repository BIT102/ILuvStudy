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

public class pUploadFileUtils {

	private static final Logger logger = 
			LoggerFactory.getLogger(pUploadFileUtils.class);
	
	// 파일 업로드
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception{
		
		UUID uid = UUID.randomUUID(); // 랜덤 파일명 생성
		
		String savedName = uid.toString() + "_"+ originalName; // 랜덤+오리지날 파일명
		
		String savedPath = calcPath(uploadPath); // 저장될 경로 계산 
		
		File target = new File(uploadPath + savedPath, savedName);
		
		FileCopyUtils.copy(fileData, target); // 원본 파일을 저장하는 부분
		
		// 원본 파일의 확장자 의미. 이걸 이용해서 pMediaUtils.getMediaType()을 이용해서 이미지와 그렇지 않은 경우를 처리
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1); 
		
		String uploadedFileName = null;
		
		// 이미지 타입 파일의 경우 썸네일 새성
		if(pMediaUtils.getMediaType(formatName) != null){
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		// 그렇지 않으면 makeIcon을 이용해서 결과를 만들어 냄. makeIcon은 경로 처리를 하는 문자열의 치환용도에 불과
		}else{
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		
		return uploadedFileName;
	}
	
	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception{
		String iconName = uploadPath + path + File.separator + fileName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	
	// 날짜별로 저장하기 위해서 파일 이용
	// 현재 시스템의 날짜에 맞는 데이터를 얻어냄
	private static String calcPath(String uploadPath) { 
		
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator+cal.get(Calendar.YEAR);
		
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		logger.info(datePath);
		
		return datePath;
	}
	
	// 얻어낸 날짜 정보는 기본 경로와 함꼐 makeDir()에 전달되어서, 폴더가 생성
	private static void makeDir(String uploadPath, String... paths) { 
		
		if(new File(uploadPath + paths[paths.length-1]).exists()) return;
			
		
		for(String path:paths) {
			
			File dirPath = new File(uploadPath+path);
			
			if(! dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
	
	// 썸네일 생성
	private static String makeThumbnail(
				String uploadPath, //기본 경로
				String path, // 년/월/일 폴더(path)
				String fileName) throws Exception{ // 현재 업로드 된 파일 이름 이용
		
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100); // FIT_TO_HEIGHT 썸네일 높이를 100px 동일하게.
		
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
		

}
