package open.sesame.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.RequiredArgsConstructor;
import open.sesame.service.MemberService;

@Controller
@RequiredArgsConstructor
public class AdminController {
	private final MemberService memberService;

	@RequestMapping("/admin")
	public String admin() {
		return "admin";
	}
	
	

}
