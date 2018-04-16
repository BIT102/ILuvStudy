/*package dev.mvc.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import dev.mvc.domain.UserVO;

public class UserLoginInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(UserLoginInterceptor.class);

	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		System.out.println("�����α������ͼ���11...�̰ž�?=====================");
		
		HttpSession session = request.getSession();
		
		
		ModelMap modelMap = modelAndView.getModelMap();

		Object userVO = (UserVO)modelMap.get("userVO"); // ������ ���� �ƴ϶� ��Ʈ�ѷ��� ����� ���� ��� �´�. 
		System.out.println("===========����vo=============");
		System.out.println(userVO);
		System.out.println("========================");

		
						
		if(request.getParameter("useCookies") != null){
			logger.info("remember me..............................");
			Cookie loginCookie = new Cookie("loginCookie", session.getId()); // �ڵ� �α��ν� ��� ����
			loginCookie.setPath("/");
			loginCookie.setMaxAge(60*60*24*7);
			
			response.addCookie(loginCookie);
		}
		
		if (userVO != null) {
			session.setAttribute(LOGIN, userVO); // ���Ⱑ �������� ���� ���� ����
			logger.info("===========new login success==========");
			System.out.println(session.getAttribute(LOGIN));
			
			Object dest = session.getAttribute("dest"); //����ڰ� ���ϴ� ������ ������ dest�� ����
			//response.sendRedirect(dest != null ? (String)dest:"/study/listAll");
		
		}
		logger.info("==============������??�Ʒ��Ʒ��ֶ��");
		
	}
	

	//���� �ΰ�
	@Override
	public boolean preHandle(HttpServletRequest request,
		HttpServletResponse response, Object handler) throws Exception{
	
		System.out.println("�����α������ͼ���22...�̰ž�?=====================");
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN) !=null){
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		return true;
	}	
			
}
*/