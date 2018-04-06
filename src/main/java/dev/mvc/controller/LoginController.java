package dev.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

import dev.mvc.domain.AdminVO;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.LoginDTO;
import dev.mvc.service.LoginService;
import dev.mvc.service.UserService;

@Controller
//@RequestMapping(value = "/mypage/")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private LoginService service;
	

	//구글 로그인 api
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
/*	public void setGoogleConnectionFactory(GoogleConnectionFactory googleConnectionFactory){
		this.googleConnectionFactory = googleConnectionFactory;
	}
	
	public void setGoogleOAuth2Parameters(OAuth2Parameters googleOAuth2Parameters){
		this.googleOAuth2Parameters = googleOAuth2Parameters;
	}*/
	//end
	
	// 로그인 통합 모달로 수정본
	@RequestMapping(value = "/nav", method = RequestMethod.GET)
	public void loginGet(HttpServletRequest request, Model model) throws Exception{
		
		logger.info("Login merge get.......");
		
		String rememberable = WebUtils.getCookie(request, "rememberId").getValue();
		System.out.println(rememberable);
		
		if(rememberable != null){
			model.addAttribute("id", rememberable);
			model.addAttribute("checked", "checked");
		}

	}
	
	@RequestMapping(value = "loginPost", method = RequestMethod.POST)
	public void loginPost(LoginDTO dto, HttpServletRequest request, HttpSession session, Model model) throws Exception{
		logger.info("Login merge post.......");

		// 1. Interceptor prehandler O
		
		// 2. UserLogin
		UserVO userVO = service.userLogin(dto);		
		model.addAttribute("UserVO", userVO); // 모델에 담아 인터셉터에서 활용
		if(userVO != null){
			// 로그인 유지 클릭시 관리자는 로그인 유지하지 않는다(혹시 모를 상황을 대비)
			if(dto.isUseCookies()){
				logger.info("isUseCookies.......");
				int amount = 60 * 60 * 24 * 7; // 1주일
				Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
				System.out.println("=============세션 getid==============");
				System.out.println(userVO.getEmail()+",,,"+ session.getId()+",,,"+ sessionLimit);
				service.keepLogin(userVO.getEmail(), session.getId(), sessionLimit);
			}
		}

		// 3. AdminLogin
		AdminVO adminVO = service.adminLogin(dto);
		model.addAttribute("AdminVO", adminVO); // 모델에 담아 인터셉터에서 활용
		
		// 유저와 관리자 모두에 해당하지 않으면 return 한다.
		if(userVO == null && adminVO == null){
			return;
		}
		
		// 4. 아이디 기억하기 기능
		
		String rememberId = request.getParameter("rememberId");
		
		System.out.println("=======rememberId 값 가져오기 ========");
		System.out.println(WebUtils.getCookie(request, "rememberId"));
		
		if(rememberId != null){
			
			Cookie cookie = new Cookie("rememberId", dto.getId());
			cookie.setMaxAge(60*60*24*7); // 1주일
			cookie.setPath("/");
			model.addAttribute("cookie",cookie);
			
			//response.addCookie(cookie); // 로그인아이디 기억하기 쿠기의 생성
			System.out.println("cookie : " + cookie);
		}else if(WebUtils.getCookie(request, "rememberId")!=null){
			
			// 쿠키 삭제경우
			logger.info("rememberId remove.........");
			Cookie cookie = WebUtils.getCookie(request, "rememberId"); 
			cookie.setMaxAge(0);
			model.addAttribute("cookie",cookie);
			
		}

		// 5. Interceptor posthandler O 

	}
	
	

	
	//로그아웃 컨트롤러
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String userlogout(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		logger.info("logout..........");
		Object obj = session.getAttribute("login");
		
		if(obj != null){
			
			// 관리자 로그아웃 관련해서 CASE 나누어 주자.
			
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
				
		return "redirect:/study/main";
	}
		
	//로그아웃 처리
	//adminLogout.jsp
	@RequestMapping(value="/adminLogout", method=RequestMethod.GET)
	public String adminlogout(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session) throws Exception {
		logger.info("adminLogout get...");
		
		Object obj = session.getAttribute("login");
		
		if(obj != null){				
			session.removeAttribute("login");
			session.invalidate();
		}
		return "/adminLogout";	
	}
		
	// 아이디 찾기
	@RequestMapping(value="/searchEmail", method=RequestMethod.GET)
	public void searchEmailGET()throws Exception{
		logger.info("searchEmailGET........");
	}
		
	// 비밀번호 찾기
	@RequestMapping(value="/searchPW", method=RequestMethod.GET)
	public void searchPWGET()throws Exception{
		logger.info("searchPWGET........");
		
		
	}
	

//==============구글 로그인 api==============
	@RequestMapping(value = "/googleLogin", method = RequestMethod.GET)
	public String googleCall(HttpServletRequest request, Model model) throws Exception{
		
		logger.info("googleLogin get.......");
		
		/* 구글code 발행 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		System.out.println("구글:" + url);

		model.addAttribute("url", url);

		/* 생성한 인증 URL을 View로 전달 */
		return "googleLogin";
	}
	
	
	@RequestMapping(value = "/googleSignInCallback", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(@RequestParam String code, HttpServletRequest request) throws Exception {
		System.out.println("여기는 googleCallback");
		
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code , googleOAuth2Parameters.getRedirectUri(),
				null);
		
		String accessToken = accessGrant.getAccessToken();
		Long expireTime = accessGrant.getExpireTime();
		if (expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();
			System.out.printf("accessToken is expired. refresh token = {}", accessToken);
		}
		
		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
		
		PlusOperations plusOperations = google.plusOperations();
		Person person = plusOperations.getGoogleProfile();
		
		UserVO vo = new UserVO();
		System.out.println(person.getAccountEmail());
		System.out.println(person.getBirthday());		
		System.out.println(person.getDisplayName());
		System.out.println(person.getGender());
		
		vo.setEmail(person.getAccountEmail()); //이메일
		vo.setNickName(person.getDisplayName()); //닉네임
		vo.setName(person.getDisplayName()); //이름
		vo.setSocial("google");	//소셜

		if(person.getGender().equals("female")){ //성별
			vo.setGender(2);
		}else{
			vo.setGender(1);
		}
		
		System.out.println(vo);

		//구글 아이디 user 테이블에 있는지 보고 없으면 insert 시킴
		service.googleLogin(vo);
		
		HttpSession session = request.getSession();
		session.setAttribute("login",vo);
		
		return "redirect:/study/main";
	}
	
	
	
}