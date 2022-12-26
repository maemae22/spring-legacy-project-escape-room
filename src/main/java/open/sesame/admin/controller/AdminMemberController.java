package open.sesame.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import open.sesame.dto.Member;
import open.sesame.exception.MemberNotFoundException;
import open.sesame.service.MemberService;
import open.sesame.util.Pager;

@Controller
@RequiredArgsConstructor

public class AdminMemberController {
	private final MemberService memberService;
	
	@RequestMapping("/admin/member_admin")
	public String memberAdmin() {
		
		return "admin/admin_member";
	}

	@RequestMapping(value = "/admin/member_list" , method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> restMemeberList(@RequestParam(defaultValue = "1") int pageNum) {
		
		int totalBoard=memberService.getMemberCount();
		int pageSize=10;
		int blockSize=5;
		
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pagerMap=new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());

		Map<String, Object> returnMap=new HashMap<String, Object>();
		returnMap.put("memberList", memberService.getMemberList(pagerMap));
		returnMap.put("pager", pager);
		
		return returnMap;
		
	}
	
	@RequestMapping(value = "/admin/member_update" , method = RequestMethod.POST)
	@ResponseBody
	public String adminMemberStatus(@RequestBody Member member) throws MemberNotFoundException {
		
		memberService.modifyMember(member);
		return "success";
		
	}
	@RequestMapping(value = "/admin/member_delete", method = RequestMethod.POST)
	@ResponseBody
	public String adminCheckDelete(@RequestParam(value="memberEmail[]") ArrayList<String> memberList) throws MemberNotFoundException {
		

		for(int i=0; i<memberList.size(); i++) {
			memberService.removeMember(memberList.get(i));
		}

		return "success";
	}
	
	

}
