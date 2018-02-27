package dev.mvc.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dev.mvc.service.BoardService;

@Controller
@RequestMapping("/board/")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService service;
	
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public void listAll(Model model) throws Exception{
		
		logger.info("show all list ...................");
		model.addAttribute("list", service.listAll());
	}
	
	@RequestMapping(value="/register1", method=RequestMethod.GET)
	public void register1(Model model) throws Exception{
		
		logger.info("show all list ...................");
		model.addAttribute("list", service.listAll());
	}
}
