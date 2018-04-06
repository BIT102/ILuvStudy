package dev.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import dev.mvc.domain.PageMakerStudy;
import dev.mvc.domain.SearchCriteriaStudy;
import dev.mvc.domain.StudyVO;
import dev.mvc.domain.UserVO;
import dev.mvc.persistence.UserDAO;
import dev.mvc.service.BookmarkService;
import dev.mvc.service.LoginService;
import dev.mvc.service.StudyService;
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
	
	@Inject
	private StudyService studyService;

	@Inject
	private BookmarkService bookservice;
	
	@Inject
	private LoginService lservice;
	
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
		
		System.out.println("=============vo 젠더========");
		System.out.println(vo);
		return "/mypage/profile";
	}
	
		@RequestMapping(value = "/profile", method = RequestMethod.POST)
		public String update(UserVO vo, Model model) throws Exception {

			logger.info("========프로필 post................");
			service.update(vo);
			String email = vo.getEmail();
			service.read(email);
			model.addAttribute("vo", service.read(email));
			model.addAttribute("result11","수정되었습니다.");
			
			return "/mypage/profile";			

		}
		
				
	// 	profile 사진첨부 컨트롤러(Ajax)
		/*@RequestMapping(value = "/insertImg", method = RequestMethod.GET)
		public void insertImg(){
			
		}*/
		
//		@RequestMapping(value = "/insertImg", method = RequestMethod.POST)
//		public void insertImg(@RequestParam("data") String data) throws Exception{
//			
//			System.out.println("======데이터========");
//			System.out.println(data);
//		}
		
	@RequestMapping(value = "/insertImgUrl", method = RequestMethod.POST)
	public ResponseEntity<String> insertImg(UserVO vo) throws Exception{
// 그냥 void로 해도 됨
		
		System.out.println("==========인서트이미지==========");
		
		ResponseEntity<String> entity = null;
		System.out.println("vo=ddd"+vo);
		service.insertImg(vo);
		System.out.println("vo="+vo);

		return entity;
			
/*			프로필.jsp에서 data를 imgAddr에 담고.
			imgAddrParam에 또 imgAddr을 담고
			imgAddrParam를 파람으로 받아서. imgName으로 매개변수명
			@RequestMapping(value = "/insertImg", method = RequestMethod.POST)
			public ResponseEntity<String> insertImg(@RequestParam("imgAddrParam") String imgName, UserVO vo) throws Exception{
				
				System.out.println("데이터="+imgName);
				System.out.println("프로필사진="+service.insertImg(data));
				
				ResponseEntity<String> entity = null;
				System.out.println("vo=ddd"+vo);
				service.insertImg(vo);
				System.out.println("vo="+vo);
*/
			
		}
	
				
		
	// 닉네임 중복확인
/*		@RequestMapping(value= "/nickCheck", method = RequestMethod.POST)
		public ResponseEntity<String> nickCheck(@RequestParam("nickName") String nickName, UserVO vo) throws Exception{
			System.out.println("======닉네임=====");
			System.out.println(nickName);
	
			service.nickCheck(nickName);
			System.out.println("========바보바보=======");
			System.out.println("결과는:"+service.nickCheck(nickName));
			
			ResponseEntity<String> entity = null;
			
		try{	
			if(service.nickCheck(nickName)==0){
				entity = new ResponseEntity<String>("success", HttpStatus.OK); 
			}else{
				entity = new ResponseEntity<String>("fail", HttpStatus.OK);
			}
		}catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	
			return entity;						
		}*/
		
		
		@RequestMapping(value="/nickCheck", method = RequestMethod.POST)
		public ResponseEntity<String> nickCheck(@RequestParam("nickName") String nickName) throws Exception{
			
			service.nickCheck(nickName);
			
			ResponseEntity<String> entity = null;
			
		try{	
			if(service.nickCheck(nickName)==0){
				entity = new ResponseEntity<String>("Available nickname.", HttpStatus.OK);
			}else{
				entity = new ResponseEntity<String>("Unavailable nickname.", HttpStatus.OK);
			}
		}catch (Exception e){
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}	
			
			return entity;
		}
		
	
	// 부가정보(addinfo) 컨트롤러
		@RequestMapping(value = "/addInfo", method = RequestMethod.GET)
		public String addInfo(Model model, HttpServletRequest request) throws Exception {
			
			HttpSession session = request.getSession();
			UserVO sUser = (UserVO)session.getAttribute("login");
			String email = sUser.getEmail();
			
			UserVO vo = service.read(email);
			model.addAttribute("vo", vo);
			
			model.addAttribute("rglist", studyService.rgList()); 
			
			System.out.println("=====부가정보====");
			System.out.println("부가정보:"+studyService.rgList());
			
			return "/mypage/addInfo";
		}
		
		@RequestMapping(value = "/addInfo", method = RequestMethod.POST)
		public String updateaddInfo(UserVO vo, Model model) throws Exception {
			
			service.updateAddInfo(vo);
			model.addAttribute("vo", vo);
			model.addAttribute("result", "수정되었습니다.");
			
			return "/mypage/addInfo";
		}
		
		
		//JSON small카테고리(region)  //URL /region/추가  (겹치지않게)
		@RequestMapping(value="/register1/region/{rSId}",method = RequestMethod.GET)
			public ResponseEntity<List<StudyVO>> rglist(@PathVariable("rSId") String rsId) {
			
				ResponseEntity<List<StudyVO>> entity = null;
				try{
					entity = new ResponseEntity<>(studyService.rgList2(rsId), HttpStatus.OK);
				}   catch (Exception e) {
					e.printStackTrace();
					entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
				}
				
				return entity;
		}

	
	// 비밀번호 변경(changePw) 컨트롤러
	@RequestMapping(value = "/changePw", method = RequestMethod.GET)
	public String changePwGET(Model model) throws Exception {
		
		return "/mypage/changePw";
	}
	

//	@RequestMapping(value = "/changePw", method = RequestMethod.POST)
//	public String changePwPOST(Model model, String nowPw, String newPw1, String newPw2, HttpServletRequest request) throws Exception {
//		
//		//1. 입력한 비밀번호가 DB값과 일치하는지 체크
//		HttpSession session = request.getSession();
//		UserVO sUser = (UserVO)session.getAttribute("login");
//		String email = sUser.getEmail();
//		
//		UserVO vo = service.read(email);
//		vo.getPassword();
//		
//		System.out.println("겟패스워드="+vo.getPassword());
//		System.out.println("나우패스워드="+nowPw);
//		
//		
//		if(nowPw.equals(vo.getPassword())){  // String이니 equals로 비교해줘야 함.
//			System.out.println("==========if문 기존 비번 = 입력 비번============");			
//		}
//			System.out.println("===========if문 찍히니2222==============");
//		//2. 새 비번1과 새 비번2가 같나 비교하고
//		if(newPw1.equals(newPw2)){
//			System.out.println("=================pw1pw2이거 같니.....?");
//		}
//		//3. 같으면 유효성 검사
//		
//		service.changePw(vo);
//		model.addAttribute("vo", vo);
//		
//		return "/mypage/changePw";
//	}
	
	//ajax 비번 수정
	@RequestMapping(value = "/changePw", method = RequestMethod.POST)
	public ResponseEntity<String> changePw(@RequestParam("nowPw")String nowPw,
									@RequestParam("newPw1") String newPw1, 
									@RequestParam("newPw2") String newPw2, 
									HttpServletRequest request) throws Exception{
			
		System.out.println("======nowPw 나우Pw=============");
		System.out.println(nowPw);
		System.out.println(newPw1);
		System.out.println(newPw2);
		
		HttpSession session = request.getSession();
		UserVO sUser = (UserVO)session.getAttribute("login");
		String email = sUser.getEmail();
		
		UserVO vo = service.read(email);
		vo.getPassword();
		
		System.out.println("======겟패스워드==========");
		System.out.println(vo.getPassword());
		
		vo.setPassword(newPw1);
		
		ResponseEntity<String> entity = null;
		
		
		if(nowPw.equals(vo.getPassword())){
			entity = new ResponseEntity<String>("pw equal", HttpStatus.OK); // "" 이 안에 값이 jsp파일에 result값이 됨
			System.out.println("============pw1pw2 같니??=============");
			vo.setPassword(newPw1);
			System.out.println("뉴패스1:"+newPw1);
		}else{
			entity = new ResponseEntity<String>("Please Check your password", HttpStatus.OK);
		}
			
		
		return entity;
		
	}
	
	
	


	// 회원 탈퇴(quit) 컨트롤러
	@RequestMapping(value = "/quit", method = RequestMethod.GET)
	public String quit(Model model, String email) throws Exception {
		
		UserVO vo = service.read(email);
		model.addAttribute("vo", vo);
		
		return "/mypage/quit";
		
	}
	
	@RequestMapping(value = "/quit", method = RequestMethod.POST)
	public String quitPost(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		logger.info("logout..........");
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
				lservice.keepLogin(vo.getEmail(), session.getId(), new Date());
			}
			
			service.quit(vo);
		}
				
		return "redirect:/study/main";
	}
	
	// 북마크 (bookmark) 컨트롤러  =길=
	@RequestMapping(value = "/bookmark", method = RequestMethod.GET)
	public String bookmark(@ModelAttribute("cri") SearchCriteriaStudy cri, Model model, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		UserVO sUser = (UserVO)session.getAttribute("login");
		String email = sUser.getEmail();
		model.addAttribute("list", bookservice.listBookmark(email));

		PageMakerStudy pageMakerStudy = new PageMakerStudy();

		pageMakerStudy.setCri(cri);

		model.addAttribute("pageMakerStudy", pageMakerStudy);

		return "/mypage/bookmark";
	}
	
	// 모집 (recruit) 컨트롤러
	@RequestMapping(value = "/recruit", method = RequestMethod.GET)
	public String recruit(@ModelAttribute("cri") SearchCriteriaStudy cri, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		UserVO sUser = (UserVO)session.getAttribute("login");
		String email = sUser.getEmail();
		model.addAttribute("list", service.recruitList(email));
		
		PageMakerStudy pageMakerStudy = new PageMakerStudy();
		
		pageMakerStudy.setCri(cri);
		
		model.addAttribute("pageMakerStudy", pageMakerStudy);
		
		return "/mypage/recruit";
	}
	
	// 신청 (application) 컨트롤러
	@RequestMapping(value = "/application", method = RequestMethod.GET)
	public String application(@ModelAttribute("cri") SearchCriteriaStudy cri, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		UserVO sUser = (UserVO)session.getAttribute("login");
		String email = sUser.getEmail();
		
		model.addAttribute("list", service.applyList(email));
		
		System.out.println("신청신청 : " + service.applyList(email));
		
		PageMakerStudy pageMakerStudy = new PageMakerStudy();
		
		pageMakerStudy.setCri(cri);
			
		model.addAttribute("pageMakerStudy", pageMakerStudy);
		
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
		public ResponseEntity<String> emailTest(String email, Model model) throws Exception {
			
			logger.info("chkEmail.......................");
			ResponseEntity<String> entity = null;
			
			if(service.chkEmail(email)==1){
				entity = new ResponseEntity<String>("fail", HttpStatus.OK);
				System.out.println("이미가입된이메일");
			}else{
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}
			
			return entity;
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
		
		@RequestMapping(value = "emailConf", method = RequestMethod.GET)
		public void emailConf(String email, Model model)throws Exception{
			
			logger.info("emailConf............");
			
			service.emailConf(email);
			
			
		}
		
		@RequestMapping(value="/join/nickname",method = RequestMethod.POST)
		public ResponseEntity<String> chkNickname(@RequestParam("nickname") String nickname) throws Exception{
			
			System.out.println("nicknameChk.................");
			
			ResponseEntity<String> entity = null;
			
			try{
				if(service.chkNickname(nickname)==0){
					entity = new ResponseEntity<String>("success", HttpStatus.OK);
				}else{
					entity = new ResponseEntity<String>("dup", HttpStatus.OK);
				}
				
			}catch (Exception e) {
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			
			return entity;
		} 

}
