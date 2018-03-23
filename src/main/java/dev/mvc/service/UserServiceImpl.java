package dev.mvc.service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import dev.mvc.domain.StudyVO;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.LoginDTO;
import dev.mvc.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO dao;
	@Inject
	private JavaMailSender mailSender;
	
	//ȸ������
	@Override
	public void joinUser(UserVO vo) throws Exception {
		dao.joinUser(vo);
	}

	// ������ ȸ������ �о����
	@Override
	public UserVO read(String email) throws Exception {
		return dao.read(email);
	}

	// ������ ȸ�� ���� ����
	@Override
	public void update(UserVO vo) throws Exception {
		dao.update(vo);
	}

	// ���� �ΰ� ���� ����
	@Override
	public void updateAddInfo(UserVO vo) throws Exception {
		dao.updateAddInfo(vo);
	}

	// ��й�ȣ ����
	@Override
	public void changePw(UserVO vo) throws Exception {
		dao.changePw(vo);
	}

	// ����� Ż��
	@Override
	public void quit(UserVO vo) throws Exception {
		dao.quit(vo);
	}
	


	// ============== sangwook ================
	
	@Override
	public int chkEmail(String email) throws Exception {
		
		// ��ȿ�� �˻�(���ĺ�, ����, ����, @/. 1����)
		// return ��  -1:��ȿ������ 1:�ߺ����߻� 0:����
		
		// �ҹ��ڷ� ����
		email = email.toLowerCase();

		// ����
		String email1 = email.substring(0,email.indexOf('@'));
		
		if(6 > email1.length()||email1.length()>12) 
			return -1; 
		
		// @, . 1��
		int annCnt = 0; // @
		int dotCnt = 0; // .
		
		for(int i = 0; i < email.length(); i++){
			if(email.charAt(i)=='@') 
				annCnt++;
			else if(email.charAt(i)=='.')
				dotCnt++;
		}
		
		if(annCnt!=1 || dotCnt!=1)
			return -1;
		
		// ���ĺ�, ���ڷ� �̷�� ������ Ȯ��
		for(int i = 0; i < email.length(); i++){
			if(!((97<=email.charAt(i)&&email.charAt(i)<=122)
					||(48<=email.charAt(i)&&email.charAt(i)<=57)
					||email.charAt(i)=='@'||email.charAt(i)=='.')){
				return -1;
			}
		}

		// �ߺ�üũ
		return dao.chkEmail(email); // 0 or 1 �� ����
	}

	@Override
	public String sendEmail(String email) throws Exception {
		
		System.out.println("==============================");
		System.out.println("sendEmail.............");
		System.out.println("==============================");
		String setfrom = "lswkim322@gmail.com";         
	    String tomail  = email;     // �޴� ��� �̸���
	    String title   = "[ILOVESTUDY]������ȣ �߼�";      // ����
	    
	    String code = UUID.randomUUID().toString().replace("-", "").substring(0, 6);
	    String content = "������ȣ�� ["+code+"] �Դϴ�. �ش� ��ȣ�� �Է��� �ּ���.";    // ����
	   	    
	    String htmltext = 
	    "<html>"
	    	+"<head>"
	    	+"<title>/</title>"
	    	+"</head>"
	    	+"<body>"
	    	+"<a href = 'http://localhost:8080/emailConf?email="+email+"'>�����Ͻ÷��� ���⸦ Ŭ���ϼ���</a>"
	    	+"</body>"
	    +"</html>";
	    
	    MimeMessage message = mailSender.createMimeMessage();
	    MimeMessageHelper messageHelper 
	                      = new MimeMessageHelper(message, true, "UTF-8");
	 
	    messageHelper.setFrom(setfrom);  // �����»�� �����ϰų� �ϸ� �����۵��� ����
	    messageHelper.setTo(tomail);     // �޴»�� �̸���
	    messageHelper.setSubject(title); // ���������� ������ �����ϴ�
	    //messageHelper.setText(content);  // ���� ����
	    messageHelper.setText(content, htmltext); 
	    
	    mailSender.send(message);

	    return code;  // ������ ������ȣ�� ��Ƽ� ���Ͻ�Ŵ
	}
	
	@Override
	public int chkNickname(String nickName)throws Exception{
		return dao.chkNickname(nickName); 
	}

	
	public void emailConf(String email)throws Exception{
		dao.emailConf(email);
	}
	
}
