package dev.mvc.study;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/study/*")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(StudyController.class);

	@Inject
	private NoticeService service;
	
	//공지사항 불러오기
	@RequestMapping(value="/notice", method = RequestMethod.GET)
	public void readNotice(Model model) throws Exception {
		
		logger.info("show notice..........");
		model.addAttribute("list", service.noticeList());
	}
}
