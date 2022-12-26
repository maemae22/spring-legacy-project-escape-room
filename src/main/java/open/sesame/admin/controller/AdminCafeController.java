package open.sesame.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import open.sesame.dto.Cafe;
import open.sesame.service.CafeService;
import open.sesame.util.Pager;

@Controller
@RequiredArgsConstructor
	
public class AdminCafeController {
	private final CafeService cafeService;
	
	@RequestMapping("/admin/cafe_admin")
	public String cafeAdmin() {
		
		return "admin/admin_cafe";
	}
	
	
	@RequestMapping(value = "/admin/cafe_update" , method = RequestMethod.POST)
	@ResponseBody
	public String adminCafeInsert(@RequestBody Cafe cafe) {
		
		cafeService.addCafe(cafe);
		return "/admin/admin_cafe_modify";
	}
	
	@RequestMapping(value = "/admin/cafe_list" , method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> restCafeList(@RequestParam(defaultValue = "1") int pageNum) {
		
		int totalBoard=cafeService.getCafeCount();
		int pageSize=10;
		int blockSize=5;
		
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pagerMap=new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());

		Map<String, Object> returnMap=new HashMap<String, Object>();
		returnMap.put("cafeList", cafeService.getCafeList2(pagerMap));
		returnMap.put("pager", pager);
		
		return returnMap;
	}	
	@RequestMapping(value = "/admin/cafe_delete", method = RequestMethod.POST)
	@ResponseBody
	public String adminCheckDelete(@RequestParam(value="cafeName[]") ArrayList<String> cafeList)  {
		

		for(int i=0; i<cafeList.size(); i++) {
			cafeService.removeCafe2(cafeList.get(i));
		}

		return "success";
	}
	
	

}
