package dev.mvc.study.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dev.mvc.study.domain.BoardVO;
import dev.mvc.study.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class StudyDAOTest {

	@Inject
	private BoardDAO dao;
	
	
	@Test
	public void testInsertStudy() throws Exception{
		
		BoardVO vo = new BoardVO();
		
		vo.setBSTITLE("bswriter는 user에 email컬럼에서 가져와야된다.");
		vo.setBSWRITER("abc5@gmail.com");
		vo.setBSCATEGORYD("A");
		vo.setBSCATEGORYS(1);
		vo.setBSNOW(0);
		vo.setBSMAX(5);
		vo.setBSRDID("B");
		vo.setBSAGE("10대");
		vo.setBSSC("화요일");
		vo.setBSSD("2018/01/01");
		vo.setBSST("12:00");
		vo.setBSET("18:00");
		
		dao.insertStudy(vo);
	}
}
