package dev.mvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import dev.mvc.domain.StudyVO;
import dev.mvc.domain.UserVO;
import dev.mvc.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Inject
	private UserDAO dao;
	@Inject
	private JavaMailSender mailSender;
	@Inject
	private BCryptPasswordEncoder passwordEncoder; //스프링시큐리티 비밀번호 암호화
	
		//회원가입
		@Override
		public void joinUser(UserVO vo) throws Exception {
			String enPassword = passwordEncoder.encode(vo.getPassword());   //스프링시큐리티 비밀번호 암호화
			vo.setPassword(enPassword);
			System.out.println("암호화된 비밀번호 :" + vo.getPassword());
			
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
			
			String enPassword = passwordEncoder.encode(vo.getPassword());   //스프링시큐리티 비밀번호 암호화
			vo.setPassword(enPassword);
			System.out.println("암호화된 비밀번호123 :" + vo.getPassword());
			
			dao.changePw(vo);
		}

		// 사용자 탈퇴
		@Override
		public void quit(UserVO vo) throws Exception {
			dao.quit(vo);
		}
		
		// 닉네임 중복 체크
		@Override
		public int nickCheck(String nickName) throws Exception {
			return dao.nickCheck(nickName);
		}
		
		// 프로필 사진 수정
		@Override
		public void insertImg(UserVO vo) throws Exception { // data = 값이. 단순히 변수명인데 헷갈려함. 바보바보. 기대값은 이미지 이름
			
			String files = vo.getPhoto();
			String email = vo.getEmail();

			Map<String, Object> map = new HashMap<>();
			
			map.put("photo", files);
			map.put("email", email);
			
			dao.insertImg(map);
		}
	/*	
		// 북마크 불러오기
/*		@Override
		public List<StudyVO> bookmarkList(String email) throws Exception {
			
			dao.bookmarkList(email); // 이게 리스트고
//			System.out.println("북마크리스트:"+dao.bookmarkList(email));
//			
//			List<StudyVO> list = dao.bookmarkList(email); 
//			list.get(0);
//			System.out.println("리스트:"+list);
//			System.out.println("리스트0번째-"+list.get(0));
//			System.out.println("북마크리스트22:"+list.get(0).getBno());
//			
//			dao.bookmarkCount(list.get(0).getBno());
//			System.out.println("북마크개수:"+dao.bookmarkCount(list.get(0).getBno()));

			List<StudyVO> list = dao.bookmarkList(email);
			System.out.println("리스트-"+list);
			System.out.println("리스트0="+list.get(0));
			
			dao.bookmarkCount(list.get(0).getBno());
			
			return dao.bookmarkList(email);
			
		}
		*/
		
		// 북마크 즐겨찾기 숫자
		@Override
		public int bookmarkCount(int bno) throws Exception {
			return dao.bookmarkCount(bno);	
		}
		
		@Override
		public StudyVO bookmarkCount2(int bno) throws Exception {
			
			StudyVO vo = new StudyVO();
			
			System.out.println("브이오="+vo);
			System.out.println(dao.bookmarkCount2(bno));
			return dao.bookmarkCount2(bno);
		
		}
		
		//모집 스터디 불러오기
		@Override
		public List<StudyVO> recruitList(String email) throws Exception {
			return dao.recruitList(email);
		}
		
		//신청 스터디 불러오기
		@Override
		public List<StudyVO> applyList(String email) throws Exception {
			return dao.applyList(email);
		}
	


	// ============== sangwook ================
	
	@Override
	public int chkEmail(String email) throws Exception {
		
		// 유효성 검사(알파벳, 숫자, 길이, @/. 1개씩)
		// return 값  -1:유효성오류 1:중복값발생 0:정상
		
		// 소문자로 변경
		email = email.toLowerCase();
		System.out.println("유저서비스이메일1:"+email);
		// 길이
		String email1 = email.substring(0,email.indexOf('@'));
		System.out.println("유저서비스이메일2:"+email1);
		
		if(3 > email1.length()||email1.length()>30) 
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
		
		System.out.println("annCnt : "+annCnt);
		System.out.println("dotCnt : "+dotCnt);
		
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
	public void sendEmail(String email) throws Exception {
		
		System.out.println("==============================");
		System.out.println("sendEmail.............");
		System.out.println("==============================");
		String setfrom = "lswkim322@gmail.com";         
	    String tomail  = email;     // 받는 사람 이메일
	    String title   = "[ILOVESTUDY]인증 확인 메일 발송";      // 제목
	    
	    
	    String content = "aaa";    // 내용
	   	    
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

	}
	
	@Override
	public int chkNickname(String nickName)throws Exception{
		return dao.chkNickname(nickName); 
	}

	@Override
	public void emailConf(String email)throws Exception{
		dao.emailConf(email);
	}
	
	//시크릿키 확인
	@Override
	public int chkSecretkey(UserVO vo) throws Exception{
		return dao.chkSecretkey(vo);
	}
	
	
}
