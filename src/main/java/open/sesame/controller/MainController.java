package open.sesame.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping(value = {"/","/main"})
	public String main() {
		return "main";
	}
	
	@RequestMapping(value = "/notLoginUser")
	public String error() {
		return "member/member_error";
	}
	
	
	
	
}
