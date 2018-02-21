package dev.mvc.admin;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class TestControllerAdmin {
	
	private static final Logger logger = LoggerFactory.getLogger(TestControllerAdmin.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "test123", method = RequestMethod.GET)
	public String adminLogin(Locale locale, Model model) {
		return "admin/adminLogin";
	}
	
	@RequestMapping(value = "test1212", method = RequestMethod.GET)
	public String adminList(Locale locale, Model model) {
		return "admin/adminList";
	}

}
