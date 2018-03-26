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
	
	// ���� ���ε�
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception{
		
		UUID uid = UUID.randomUUID(); // ���� ���ϸ� ����
		
		String savedName = uid.toString() + "_"+ originalName; // ����+�������� ���ϸ�
		
		String savedPath = calcPath(uploadPath); // ����� ��� ��� 
		
		File target = new File(uploadPath + savedPath, savedName);
		
		FileCopyUtils.copy(fileData, target); // ���� ������ �����ϴ� �κ�
		
		// ���� ������ Ȯ���� �ǹ�. �̰� �̿��ؼ� pMediaUtils.getMediaType()�� �̿��ؼ� �̹����� �׷��� ���� ��츦 ó��
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1); 
		
		String uploadedFileName = null;
		
		// �̹��� Ÿ�� ������ ��� ����� ����
		if(pMediaUtils.getMediaType(formatName) != null){
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		// �׷��� ������ makeIcon�� �̿��ؼ� ����� ����� ��. makeIcon�� ��� ó���� �ϴ� ���ڿ��� ġȯ�뵵�� �Ұ�
		}else{
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		
		return uploadedFileName;
	}
	
	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception{
		String iconName = uploadPath + path + File.separator + fileName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	
	// ��¥���� �����ϱ� ���ؼ� ���� �̿�
	// ���� �ý����� ��¥�� �´� �����͸� ��
	private static String calcPath(String uploadPath) { 
		
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator+cal.get(Calendar.YEAR);
		
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		logger.info(datePath);
		
		return datePath;
	}
	
	// �� ��¥ ������ �⺻ ��ο� �Բ� makeDir()�� ���޵Ǿ, ������ ����
	private static void makeDir(String uploadPath, String... paths) { 
		
		if(new File(uploadPath + paths[paths.length-1]).exists()) return;
			
		
		for(String path:paths) {
			
			File dirPath = new File(uploadPath+path);
			
			if(! dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
	
	// ����� ����
	private static String makeThumbnail(
				String uploadPath, //�⺻ ���
				String path, // ��/��/�� ����(path)
				String fileName) throws Exception{ // ���� ���ε� �� ���� �̸� �̿�
		
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100); // FIT_TO_HEIGHT ����� ���̸� 100px �����ϰ�.
		
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
		

}
