package dev.mvc.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import dev.mvc.domain.UserVO;
import dev.mvc.service.UserService;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Inject
	private UserService service;
	
	// 사용자가 원하는 URI가 무엇이었는지를 보관했다가, 로그인 성공 후 해당 경로로 이동 시킴
	private void saveDest(HttpServletRequest req){
		
		String uri = req.getRequestURI();
		String query = req.getQueryString();

		
		if(query == null || query.equals("null")){
			query ="";
		} else{
			query= "?" + query;
		}
		
		if(req.getMethod().equals("GET")){
			logger.info("dest:" + (uri+query));
			req.getSession().setAttribute("dest", uri+query);
		}
	}
	
	
	// 사용자 로그인 상태 유무 파악
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		logger.info("auth 인터셉터 찍히니???==========================");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") == null){
			
			logger.info("current user is not logined");
			
			saveDest(request);
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null){
				UserVO userVO = service.checkLoginBefore(loginCookie.getValue());
				logger.info("USERVO:" + userVO);
				
				if(userVO != null){
					session.setAttribute("login", userVO);
					return true;
				}
			}
			
			
			response.sendRedirect("/login"); // 비로그인 사용자의 경우 로그인 페이지로 리다이렉트 시킴
			return false;
		}
		
			return true;
	}

}
