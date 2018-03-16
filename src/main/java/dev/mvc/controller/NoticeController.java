package dev.mvc.controller;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.NoticeVO;
import dev.mvc.domain.PageMaker;
import dev.mvc.domain.SearchCriteria;
import dev.mvc.service.NoticeService;

@Controller
@RequestMapping("/study/*")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	private NoticeService service;
	
	//검색처리
	//공지사항 페이징 화면처리
	@RequestMapping(value="/notice", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, 
						 Model model) throws Exception{
		
		logger.info(cri.toString());
		logger.info("notice..........");
		
		model.addAttribute("list", service.noticeList());
		logger.info("notice2..........");
		model.addAttribute("list", service.listSearchCriteria(cri));
		logger.info("notice3..........");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		logger.info("notice4..........");
		pageMaker.setTotalCount(service.listSearchCount(cri));
		logger.info("notice5..........");
		model.addAttribute("pageMaker", pageMaker);
	}
	
	//나중에 상세 목록 태그나 트롭박스 합시다
	@RequestMapping(value="/noticeDetail", method = RequestMethod.GET)
	public void readBoard(@RequestParam("bno") int bno,
			              @ModelAttribute("cri") Criteria cri, 
			              Model model) throws Exception {
		
		model.addAttribute(service.read(bno));
	}
	
	//공지사항 삭제
	@RequestMapping(value="/removeNotice", method=RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno,
			            RedirectAttributes rttr) throws Exception {
		
		service.remove(bno);
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/study/notice";
	}
	
	//공지사항 수정
	@RequestMapping(value="/modifyNotice", method=RequestMethod.GET)
	public void modifyGET(int bno,
						  @ModelAttribute("cri") SearchCriteria cri, 
						  Model model) throws Exception {
		
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value="/modifyNotice", method=RequestMethod.POST)
	public String modifyPOST(NoticeVO vo,
			                 Criteria cri,
			                 RedirectAttributes rttr) throws Exception {
		
		logger.info("modify Notice........");
		
		service.modify(vo);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/study/noticeDetail";
	}

}
