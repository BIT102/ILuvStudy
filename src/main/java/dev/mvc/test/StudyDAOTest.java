package dev.mvc.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

	private static Logger logger = LoggerFactory.getLogger(NoticeDAOTest.class);
	
	@Test
	public void readStudy() throws Exception {
		
		logger.info(dao.readStudy(2).toString());
	}
}
