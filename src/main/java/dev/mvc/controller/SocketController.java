package dev.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SocketController {

	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String viewChattinPage(ModelAndView mv){
		mv.setViewName("chat");
		
		//사용자 정보 출력(세션)
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("user name :"+user.getUsername());

		System.out.println("normal chat page");
		
		mv.addObject("userid", user.getUsername());
		
		return "chat";
	}
}
