package dev.mvc.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import dev.mvc.domain.UserVO;
import dev.mvc.dto.UserLoginDTO;
import dev.mvc.persistance.UserDAO;
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
	

	
	
	//로그인 컨트롤러
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto")  UserLoginDTO dto){
		
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(UserLoginDTO dto, HttpSession session, Model model) throws Exception{
		
		UserVO vo = service.login(dto);
		System.out.println("=================vovo=========");
		System.out.println(vo);
		System.out.println("=================vovo=========");
		if(vo==null){
			return ;
		}
		
		model.addAttribute("userVO", vo);
		
		if(dto.isUseCookies()){
			int amount = 60 * 60 * 24 * 7;
			Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
			System.out.println("=============세션 getid==============");
			System.out.println(session.getId());
			service.keepLogin(vo.getEmail(), session.getId(), sessionLimit);
		}
	}
	
	
	
	
	
	
	//로그아웃 컨트롤러
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		Object obj = session.getAttribute("login");
		
		if(obj != null){
			UserVO vo = (UserVO) obj;
			
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null){
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getEmail(), session.getId(), new Date());
			}
		}
				
		return "/mypage/logout";
	}
	
	
	
	//회원가입 컨트롤러
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinUserGET(UserVO vo, Model model) {
		
		return "join";
	}
	
	
	@RequestMapping(value = "/joinUser", method = RequestMethod.POST)
	public String joinUserPOST(UserVO vo, Model model) {
		
		try {
			service.joinUser(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "join";
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

//	//ajax 비번 수정
//	@RequestMapping(value = "/changePw", method = RequestMethod.POST)
//	public ResponseEntity<String> changePw(@RequestParam("nowPw")String nowPw,
//									@RequestParam("newPw1") String newPw1, 
//									@RequestParam("newPw2") String newPw2, 
//									HttpServletRequest request) throws Exception{
//	
//		
//		System.out.println("======nowPw 나우Pw=============");
//		System.out.println(nowPw);
//		System.out.println(newPw1);
//		System.out.println(newPw2);
//		
//		HttpSession session = request.getSession();
//		UserVO sUser = (UserVO)session.getAttribute("login");
//		String email = sUser.getEmail();
//		
//		UserVO vo = service.read(email);
//		vo.getPassword();
//		
//		System.out.println("======겟패스워드==========");
//		System.out.println(vo.getPassword());
//		
//		
//		
//		
//		ResponseEntity<String> entity = null;
//		
//		try{
//			if(nowPw.equals(vo.getPassword())){
//			//entity = new ResponseEntity<String>("pw equal", HttpStatus.OK); // "" 이 안에 값이 jsp파일에 result값이 됨
//			System.out.println("============pw1pw2 같니??=============");
//		}else{
//			entity = new ResponseEntity<String>("DB pass != Enter pass", HttpStatus.OK);
//		}
//			
//		}catch(Exception e){
//			entity =  new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//		
//	}

	
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
	
}
