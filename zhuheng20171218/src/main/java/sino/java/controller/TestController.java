package sino.java.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import sino.java.po.User;
import sino.java.services.UserServices;

@Controller
@RequestMapping("//zhuheng")
public class TestController {
	
	@Autowired
	private UserServices userServices;
	
	@RequestMapping("/testPage")
	public String controllerTest(ModelMap map){
		String runTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		map.addAttribute("date",runTime);
		System.out.println(runTime);
		User user = new User();
		userServices.save(user);
		return "/test";
	}
}
