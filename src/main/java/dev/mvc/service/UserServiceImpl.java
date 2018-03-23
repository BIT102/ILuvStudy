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
	
	//회원가입
	@Override
	public void joinUser(UserVO vo) throws Exception {
		dao.joinUser(vo);
	}

	// 프로필 회원정보 읽어오기
	@Override
	public UserVO read(String email) throws Exception {
		return dao.read(email);
	}

	// 프로필 회원 정보 수정
	@Override
	public void update(UserVO vo) throws Exception {
		dao.update(vo);
	}

	// 개인 부가 정보 수정
	@Override
	public void updateAddInfo(UserVO vo) throws Exception {
		dao.updateAddInfo(vo);
	}

	// 비밀번호 변경
	@Override
	public void changePw(UserVO vo) throws Exception {
		dao.changePw(vo);
	}

	// 사용자 탈퇴
	@Override
	public void quit(UserVO vo) throws Exception {
		dao.quit(vo);
	}
	


	// ============== sangwook ================
	
	@Override
	public int chkEmail(String email) throws Exception {
		
		// 유효성 검사(알파벳, 숫자, 길이, @/. 1개씩)
		// return 값  -1:유효성오류 1:중복값발생 0:정상
		
		// 소문자로 변경
		email = email.toLowerCase();

		// 길이
		String email1 = email.substring(0,email.indexOf('@'));
		
		if(6 > email1.length()||email1.length()>12) 
			return -1; 
		
		// @, . 1개
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
		
		// 알파벳, 숫자로 이루어 졌는지 확인
		for(int i = 0; i < email.length(); i++){
			if(!((97<=email.charAt(i)&&email.charAt(i)<=122)
					||(48<=email.charAt(i)&&email.charAt(i)<=57)
					||email.charAt(i)=='@'||email.charAt(i)=='.')){
				return -1;
			}
		}

		// 중복체크
		return dao.chkEmail(email); // 0 or 1 값 리턴
	}

	@Override
	public String sendEmail(String email) throws Exception {
		
		System.out.println("==============================");
		System.out.println("sendEmail.............");
		System.out.println("==============================");
		String setfrom = "lswkim322@gmail.com";         
	    String tomail  = email;     // 받는 사람 이메일
	    String title   = "[ILOVESTUDY]인증번호 발송";      // 제목
	    
	    String code = UUID.randomUUID().toString().replace("-", "").substring(0, 6);
	    String content = "인증번호는 ["+code+"] 입니다. 해당 번호를 입력해 주세요.";    // 내용
	   	    
	    String htmltext = 
	    "<html>"
	    	+"<head>"
	    	+"<title>/</title>"
	    	+"</head>"
	    	+"<body>"
	    	+"<a href = 'http://localhost:8080/emailConf?email="+email+"'>인증하시려면 여기를 클릭하세요</a>"
	    	+"</body>"
	    +"</html>";
	    
	    MimeMessage message = mailSender.createMimeMessage();
	    MimeMessageHelper messageHelper 
	                      = new MimeMessageHelper(message, true, "UTF-8");
	 
	    messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	    messageHelper.setTo(tomail);     // 받는사람 이메일
	    messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	    //messageHelper.setText(content);  // 메일 내용
	    messageHelper.setText(content, htmltext); 
	    
	    mailSender.send(message);

	    return code;  // 생성된 인증번호를 담아서 리턴시킴
	}
	
	@Override
	public int chkNickname(String nickName)throws Exception{
		return dao.chkNickname(nickName); 
	}

	
	public void emailConf(String email)throws Exception{
		dao.emailConf(email);
	}
	
}
