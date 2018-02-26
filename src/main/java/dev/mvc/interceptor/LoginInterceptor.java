package dev.mvc.interceptor;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import dev.mvc.service.AdminService;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Inject
	private AdminService service;
	
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView)throws Exception{
		
		HttpSession session = request.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		Object adminVO = modelMap.get("AdminVO");		
		
		if(adminVO != null){
			logger.info("new login success");
			session.setAttribute(LOGIN, adminVO);
			service.loginupdate(adminVO);  //�α��� ���� �� 
			//�α��� ���� �� ȸ������Ʈ�� �̵�
			response.sendRedirect("/admin/userList");
		} else{
			//adminVO null�� ��� db�� ���� �������� �α��� �õ��� �Ǵ�
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
