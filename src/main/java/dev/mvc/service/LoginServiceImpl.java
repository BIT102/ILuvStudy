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
	private BCryptPasswordEncoder passwordEncoder; //스프링시큐리티 비밀번호 암호화
	
	@Override
	public UserVO userLogin(LoginDTO dto) throws Exception{
		
		// 시큐리티 암호화 된 부분 디코더
		//============================================================
		if(dao.getUserPw(dto.getId()) != null){
			String pw = dao.getUserPw(dto.getId()).getPassword();
			logger.info("암호화 비밀번호 : " + pw);
			String rawPw = dto.getPw();
			logger.info("비밀번호 : " + rawPw);

			if(passwordEncoder.matches(rawPw, pw)){
				logger.info("비밀번호 일치");
				dto.setPw(pw);
			}else {
				logger.info("비밀번호 불일치");    
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
	

	// 세션으로 로그인 여부 판단
	@Override
	public void keepLogin(String email, String sessionId, Date next) throws Exception {
		dao.keepLogin(email, sessionId, next);
	}

	// 로그인시 사용자가 세션키를 가지고 있나 체크 (loginCookie에 기록된 값으로 사용자의 정보 조회) 
	@Override
	public UserVO checkLoginBefore(String value) throws Exception {
		return dao.checkUserWithSessionKey(value);
	}

	@Override
	public String searchEmail(String phone) throws Exception{
		return dao.searchEmail(phone);
	}
	
	//구글 로그인
	@Override
	public void googleLogin(UserVO vo)throws Exception{
		
		//vo의 이메일 정보와 user 테이블의 email 정보 비교
		//user 테이블에 email 정보가 있으면 join 안시킴
		//user 테이블에 email 정보가 있으면 join
		
		if(dao.googleSelect(vo)==0){
			System.out.println("=====없음 등록한다요==========");
			dao.googleLogin(vo);			
		}
	}
	
	//비밀번호 찾기
	@Override
	public int sendEmail(String email) throws Exception {
		
		String emailCheck = email.replace("\"", "");
		System.out.println("emailCheck : " + emailCheck);
		
		int result = 0;
		
		//일치하는 이메일이 있는지 확인
		if(dao.searchEmailCnt(emailCheck) == 0){
			result = 0;  //일치하는 이메일이 없을 경우 리턴
		}else{
			
			System.out.println("==============================");
			System.out.println("sendEmail.............");
			System.out.println("==============================");
			String setfrom = "piia_@naver.com";         
			String tomail  = email;     // 받는 사람 이메일
			String title   = "[ILOVESTUDY] 비밀번호 재설정 이메일 입니다.";      // 제목
			String secretKey = ""; //난수 저장용
			UserVO vo= new UserVO(); //vo 생성
			vo.setEmail(emailCheck); //vo에 이메일 담아줌
			
			//난수 생성 ============================================
			Random rand = new Random(10);
			rand.setSeed(System.currentTimeMillis());
			
			for(int i=0;i<12;i++){
				System.out.println(rand.nextInt(1000));
				secretKey += rand.nextInt(1000);
			}
			
			System.out.println("==============================");
			System.out.println(secretKey);
			System.out.println("==============================");
			//난수 생성 끝 ============================================
			
			vo.setSecretKey(secretKey);  //vo에 시크릿키 담아줌
			
			String content = "안녕하세요.I Love Study입니다. 비밀번호 재설정 메일입니다. 비밀번호 재설정을 원할 경우 아래의 버튼을 클릭해주세요."
					+ "만약 본인이 아니거나 이 메일을 요청하지 않으신 경우에는 해당 메일을 무시해주세요. 감사합니다.";    // 내용
			
			String htmltext = 
							"<html>"
							+"<head>"
							+"<title>/</title>"
							+"</head>"
							+"<body>"
							+"<a href = 'http://localhost:8888/resetPassword?email="+emailCheck+"&secretKey="+secretKey+"'>비밀번호 재설정</a>"
							+"</body>"
							+"</html>";
			
			MimeMessage message2 = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper2 = new MimeMessageHelper(message2, true, "UTF-8");

			messageHelper2.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper2.setTo(tomail);     // 받는사람 이메일
			messageHelper2.setSubject(title); // 메일제목은 생략이 가능하다
			//messageHelper2.setText(content);  // 메일 내용
			messageHelper2.setText(content, htmltext); 
			
			mailSender.send(message2);  // 메일 발송
			
			dao.secretKeyUpdate(vo);  //메일 보낸 후 시크릿키 user 테이블에 업데이트
			
			result = 1;  //이메일 발송 완료 후 완료 상태 리턴
		}
		
		return result;

	}
}
