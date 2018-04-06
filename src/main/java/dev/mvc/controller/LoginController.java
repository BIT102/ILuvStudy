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
	

	//���� �α��� api
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
	
	// �α��� ���� ��޷� ������
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
		model.addAttribute("UserVO", userVO); // �𵨿� ��� ���ͼ��Ϳ��� Ȱ��
		if(userVO != null){
			// �α��� ���� Ŭ���� �����ڴ� �α��� �������� �ʴ´�(Ȥ�� �� ��Ȳ�� ���)
			if(dto.isUseCookies()){
				logger.info("isUseCookies.......");
				int amount = 60 * 60 * 24 * 7; // 1����
				Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
				System.out.println("=============���� getid==============");
				System.out.println(userVO.getEmail()+",,,"+ session.getId()+",,,"+ sessionLimit);
				service.keepLogin(userVO.getEmail(), session.getId(), sessionLimit);
			}
		}

		// 3. AdminLogin
		AdminVO adminVO = service.adminLogin(dto);
		model.addAttribute("AdminVO", adminVO); // �𵨿� ��� ���ͼ��Ϳ��� Ȱ��
		
		// ������ ������ ��ο� �ش����� ������ return �Ѵ�.
		if(userVO == null && adminVO == null){
			return;
		}
		
		// 4. ���̵� ����ϱ� ���
		
		String rememberId = request.getParameter("rememberId");
		
		System.out.println("=======rememberId �� �������� ========");
		System.out.println(WebUtils.getCookie(request, "rememberId"));
		
		if(rememberId != null){
			
			Cookie cookie = new Cookie("rememberId", dto.getId());
			cookie.setMaxAge(60*60*24*7); // 1����
			cookie.setPath("/");
			model.addAttribute("cookie",cookie);
			
			//response.addCookie(cookie); // �α��ξ��̵� ����ϱ� ����� ����
			System.out.println("cookie : " + cookie);
		}else if(WebUtils.getCookie(request, "rememberId")!=null){
			
			// ��Ű �������
			logger.info("rememberId remove.........");
			Cookie cookie = WebUtils.getCookie(request, "rememberId"); 
			cookie.setMaxAge(0);
			model.addAttribute("cookie",cookie);
			
		}

		// 5. Interceptor posthandler O 

	}
	
	

	
	//�α׾ƿ� ��Ʈ�ѷ�
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String userlogout(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		logger.info("logout..........");
		Object obj = session.getAttribute("login");
		
		if(obj != null){
			
			// ������ �α׾ƿ� �����ؼ� CASE ������ ����.
			
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
		
	//�α׾ƿ� ó��
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
		
	// ���̵� ã��
	@RequestMapping(value="/searchEmail", method=RequestMethod.GET)
	public void searchEmailGET()throws Exception{
		logger.info("searchEmailGET........");
	}
		
	// ��й�ȣ ã��
	@RequestMapping(value="/searchPW", method=RequestMethod.GET)
	public void searchPWGET()throws Exception{
		logger.info("searchPWGET........");
		
		
	}
	

//==============���� �α��� api==============
	@RequestMapping(value = "/googleLogin", method = RequestMethod.GET)
	public String googleCall(HttpServletRequest request, Model model) throws Exception{
		
		logger.info("googleLogin get.......");
		
		/* ����code ���� */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		System.out.println("����:" + url);

		model.addAttribute("url", url);

		/* ������ ���� URL�� View�� ���� */
		return "googleLogin";
	}
	
	
	@RequestMapping(value = "/googleSignInCallback", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(@RequestParam String code, HttpServletRequest request) throws Exception {
		System.out.println("����� googleCallback");
		
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
		
		vo.setEmail(person.getAccountEmail()); //�̸���
		vo.setNickName(person.getDisplayName()); //�г���
		vo.setName(person.getDisplayName()); //�̸�
		vo.setSocial("google");	//�Ҽ�

		if(person.getGender().equals("female")){ //����
			vo.setGender(2);
		}else{
			vo.setGender(1);
		}
		
		System.out.println(vo);

		//���� ���̵� user ���̺� �ִ��� ���� ������ insert ��Ŵ
		service.googleLogin(vo);
		
		HttpSession session = request.getSession();
		session.setAttribute("login",vo);
		
		return "redirect:/study/main";
	}
	
	
	
}