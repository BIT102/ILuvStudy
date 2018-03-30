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

//�켱�����Ҳ���

public class UploadFileUtils {

	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);
	
	public static String uploadFile(String uploadPath,
			                        String originalName,
			                        byte[] fileData) throws Exception {
		// AWS s3 
				S3Util s3 = new S3Util();
				String bucketName = "iluvstudy";
				
				//���� �̸� �ߺ� ���ϱ����ؼ��մϴ�
				UUID uid = UUID.randomUUID();
				
				
//				String saverDName = uid.toString() + "_" +originalName;
				String saverDName = "/"+ uid.toString() + "_" +originalName;
				
				logger.info("���ε� ��� : " + uploadPath);
				
				//��������(��¥)
				String savedPath = calcPath(uploadPath);
			
				File target = new File(uploadPath + savedPath, saverDName);
				
				//��������
				//FileCopyUtils.copy(fileData, target);
				
				//Ȯ����
				String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
				
				String uploadedFileName = uploadedFileName = (savedPath + saverDName).replace(File.separatorChar, '/');
				
				logger.info("���ε� ���ϸ�: "+ uploadedFileName);
				logger.info("�������� ����: "+ originalName);
				logger.info("���ϵ�����: "+ fileData);
				
				//S3Util �� fileUpload �޼���� ������ ���ε��Ѵ�.
				//s3.fileUpload(bucketName, uploadPath+uploadedFileName, fileData);
				System.out.println("����????????????????????"+uploadPath+uploadedFileName);
				s3.fileUpload(bucketName, uploadPath+uploadedFileName, fileData);
								
				//Ȯ����Ȯ��
				if(MediaUtils.getMediaType(formatName) != null) {
					System.out.println("Ȯ���� Ȯ�� 1111111111");
					//uploadedFileName = makeThumbnail(uploadPath, savedPath, saverDName);
					
					// ********���⼭���� �ȵſ� �ФФ�************************************
					System.out.println("Ȯ���� Ȯ��222 :" + uploadedFileName);
				} else {
					uploadedFileName = makeIcon(uploadPath, savedPath, saverDName);
					System.out.println("Ȯ���� Ȯ��333");
				}
				return uploadedFileName;
			} 
			
			private static String makeIcon(String uploadPath,
					                       String path,
					                       String fileName) throws Exception {
				
				String iconName = uploadPath + path + File.separator + fileName;
				logger.info("�����ܳ��� :" + iconName);
				
				return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
			}
			
			//��¥��� �����ϱ����ؼ� �����̿�
			private static String calcPath(String uploadPath) {
				
				Calendar cal = Calendar.getInstance();
				
				String yearPath = File.separator+cal.get(Calendar.YEAR);
				
				String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
				
				String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
				
				makeDir(uploadPath, yearPath, monthPath, datePath);
				
				logger.info("��¥ ���� :" + datePath);
				
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
			// ����� �����ϱ� (�̹��� �����̶�� ����� ���� �̸����� ��ȯ)
		/*	private static String makeThumbnail(String uploadPath,
					                            String path,
												String fileName) throws Exception {
			
				System.out.println("����� ������?====");
				System.out.println("���ε��н� : " + uploadPath);
				System.out.println("�׳��н� : " + path);
				System.out.println("���ϳ��� : " + fileName);
				
				File aaa = new File((uploadPath+path +  fileName));
				System.out.println("aaa :"+ aaa);
				
				// !!!!!!!! ���⼭ �ȵžȵžȵžȵžȵžȵ� !!!!!!!!!!!11
				BufferedImage sourceImg = ImageIO.read(new File(uploadPath+path, fileName));
				System.out.println("-----------");
				System.out.println("�ҽ��̹���" + sourceImg);
				
				//ũ��
				BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);
				
				String thumbnailName = uploadPath + path + File.separator + "S_" + fileName;
				
				File newFile = new File(thumbnailName);
				String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
				
				ImageIO.write(destImg,  formatName.toUpperCase(), newFile);
				return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
			}	*/
		}//uploadfileutile Ŭ��������
