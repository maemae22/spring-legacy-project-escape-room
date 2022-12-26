package open.sesame.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import open.sesame.dto.Member;
import open.sesame.exception.MemberNotFoundException;
import open.sesame.service.MemberService;
import open.sesame.service.ReserveService;
import open.sesame.service.ReviewService;
import open.sesame.service.ThemeService;
import open.sesame.util.Pager;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/mypage")
public class MypageController {
	
	public final MemberService memberService;
	public final ReserveService reserveService;
	public final ReviewService reviewService;
	public final ThemeService themeService;
	/*
	@RequestMapping
	public String mypage() {
		return "mypage/myBasic";
	}
	
	*/

	@RequestMapping(method = RequestMethod.GET)
	public String mypage(Model model, HttpSession session){
		model.addAttribute("member",session.getAttribute("loginMember"));
		//System.out.println(session.getAttribute("loginMember"));
		return "mypage/myBasic";
	}
	

	
	@RequestMapping(value = "/myReservation", method = RequestMethod.GET)
	public String myReservation() {
		
		
		return "mypage/myReservation";
		
	}
	
	@RequestMapping(value = "/reserveInfo", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> myReservation(@RequestParam (defaultValue = "1") int pageNum,  HttpSession session) {
		
		Member member = (Member)session.getAttribute("loginMember");
		
		int totalBoard=reserveService.getMyreserveCount(member.getMemberEmail());
		int pageSize=10;
		int blockSize=5;
		
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pagerMap=new HashMap<String, Object>();
		pagerMap.put("memberEmail", member.getMemberEmail());
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());

		Map<String, Object> returnMap=new HashMap<String, Object>();
		returnMap.put("reserveList", reserveService.getMyReserveList(pagerMap));
		returnMap.put("pager", pager);
		
		return returnMap;
		
	}
	
	@RequestMapping(value = "/reserve_delete", method = RequestMethod.POST)
	public String adminCheckDelete(@RequestParam(value="reserveNo[]") ArrayList<Integer> reserveList) throws MemberNotFoundException {
		
		for(int i=0; i<reserveList.size(); i++) {
			reserveService.removeReserve(reserveList.get(i));
		}

		return "success";
	}
	
	@RequestMapping(value = "/myReview", method = RequestMethod.GET)
	public String myReview() {
		return "mypage/myReview";
	}
	
	@RequestMapping(value = "/reviewInfo", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> myReview(@RequestParam (defaultValue = "1") int pageNum,  HttpSession session) {
		
		Member member = (Member)session.getAttribute("loginMember");
		
		int totalBoard=reviewService.getMyReviewCount(member.getMemberNick());
		int pageSize=10;
		int blockSize=5;
		
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pagerMap=new HashMap<String, Object>();
		pagerMap.put("memberNick", member.getMemberNick());
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());

		Map<String, Object> returnMap=new HashMap<String, Object>();
		returnMap.put("reviewList", reviewService.getMyReviewList(pagerMap));
		returnMap.put("pager", pager);
		
		return returnMap;
		
	}
	
	/*
	public String mypage(Model model, HttpSession session) throws MemberNotFoundException {
		model.addAttribute("member",memberService.getMember((String)session.getAttribute("loginMember")));
		return "mypage/myBasic";
	}
	*/
	
	@RequestMapping(value = "/memberModify", method = RequestMethod.GET)
	public String memberModify(Model model, HttpSession session) {
		model.addAttribute("member",session.getAttribute("loginMember"));
		return "mypage/memberModify";
	}
	
	@RequestMapping(value = "/memberModify_action", method = {RequestMethod.POST,RequestMethod.GET})
	public String memberModify_action(@RequestBody Member member, HttpSession session) throws MemberNotFoundException {
		//System.out.println(member);
		memberService.modifyMember(member);
		session.setAttribute("loginMember", memberService.getMember(member.getMemberEmail()));
		return "redirect:/";
	}
	
	@RequestMapping(value = "/passwdCheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> passwd_check(@RequestParam Map<String, Object> passwd) {
		
		String passwd2 = (String)passwd.get("passwd");
		String memberPassword2 = (String)passwd.get("passwd2");	
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(BCrypt.checkpw(passwd2,memberPassword2)) {
			resultMap.put("result","success");
			return resultMap;
		}else {
			resultMap.put("result","fail");
			return resultMap;
		}

	}

}
