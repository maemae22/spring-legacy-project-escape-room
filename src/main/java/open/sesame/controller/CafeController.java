package open.sesame.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import open.sesame.service.CafeService;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/cafe")
public class CafeController {

	public final CafeService cafeService;
	
	@RequestMapping
	public String cafe(Model model) {
		model.addAttribute("cafeList", cafeService.getCafeList());
		return "cafe/cafe_main";
		
	}
	
	// 키워드를 전달받아 CAFE 테이블에 저장된 CAFE 정보를 검색(카페이름으로 검색)하여
	@RequestMapping(value="/cafe_keyword_search", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> cafeKeywordSearch (@RequestBody Map<String, Object> keyword) {
		
		
		String keywordstring = (String)keyword.get("search_keyword");
		
		Map<String, Object> keywordMap = new HashMap<String, Object>();
		keywordMap.put("cafeList", cafeService.getSearchCafeList(keywordstring));
		
		return keywordMap ;
		
		
	}
	
	
	// 장소를 전달받아 CAFE 테이블에 저장된 CAFE 정보를 검색(카페장소로 검색)하여
	@RequestMapping(value="/cafe_loc_search", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> cafeLocSearch (@RequestBody Map<String, Object> loc) {
		
		
		String locstring = String.valueOf(loc.get("search_select_loc"));
		Map<String, Object> locMap = new HashMap<String, Object>();
		if(locstring.equals("[전국]")) {
			locMap.put("cafeList", cafeService.getCafeList());
		} else {
		
		//String locstringreplace1 = locstring_before.replace("[", "(");
		//String locstringreplace2 = locstringreplace1.replace("]", ")");
		
		//List<String> locList = (List)loc.get("search_select_loc");
		//System.out.println("search_select_loc list =" +locList.toString());
		
		
		locMap.put("cafeList", cafeService.getLocCafeList(loc)); 
		}
		
		return locMap ;
		
	}
	
}
	
