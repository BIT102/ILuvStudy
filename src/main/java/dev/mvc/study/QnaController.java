package dev.mvc.study;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.study.domain.QnaVO;
import dev.mvc.study.service.QnaService;

@Controller
@RequestMapping("/qna/*")
public class QnaController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
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
	public void read(@RequestParam("bno") int bno, Model model)
		throws Exception{
		model.addAttribute(service.read(bno)); //조회된 결과 게시물을 JSP로 전달(model객체 사용)
	}
	
	//삭제매핑
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("bno")int bno, RedirectAttributes rttr)throws Exception{
		service.remove(bno);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/qna/qnaList";
	}
}
