package dev.mvc.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dev.mvc.domain.MessageVO;
import dev.mvc.domain.UserVO;
import dev.mvc.service.MessageService;

@Controller
public class SocketController {
	
	private static final Logger logger = LoggerFactory.getLogger(SocketController.class);
	
	@Inject
	private MessageService service;

	@RequestMapping("/chatting/chat")
	public String viewChattinPage(){
		return "chatting/chat";
	}
	
	@RequestMapping("/chatting/paint")
    public String viewPaintingPage() {
        return "chatting/paint";
    }
	
	//������ ���� ������ ���� ���
	@ResponseBody
	@RequestMapping(value = "/chatting/chatAdmin22", method = {RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity<List<MessageVO>> viewChattinPageAdmin22(Model model, HttpServletRequest request) throws Exception{
		
		//�α����� ���ǿ� ����ִ� ���� ������
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("login");
		
		/*model.addAttribute("list", service.adminMessage(user.getEmail())); //������ ����/�亯�ҷ����� */		
		logger.info("chatAdmin22 �����´�...");
		
		ResponseEntity<List<MessageVO>> entity=null;
		
		entity = new ResponseEntity<List<MessageVO>>(service.adminMessage(user.getEmail()), HttpStatus.OK);
		
		return entity;
		
	}
	
	//������ ���� ������(�����ڴ�)
	@ResponseBody
	@RequestMapping(value = "/chatting/chatAdminView/{bno}", method = {RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity<List<MessageVO>> viewChattinPageAdmin(@PathVariable("bno") int bno) throws Exception{
		
		/*model.addAttribute("list", service.adminMessageView()); //������ ����/�亯�ҷ�����
*/		
		logger.info("chatAdminView �����´�...");
		
		ResponseEntity<List<MessageVO>> entity=null;
		
		entity = new ResponseEntity<List<MessageVO>>(service.adminMessageView(bno), HttpStatus.OK);
		
		return entity;
	}
	
	//������ ���� ������(�����ڴ�)
	@RequestMapping(value = "/admin/chatAdmin")
	public String listChattinPageAdmin(Model model) throws Exception{
		
		logger.info("chatAdmin �����´�...");
		model.addAttribute("list", service.adminMessageList()); //������ ���� ����Ʈ
		
		return "chatting/chatAdmin";
	}
	
	

}
