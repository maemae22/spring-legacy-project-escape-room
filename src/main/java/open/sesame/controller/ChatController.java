package open.sesame.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import open.sesame.chat.ChattingHandler;
import open.sesame.dto.Member;
@Controller

public class ChatController {

	private static Logger log = LoggerFactory.getLogger(ChattingHandler.class);
	
	@GetMapping("/chat")
	public void chat(HttpServletRequest request, Model model, HttpSession session, Member member) throws Exception {
		session = request.getSession();
		member=(Member)session.getAttribute("loginMember");
		model.addAttribute("userid", member.getMemberNick());
	}
}