package dev.mvc.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dev.mvc.service.StudyService;

@Controller
@RequestMapping("/study/*")
public class SearchStudyController {

	@Inject
	private StudyService service;
	
	//파일 불러오기
	@RequestMapping("/getFile/{bno}")
	@ResponseBody
	public List<String> getFile(@PathVariable("bno") Integer bno) throws Exception {
		return service.getFile(bno);
	}
}
