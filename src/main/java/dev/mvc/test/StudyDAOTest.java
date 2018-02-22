package dev.mvc.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dev.mvc.study.StudyDAO;
import dev.mvc.study.StudyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class StudyDAOTest {
	
	@Inject
	private StudyDAO dao;
	
	@Test
	public void testcreate() throws Exception {
	
		StudyVO vo = new StudyVO();
		vo.setTitle("김상욱바보");
		vo.setWriter("abc1@gmail.com");
		vo.setCategoryD("A");
		vo.setCategoryS(1);
		vo.setMax(4);
		vo.setrDId("A");
		vo.setrSId(1);
		vo.setAge("20대");
		vo.setSc("월요일");
		vo.setSd("2018/03/01");
		vo.setSt("14:00");
		vo.setEt("16:00");
		vo.setContent("바보멍청이");
		
		dao.createStudy(vo);
	}

}
