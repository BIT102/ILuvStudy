package dev.mvc.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.PageMaker;
import dev.mvc.domain.QnaVO;
import dev.mvc.domain.ReplyVO;
import dev.mvc.domain.SearchCriteria;
import dev.mvc.service.QnaService;

@Controller
@RequestMapping("/qna/*")
public class QnaController {

	private static final Logger logger = LoggerFactory.getLogger(StudyController.class);
	
	@Inject
	private QnaService service; //QnaService객체를 주입받는다
	
	@RequestMapping(value = "/qna", method = RequestMethod.GET) //get
	public void registerGET(QnaVO board, Model model)throws Exception{
		
		logger.info("register get...........");
	}
	
	
	@RequestMapping(value = "/qna", method = RequestMethod.POST) //post
	public String registPOST(QnaVO board, RedirectAttributes rttr)throws Exception{
		logger.info("regist post............");
		logger.info(board.toString());
		
		service.regist(board);
		
//		model.addAttribute("result", "success"); //model클래스는 MAP과 유사하게 키,값 으로 데이터를 저장하는 역할을 합니다.
		rttr.addFlashAttribute("msg", "success");//model대신 addFlashAttribute()라는 기능으로 리다이렉트 시점에 한 번만 사용되는 데이터를 전송
												//msg로 추가된 데이터는 브라우저까지 전송되기는 하지만 URI상에는 보이지 않는 숨겨진 데이터의 형태로 전달됩니다.
		
//		return "/qna/success";   //   /WEB-INF/views/board/success.jsp
		return "redirect:/qna/qnaList";   //사용자가 새로고침을 이용하는것을 방지
	}
	
	//전체조회 매핑(qnaList.jsp만들기)
	@RequestMapping(value="qnaList", method = RequestMethod.GET)
	public void qnaList(Model model)throws Exception{    		//MVC의 Model타입의 객체를 파라미터로 받는다.
		
		logger.info("show all List...............");
		model.addAttribute("list", service.listAll());			//Model을 이용해서 모든 게시물을 JSP로 전송하는작업
	};
	
	//조회 매핑(bno를 @RequestParam으로 전달받아서 처리할 수 있게)
	@RequestMapping(value="/qnaDetail", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno,
			@ModelAttribute("cri") Criteria cri,
			Model model)throws Exception{
		
		model.addAttribute(service.read(bno)); //조회된 결과 게시물을 JSP로 전달(model객체 사용)
	}
	
	//삭제매핑  에러메시지...... Failed to convert value of type [java.lang.String] to required type [int]; nested exception is java.lang.NumberFormatException: For input string: ""
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("bno")int bno, 
			Criteria cri,
			RedirectAttributes rttr)throws Exception{
		logger.info("remove post...............");
		
		service.remove(bno);
		
		rttr.addAttribute("page", cri.getPage()); //원래의 목록페이지로 이동
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/qna/listPage";
	}
	
	//수정 매핑
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(int bno, 
			@ModelAttribute("cri") SearchCriteria cri,
			Model model)throws Exception{
//		System.out.println("===================");
//		System.out.println(bno);
//		System.out.println(model);
//		System.out.println("===================");
		
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(QnaVO board,
			Criteria cri,
			RedirectAttributes rttr)throws Exception{
		
		logger.info("modify post...............!!!!!!!!!!!");
//		System.out.println(board);
		service.modify(board);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/qna/listPage";
	}
	
	@RequestMapping(value = "/listCri", method = RequestMethod.GET)
	public void listAll(Criteria cri, Model model) throws Exception{
		logger.info("show list Page with Criteria................");
		
		model.addAttribute("list", service.listCriteria(cri));
	}
	
	//Criteria cri 파라미터 Model객체 이용해서 PageMaker저장
	@RequestMapping(value="/listPage", method = RequestMethod.GET)
	public void listPage(Criteria cri, Model model)throws Exception{
		
		logger.info(cri.toString());
		
		model.addAttribute("list", service.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	//reply
	@RequestMapping(value="", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO vo){
		ResponseEntity<String> entity = null;
		try{
			
			service.addReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch (Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//특정 게시물의 전체 댓글 목록
	@RequestMapping(value="/all/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(
			@PathVariable("bno")Integer bno){
		
		ResponseEntity<List<ReplyVO>> entity = null;
		try{
			entity = new ResponseEntity<>(
					service.listReply(bno), HttpStatus.OK);
					//List객체에 담겨있는걸 반환
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//수정 처리
	@RequestMapping(value = "/{rno}",
		method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(
			@PathVariable("rno") Integer rno,
			@RequestBody ReplyVO vo){
		ResponseEntity<String> entity = null;
		try {
			vo.setRno(rno);
			service.modifyReply(vo);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}	catch (Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
