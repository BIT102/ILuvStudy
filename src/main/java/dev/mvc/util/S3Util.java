/*package dev.mvc.util;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.ClientConfiguration;
import com.amazonaws.Protocol;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;

public class S3Util {
	
	private String accessKey = "���Ⱥ��Ⱥ���"; // ������ Ű
	private String secretKey = "���Ⱥ��Ⱥ���"; // ���� ������ Ű

	private AmazonS3 conn;

	public S3Util() {
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
		ClientConfiguration clientConfig = new ClientConfiguration();
		clientConfig.setProtocol(Protocol.HTTP);
		this.conn = new AmazonS3Client(credentials, clientConfig);
		conn.setEndpoint("s3.ap-northeast-2.amazonaws.com"); // ��������Ʈ ���� [ �ƽþ� ����� ���� ]
	}

	// ��Ŷ ����Ʈ�� �������� �޼����̴�.
	public List<Bucket> getBucketList() {
		return conn.listBuckets();
	}

	// ��Ŷ�� �����ϴ� �޼����̴�.
	public Bucket createBucket(String bucketName) {
		return conn.createBucket(bucketName);
	}

	// ���� ���� (������ ���ϸ� �ڿ� "/"�� �ٿ����Ѵ�.)
	public void createFolder(String bucketName, String folderName) {
		conn.putObject(bucketName, folderName + "/", new ByteArrayInputStream(new byte[0]), new ObjectMetadata());
	}

	// ���� ���ε�
	public void fileUpload(String bucketName, String fileName, byte[] fileData) throws FileNotFoundException {

		String filePath = (fileName).replace(File.separatorChar, '/'); // ���� �����ڸ� `/`�� ����(\->/) �̰� ������ / ��� �Ѿ���鼭 \�� �ٲ�� �Ű���.
		System.out.println("=============================="+filePath);
		ObjectMetadata metaData = new ObjectMetadata();

		metaData.setContentLength(fileData.length);   //��Ÿ������ ���� -->������ 128kB���� ���ε� ���������� ����ũ�⸸ŭ ���۸� �������״�.
	    ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(fileData); //���� ����

		conn.putObject(bucketName, filePath, byteArrayInputStream, metaData);

	}

	// ���� ����
	public void fileDelete(String bucketName, String fileName) {
		String imgName = (fileName).replace(File.separatorChar, '/');
		conn.deleteObject(bucketName, imgName);
		System.out.println("��������");
	}

	// ���� URL
	public String getFileURL(String bucketName, String fileName) {
		System.out.println("�Ѿ���� ���ϸ� : "+fileName);
		String imgName = (fileName).replace(File.separatorChar, '/');
		return conn.generatePresignedUrl(new GeneratePresignedUrlRequest(bucketName, imgName)).toString();
	}
	
	// src���� �о����
    public S3ObjectInputStream getSrcFile(String bucketName, String fileName) throws IOException{
        System.out.println("�Ѿ���� ���ϸ� : "+fileName);
        fileName = (fileName).replace(File.separatorChar, '/');
        S3Object s3object = conn.getObject(new GetObjectRequest(bucketName, fileName)); //�ش� ���� s3��ü�� ���
        S3ObjectInputStream objectInputStream = s3object.getObjectContent();    //s3��ü�� ��Ʈ������ ��ȯ

        return objectInputStream;
    }
	
	
}
*/