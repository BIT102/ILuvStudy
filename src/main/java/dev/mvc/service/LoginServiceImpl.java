package dev.mvc.service;

import java.util.Date;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import dev.mvc.domain.AdminVO;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.LoginDTO;
import dev.mvc.persistence.LoginDAO;

@Service
public class LoginServiceImpl implements LoginService {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);

	@Inject
	LoginDAO dao;
	@Inject
	private JavaMailSender mailSender;
	@Inject
	private BCryptPasswordEncoder passwordEncoder; //��������ť��Ƽ ��й�ȣ ��ȣȭ
	
	@Override
	public UserVO userLogin(LoginDTO dto) throws Exception{
		
		// ��ť��Ƽ ��ȣȭ �� �κ� ���ڴ�
		//============================================================
		if(dao.getUserPw(dto.getId()) != null){
			String pw = dao.getUserPw(dto.getId()).getPassword();
			logger.info("��ȣȭ ��й�ȣ : " + pw);
			String rawPw = dto.getPw();
			logger.info("��й�ȣ : " + rawPw);

			if(passwordEncoder.matches(rawPw, pw)){
				logger.info("��й�ȣ ��ġ");
				dto.setPw(pw);
			}else {
				logger.info("��й�ȣ ����ġ");    
			}
		
		}
		//==============================================================
		return dao.userLogin(dto);
	}
	
	@Override
	public AdminVO adminLogin(LoginDTO dto) throws Exception{
		return dao.adminLogin(dto);
	}
	
	@Override
	public void loginupdate(Object adminVO) throws Exception{
		dao.loginupdate(adminVO);
	}
	

	// �������� �α��� ���� �Ǵ�
	@Override
	public void keepLogin(String email, String sessionId, Date next) throws Exception {
		dao.keepLogin(email, sessionId, next);
	}

	// �α��ν� ����ڰ� ����Ű�� ������ �ֳ� üũ (loginCookie�� ��ϵ� ������ ������� ���� ��ȸ) 
	@Override
	public UserVO checkLoginBefore(String value) throws Exception {
		return dao.checkUserWithSessionKey(value);
	}

	@Override
	public String searchEmail(String phone) throws Exception{
		return dao.searchEmail(phone);
	}
	
	//���� �α���
	@Override
	public void googleLogin(UserVO vo)throws Exception{
		
		//vo�� �̸��� ������ user ���̺��� email ���� ��
		//user ���̺� email ������ ������ join �Ƚ�Ŵ
		//user ���̺� email ������ ������ join
		
		if(dao.googleSelect(vo)==0){
			System.out.println("=====���� ����Ѵٿ�==========");
			dao.googleLogin(vo);			
		}
	}
	
	//��й�ȣ ã��
	@Override
	public int sendEmail(String email) throws Exception {
		
		String emailCheck = email.replace("\"", "");
		System.out.println("emailCheck : " + emailCheck);
		
		int result = 0;
		
		//��ġ�ϴ� �̸����� �ִ��� Ȯ��
		if(dao.searchEmailCnt(emailCheck) == 0){
			result = 0;  //��ġ�ϴ� �̸����� ���� ��� ����
		}else{
			
			System.out.println("==============================");
			System.out.println("sendEmail.............");
			System.out.println("==============================");
			String setfrom = "piia_@naver.com";         
			String tomail  = email;     // �޴� ��� �̸���
			String title   = "[ILOVESTUDY] ��й�ȣ �缳�� �̸��� �Դϴ�.";      // ����
			String secretKey = ""; //���� �����
			UserVO vo= new UserVO(); //vo ����
			vo.setEmail(emailCheck); //vo�� �̸��� �����
			
			//���� ���� ============================================
			Random rand = new Random(10);
			rand.setSeed(System.currentTimeMillis());
			
			for(int i=0;i<12;i++){
				System.out.println(rand.nextInt(1000));
				secretKey += rand.nextInt(1000);
			}
			
			System.out.println("==============================");
			System.out.println(secretKey);
			System.out.println("==============================");
			//���� ���� �� ============================================
			
			vo.setSecretKey(secretKey);  //vo�� ��ũ��Ű �����
			
			String content = "�ȳ��ϼ���.I Love Study�Դϴ�. ��й�ȣ �缳�� �����Դϴ�. ��й�ȣ �缳���� ���� ��� �Ʒ��� ��ư�� Ŭ�����ּ���."
					+ "���� ������ �ƴϰų� �� ������ ��û���� ������ ��쿡�� �ش� ������ �������ּ���. �����մϴ�.";    // ����
			
			String htmltext = 
							"<html>"
							+"<head>"
							+"<title>/</title>"
							+"</head>"
							+"<body>"
							+"<a href = 'http://localhost:8888/resetPassword?email="+emailCheck+"&secretKey="+secretKey+"'>��й�ȣ �缳��</a>"
							+"</body>"
							+"</html>";
			
			MimeMessage message2 = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper2 = new MimeMessageHelper(message2, true, "UTF-8");

			messageHelper2.setFrom(setfrom);  // �����»�� �����ϰų� �ϸ� �����۵��� ����
			messageHelper2.setTo(tomail);     // �޴»�� �̸���
			messageHelper2.setSubject(title); // ���������� ������ �����ϴ�
			//messageHelper2.setText(content);  // ���� ����
			messageHelper2.setText(content, htmltext); 
			
			mailSender.send(message2);  // ���� �߼�
			
			dao.secretKeyUpdate(vo);  //���� ���� �� ��ũ��Ű user ���̺� ������Ʈ
			
			result = 1;  //�̸��� �߼� �Ϸ� �� �Ϸ� ���� ����
		}
		
		return result;

	}
}
