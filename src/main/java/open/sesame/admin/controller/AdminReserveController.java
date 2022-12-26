package open.sesame.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
import open.sesame.service.ReserveService;
import open.sesame.util.Pager;

@Controller
@RequiredArgsConstructor
public class AdminReserveController {
	private final ReserveService reserveService;

	@RequestMapping("/admin/reserve_admin")
	public String memberAdmin() {
		
		return "admin/admin_reserve";
	}
	
	@RequestMapping(value = "/admin/reserve_list" , method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> restReserveList(@RequestParam(defaultValue = "1") int pageNum) {
		
		int totalBoard=reserveService.getreserveCount();
		int pageSize=10;
		int blockSize=5;
		
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pagerMap=new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());

		Map<String, Object> returnMap=new HashMap<String, Object>();
		returnMap.put("reserveList", reserveService.getReserveList(pagerMap));
		returnMap.put("pager", pager);
		
		return returnMap;
		
	}
	
	@RequestMapping(value = "/admin/reserve_delete", method = RequestMethod.POST)
	@ResponseBody
	public String adminCheckDelete(@RequestParam(value="reserveNo[]") ArrayList<Integer> reserveList) throws MemberNotFoundException {
		

		for(int i=0; i<reserveList.size(); i++) {
			reserveService.removeReserve(reserveList.get(i));
		}

		return "success";
	}
	

}
