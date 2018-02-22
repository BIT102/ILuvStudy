package dev.mvc.study.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dev.mvc.study.domain.BoardVO;
import dev.mvc.study.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardDAOTest {

	@Inject
	private BoardDAO dao;
	
	private static Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
	
	@Test
	public void testInsertStudy() throws Exception{
		
		BoardVO vo = new BoardVO();
		
		vo.setBSTITLE("우리함께 노래합시다아아");
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
	
	@Test
	public void testRead() throws Exception{
		logger.info(dao.read(13).toString());
	}
	
}
