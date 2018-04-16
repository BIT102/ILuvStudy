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
import dev.mvc.service.LoginService;
import dev.mvc.service.UserService;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	@Inject
	private LoginService service;
	
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	private void saveDest(HttpServletRequest req){
		
		logger.info("saveDest ���ͼ��� ������???==========================");
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
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		logger.info("auth ���ͼ��� ������???==========================");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") == null){
			
			logger.info("current user is not logined");
			System.out.println("�������� �� �α���");
			saveDest(request);
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null){
				UserVO userVO = service.checkLoginBefore(loginCookie.getValue());
				logger.info("USERVO:" + userVO);
				System.out.println("���������");
				if(userVO != null){
					session.setAttribute("login", userVO);
					return true;
				}
			}
			
			
			response.sendRedirect("/study/main"); // ��α��� ������� ��� �α��� �������� �����̷�Ʈ ��Ŵ
			return false;
		}
		
			return true;

	}

}


