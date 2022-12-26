package open.sesame.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import open.sesame.dto.Member;
import open.sesame.exception.LoginAuthFailException;
import open.sesame.exception.MemberExistsException;
import open.sesame.exception.MemberNotFoundException;
import open.sesame.service.MemberService;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
	private final MemberService memberService;
	
	@RequestMapping(value = "/agree", method = RequestMethod.GET)
	public String agree(){
		return "member/agreement";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "member/user_join1";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute Member member) throws MemberExistsException {
		memberService.addMember(member);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/login_add", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> login(@RequestBody Member member, HttpSession session) throws LoginAuthFailException, MemberNotFoundException {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			memberService.loginAuth(member);
			session.setAttribute("loginMember", memberService.getMember(member.getMemberEmail()));
			resultMap.put("result", "success");
			return resultMap;
			
		} catch (LoginAuthFailException e) {
			resultMap.put("errorMessage", e.getMessage());
			resultMap.put("result", "fail");
			return resultMap;
		}
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/saw", method = RequestMethod.GET)
	public String prison(){
		return "member/saw";
	}
	
	
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	@ResponseBody
	public String checkId(@RequestBody String memberEmail){
		int cnt =  memberService.emailCheck(memberEmail);
		return Integer.toString(cnt);
	}

	@RequestMapping(value = "/nickCheck", method = RequestMethod.POST)
	@ResponseBody
	public String checkNick(@RequestBody String memberNick){
		int cnt =  memberService.nickCheck(memberNick);
		return Integer.toString(cnt);
	}

	@RequestMapping(value = "/phoneCheck", method = RequestMethod.POST)
	@ResponseBody
	public String checkPhone(@RequestBody String memberPhone){
		int cnt =  memberService.phoneCheck(memberPhone);
		return Integer.toString(cnt);
	}

	@RequestMapping(value = "/findEmail", method = RequestMethod.GET)
	public String findEmail() {
		return "member/user_id";
	}
	
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	@ResponseBody
	public String Idfind(@RequestBody String memberPhone){
		String email =  memberService.findId(memberPhone);
		return email;
	}
	
	@RequestMapping(value = "/findPwView", method = RequestMethod.GET)
	public String findPwView(){
		return "member/user_passwd";
	}
	
	@RequestMapping(value="/findPw", method=RequestMethod.POST)
	public String findPw(Member member,Model model) throws Exception{
		if(memberService.findPwCheck(member)==0) {
			model.addAttribute("msg", "이메일과 핸드폰번호를 확인해주세요");
			return "member/user_passwd";
		}else {
		memberService.findPw(member.getMemberEmail(),member.getMemberPhone());
		model.addAttribute("member", member.getMemberEmail());
		
		return"member/findPw";
		}
	}
	
	@ExceptionHandler(MemberExistsException.class)
	public String memberExceptionHandler(MemberExistsException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		return "member/user_join1";
	}
	
	@ExceptionHandler(MemberNotFoundException.class)
	public String memberExceptionHandler(MemberNotFoundException exception) {
		return "member/user_error";
	}
	
	@ExceptionHandler(LoginAuthFailException.class)
	public String userinfoExceptionHandler(LoginAuthFailException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("member", exception.getMemberEmail());
		return "/main";
	}
}
