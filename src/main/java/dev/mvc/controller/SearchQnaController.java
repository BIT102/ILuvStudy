package dev.mvc.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.domain.PageMaker;
import dev.mvc.domain.SearchCriteria;
import dev.mvc.service.QnaService;

@Controller
@RequestMapping("/sqna/*")
public class SearchQnaController {

	private static final Logger logger = LoggerFactory.getLogger(SearchQnaController.class);
	
	@Inject
	private QnaService service;
	
	//SearchCriteria를 Model로 사용 ->list.jsp에 전달
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info(cri.toString());
		
//		model.addAttribute("list", service.listCriteria(cri));
		model.addAttribute("list", service.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
//		pageMaker.setTotalCount(service.listCountCriteria(cri));
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	//채팅 웹소켓
	@RequestMapping(value = "/chatting.do", method = RequestMethod.GET)
	public ModelAndView chat(ModelAndView mv){
		
		mv.setViewName("chat/chattingView");
		
//		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
//		System.out.println("user name : " + user.getUsername());
		
		System.out.println("normal chat page");
	
//		mv.addObject("userid", user.getUsername());
		
		return mv;
	}
}
