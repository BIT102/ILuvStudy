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
			service.loginupdate(adminVO);  //�α��� ���� �� 

			if(cookie != null)
				response.addCookie(cookie); // �α��ξ��̵� ����ϱ� ����� ����	
			
			//�α��� ���� �� ȸ������Ʈ�� �̵�
			response.sendRedirect("/admin/userList");
		}else if(userVO != null){
			if(userVO.getEmailConf()==0){
				response.setContentType("text/html; charset=UTF-8");
		        PrintWriter out = response.getWriter();
		        out.println("<script>alert('�̸��� ������ �Ϸ��ϼ���'); history.go(-1);</script>");
		        out.flush();
			}
			session.setAttribute(LOGIN, userVO); // ���Ⱑ �������� ���� ���� ����
			logger.info("===========new login success==========");
			System.out.println(session.getAttribute(LOGIN));
			
			if(cookie != null)
				response.addCookie(cookie); // �α��ξ��̵� ����ϱ� ����� ����
			
			if(request.getParameter("useCookies") != null){
				logger.info("remember me..............................");
				Cookie loginCookie = new Cookie("loginCookie", session.getId()); // �ڵ� �α��ν� ��� ����
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60*60*24*7);
				response.addCookie(loginCookie);
			}
			
			response.sendRedirect("/study/main");
			
			//Object dest = session.getAttribute("dest"); //����ڰ� ���ϴ� ������ ������ dest�� ����
			//response.sendRedirect(dest != null ? (String)dest:"/profile");
			
		}else{
			//adminVO�� userVO�� null�� ��� db�� ���� �������� �α��� �õ��� �Ǵ�
			response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('�α��� ������ Ȯ�����ּ���.'); history.go(-1);</script>");
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
