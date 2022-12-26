package open.sesame.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import lombok.RequiredArgsConstructor;
import open.sesame.dto.Reserve;
import open.sesame.service.CafeService;
import open.sesame.service.ReserveService;
import open.sesame.service.ThemeService;

@Controller
@RequestMapping(value = "/reserve")
@RequiredArgsConstructor
public class ReserveController {
	public final CafeService cafeService;
	public final ThemeService themeService;
	public final ReserveService reserveService;
	

	@RequestMapping
	public String reserve() {
		return "reserve/reserve";
	}
	
	
	@RequestMapping(value = "/loc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> clickLoc(@RequestBody Map<String, Object> map) {
		
		String loc = (String) map.get("loc");
		Map<String , Object> locList = new HashMap<String, Object>();
		
		if(loc.equals("서울")) {
			
			locList.put("cafeLoc", cafeService.getCafeNameList());
		} else {
			locList.put("cafeLoc", cafeService.getCafeListLoc(loc));
		}
		
		
		return locList;
	}
	
	@RequestMapping(value = "/cafe", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> clickCafe(@RequestBody Map<String, Object> map) {
		
		String themeCname = (String)map.get("themeCname");
		
		Map<String , Object> themeList = new HashMap<String, Object>();
		themeList.put("themeCafe", themeService.getThemeListCafe(themeCname));
		
		return themeList;
	}
	
	@RequestMapping(value = "/check", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> checkReserveTime(@RequestBody Map<String, Object> map) {

		Map<String , Object> allowTimeCheck = new HashMap<String, Object>();
		allowTimeCheck.put("reserveAllowTime", reserveService.getCheckAllowTime(map));
		
		return allowTimeCheck;
	}
	
	@RequestMapping(value = "/ok", method = RequestMethod.POST)
	@ResponseBody
	public String reserveInsert(@RequestBody Reserve reserve) {
		if(reserve.getReserveEmail() == null) {
			return "fail";
		}
		
		reserve.setReserveComment(HtmlUtils.htmlEscape(reserve.getReserveComment()));
		reserve.setReservePayment(HtmlUtils.htmlEscape(reserve.getReservePayment()));
		reserveService.addReserve(reserve);
		
		return "success";
	}
	
	
	
	
}
