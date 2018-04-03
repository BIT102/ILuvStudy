package dev.mvc.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dev.mvc.domain.AdminVO;
import dev.mvc.domain.UserVO;
import dev.mvc.service.MessageService;

@Controller
@RequestMapping("/chatting")
public class SocketController {
	
	private static final Logger logger = LoggerFactory.getLogger(SocketController.class);
	
	@Inject
	private MessageService service;

	@RequestMapping("/chat")
	public String viewChattinPage(){
		return "chatting/chat";
	}
	
	@RequestMapping("/paint")
    public String viewPaintingPage() {
        return "chatting/paint";
    }
	
	//관리자 문의 페이지(프론트단 나중에 모달로 바꿀꺼임)
	@RequestMapping(value = "/chatAdmin22", method = RequestMethod.GET)
	public void viewChattinPageAdmin22(Model model, HttpServletRequest request) throws Exception{
		
		//로그인한 세션에 담겨있는 정보 가져옴
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("login");
		
		model.addAttribute("list", service.adminMessage(user.getEmail())); //관리자 문의/답변불러오기
		
	}
	
	//관리자 문의 페이지(관리자단)
	@RequestMapping(value = "/chatAdmin", method = RequestMethod.GET)
	public void viewChattinPageAdmin(Model model) throws Exception{
		
		model.addAttribute("list", service.adminMessageView()); //관리자 문의/답변불러오기
		
	}

}
