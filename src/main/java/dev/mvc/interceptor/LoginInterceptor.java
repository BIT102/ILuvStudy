package dev.mvc.interceptor;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import dev.mvc.domain.UserVO;
import dev.mvc.service.LoginService;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Inject
	private LoginService service;
	
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView)throws Exception{
		
		logger.info("Login interceptor postHandle............");
		HttpSession session = request.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		Object adminVO = modelMap.get("AdminVO");		
		UserVO userVO = (UserVO)modelMap.get("UserVO");
		Cookie cookie = (Cookie)modelMap.get("cookie");
		
		System.out.println(cookie);
		
		if(adminVO != null){
			logger.info("new login success");
			session.setAttribute(LOGIN, adminVO);
			service.loginupdate(adminVO);  //로그인 성공 시 

			if(cookie != null)
				response.addCookie(cookie); // 로그인아이디 기억하기 쿠기의 생성	
			
			//로그인 성공 시 회원리스트로 이동
			response.sendRedirect("/admin/userList");
		}else if(userVO != null){
			if(userVO.getEmailConf()==0){
				response.setContentType("text/html; charset=UTF-8");
		        PrintWriter out = response.getWriter();
		        out.println("<script>alert('이메일 인증을 완료하세요'); history.go(-1);</script>");
		        out.flush();
			}
			session.setAttribute(LOGIN, userVO); // 여기가 실질적인 세션 생성 구간
			logger.info("===========new login success==========");
			System.out.println(session.getAttribute(LOGIN));
			
			if(cookie != null)
				response.addCookie(cookie); // 로그인아이디 기억하기 쿠기의 생성
			
			if(request.getParameter("useCookies") != null){
				logger.info("remember me..............................");
				Cookie loginCookie = new Cookie("loginCookie", session.getId()); // 자동 로그인시 쿠기 생성
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60*60*24*7);
				response.addCookie(loginCookie);
			}
			
			response.sendRedirect("/study/main");
			
			//Object dest = session.getAttribute("dest"); //사용자가 원하는 페이지 정보를 dest에 담음
			//response.sendRedirect(dest != null ? (String)dest:"/profile");
			
		}else{
			//adminVO와 userVO가 null인 경우 db에 없는 계정으로 로그인 시도로 판단
			response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
	        out.flush();
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN) != null){
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		return true;
	}
	
}
