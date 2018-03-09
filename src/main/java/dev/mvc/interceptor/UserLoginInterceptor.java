package dev.mvc.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import dev.mvc.domain.UserVO;

public class UserLoginInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(UserLoginInterceptor.class);

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		Object userVO = (UserVO)modelMap.get("userVO"); // 도메인 값이 아니라 컨트롤러에 담아준 값을 담아 온다. U u 대소문자
		System.out.println("===========유저vo=============");
		System.out.println(userVO);
		System.out.println("========================");

		if (userVO != null) {
			session.setAttribute(LOGIN, userVO); // 여기가 실질적인 세션 생성 구간
			logger.info("===========new login success==========");
			System.out.println(session.getAttribute(LOGIN));
			
						
		if(request.getParameter("useCookies") != null){
			logger.info("remember me..............................");
			Cookie loginCookie = new Cookie("loginCookie", session.getId()); // 자동 로그인시 쿠기 생성
			loginCookie.setPath("/profile");
			loginCookie.setMaxAge(60*60*24*7);
			response.addCookie(loginCookie);
		}
		
		Object dest = session.getAttribute("dest"); //사용자가 원하는 페이지 정보를 dest에 담음
		response.sendRedirect(dest != null ? (String)dest:"/profile");
		
		}
		logger.info("==============찍히니??아래아랠애라애");
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request,
		HttpServletResponse response, Object handler) throws Exception{
	
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN) !=null){
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		return true;
	}	
			
}
