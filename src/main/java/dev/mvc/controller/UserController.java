package dev.mvc.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

import dev.mvc.domain.UserVO;
import dev.mvc.persistence.UserDAO;
import dev.mvc.service.UserService;


/**
 * Handles requests for the application home page.
 */
@Controller
//@RequestMapping(value = "/mypage/")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	UserDAO dao;

	@Inject
	private UserService service;
	
	//회원가입 컨트롤러
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinUserGET(UserVO vo, Model model) {
		System.out.println("YWTEST................");
		return "join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinUserPOST(UserVO vo, Model model) {
		
		try {
			service.joinUser(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "login";
	}
	
	// profile 컨트롤러
		@RequestMapping(value = "/profile", method = RequestMethod.GET)

		public String profileGET(Model model,HttpServletRequest request) throws Exception {
			logger.info("========프로필 get................");
			
			// 1. HttpSession 클래스의 객체를 생성해준다.
			// 2. 위의 객체에 세션에 생성된 값을 담아준다.
			// 3. 세션의 값중 로그인한 사용자의 값으로 담아준다.
			// 4. 해당 값의 이메일 값을 가져와 email 변수에 담아주다.
			// 5. 아래에 있는 read 함수에 email을 담아준다.
			
			HttpSession session = request.getSession();
			UserVO sUser = (UserVO)session.getAttribute("login");
			String email = sUser.getEmail();
			
			UserVO vo = service.read(email);
			model.addAttribute("vo", vo);
			
			return "/mypage/profile";
		}
	
		@RequestMapping(value = "/profile", method = RequestMethod.POST)
		public String update(UserVO vo, Model model) throws Exception {

			logger.info("========프로필 post................");
			service.update(vo);
			model.addAttribute("vo", vo);
			model.addAttribute("result","수정되었습니다.");
			
			return "/mypage/profile";			

		}
		
		
	// 부가정보(addinfo) 컨트롤러
		@RequestMapping(value = "/addInfo", method = RequestMethod.GET)
		public String addInfo(Model model, HttpServletRequest request) throws Exception {
			
			HttpSession session = request.getSession();
			UserVO sUser = (UserVO)session.getAttribute("login");
			String email = sUser.getEmail();
			
			UserVO vo = service.read(email);
			model.addAttribute("vo", vo);
			
			return "/mypage/addInfo";
		}
		
		@RequestMapping(value = "/addInfo", method = RequestMethod.POST)
		public String updateaddInfo(UserVO vo, Model model) throws Exception {
			
			service.updateAddInfo(vo);
			model.addAttribute("vo", vo);
			model.addAttribute("result", "수정되었습니다.");
			
			return "/mypage/addInfo";
		}
	
	
	// 비밀번호 변경(changePw) 컨트롤러

	@RequestMapping(value = "/changePw", method = RequestMethod.GET)
	public String changePwGET(Model model) throws Exception {
		
		return "/mypage/changePw";
	}
	

	@RequestMapping(value = "/changePw", method = RequestMethod.POST)
	public String changePwPOST(Model model, String nowPw, String newPw1, String newPw2, HttpServletRequest request ) throws Exception {
		
		//1. 입력한 비밀번호가 DB값과 일치하는지 체크
		HttpSession session = request.getSession();
		UserVO sUser = (UserVO)session.getAttribute("login");
		String email = sUser.getEmail();
		
		UserVO vo = service.read(email);
		vo.getPassword();
		System.out.println("=================getpass");
		System.out.println(vo.getPassword());
		System.out.println("=================getpass");
		System.out.println("=================nowpass");
		System.out.println(nowPw);
		System.out.println("=================nowpass");
		
		if(nowPw.equals(vo.getPassword())){  // String이니 equals로 비교해줘야 함.
			System.out.println("==========if문 기존 비번 = 입력 비번============");
			
		}
			System.out.println("===========if문 찍히니2222==============");
		//2. 새 비번1과 새 비번2가 같나 비교하고
		if(newPw1.equals(newPw2)){
			System.out.println("=================pw1pw2이거 같니.....?");
		}
		//3. 같으면 유효성 검사
		
		

		service.changePw(vo);
		model.addAttribute("vo", vo);
		
		return "/mypage/changePw";
	}


	// 회원 탈퇴(quit) 컨트롤러
	@RequestMapping(value = "/quit", method = RequestMethod.GET)
	public String quit(Model model, String email) throws Exception {
		
		UserVO vo = service.read(email);
		model.addAttribute("vo", vo);
		
		return "/mypage/quit";
	}
	
	@RequestMapping(value = "/quit", method = RequestMethod.POST)
	public String quitget(Model model, UserVO vo) throws Exception {
		
		service.quit(vo);

		model.addAttribute("vo", vo);
		
		return "/mypage/quit";
	}
	
	// 북마크 (bookmark) 컨트롤러
	@RequestMapping(value = "/bookmark", method = RequestMethod.GET)
	public String bookmark() {
		
		return "/mypage/bookmark";
	}
	
	// 모집 (recruit) 컨트롤러
	@RequestMapping(value = "/recruit", method = RequestMethod.GET)
	public String recruit() {
		
		return "/mypage/recruit";
	}
	
	// 신청 (application) 컨트롤러
		@RequestMapping(value = "/application", method = RequestMethod.GET)
		public String application() {
			
			return "/mypage/application";
		}
		
	// 	완료(completed) 컨트롤러
		@RequestMapping(value = "/completed", method = RequestMethod.GET)
		public String completed() {
			
			return "/mypage/completed";
		}
		
// =====================================================================================================
// Sangwook
// =====================================================================================================
		
		// 회원가입
		// 이메일테스트  Ajax 로 필요함.
		@RequestMapping(value = "/chkEmail", method = RequestMethod.POST)
		public String emailTest(HttpServletRequest request, Model model) throws Exception {
			
			logger.info("chkEmail.......................");
			
			String email = request.getParameter("email1")+"@"+request.getParameter("email2");
						
			if(service.chkEmail(email)==-1){
				model.addAttribute("result","유효하지 않은 이메일입니다.");
				System.out.println("유효하지 않은 이메일입니다.");
			}else if(service.chkEmail(email)==1){
				model.addAttribute("result","이미 가입된 이메일입니다.");
				System.out.println("이미가입된이메일");
			}else{
				model.addAttribute("result","인증번호를 입력하세요.");
				// 인증번호 이메일 전송
				service.sendEmail(email);
			}
			
			return "/mypage/completed";
		}
		
		
		@RequestMapping(value = "/chkEmailAjax", method = RequestMethod.POST)
		  public ResponseEntity<String> ajaxTest(@RequestParam("email1") String email1, @RequestParam("email2") String email2, Model model)throws Exception{
			
			logger.info("chkEmail.......................");
			
			String email = email1+"@"+email2;
			
			ResponseEntity<String> entity = null;
			
			try {
			 
				if(service.chkEmail(email)==-1){
					entity = new ResponseEntity<String>("unvaild", HttpStatus.OK);					
				}else if(service.chkEmail(email)==1){
					entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
				}else{
					entity = new ResponseEntity<String>("success", HttpStatus.OK);
					// 인증번호 이메일 전송
					service.sendEmail(email);
				}
				  
				
			} catch (Exception e) {
				// TODO: handle exception
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			  
			  return entity;
			  
		  }
		
		@RequestMapping(value = "link", method = RequestMethod.GET)
		public void link(String aa, String bb, Model model)throws Exception{
			
			System.out.println("===============");
			System.out.println(aa+bb);
			System.out.println("===============");
			
			model.addAttribute("aa",aa);
			
		}
		
		@RequestMapping(value="/join/nickname",method = RequestMethod.POST)
		public ResponseEntity<String> chkNickname(@RequestParam("nickname") String nickname) throws Exception{
			
			System.out.println("nicknameChk.................");
			
			ResponseEntity<String> entity = null;
			
			try{
				if(service.chkNickname(nickname)==0){
					entity = new ResponseEntity<String>("success", HttpStatus.OK);
				}else{
					entity = new ResponseEntity<String>("dup", HttpStatus.BAD_REQUEST);
				}
				
			}catch (Exception e) {
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			
			return entity;
		} 

}
