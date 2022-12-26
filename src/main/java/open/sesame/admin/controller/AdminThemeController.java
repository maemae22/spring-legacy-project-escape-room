package open.sesame.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import open.sesame.dto.Theme;
import open.sesame.service.ThemeService;
import open.sesame.util.Pager;

@Controller
@RequiredArgsConstructor

public class AdminThemeController {
	private final ThemeService themeService;
	private final WebApplicationContext context;
	
	@RequestMapping("/admin/theme_admin")
	public String ThemeAdmin() {
		
		return "admin/admin_theme";
	}

	@RequestMapping(value = "/admin/theme_list" , method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> restMemeberList(@RequestParam(defaultValue = "1") int pageNum) {
		
		int totalBoard=themeService.getThemeCount();
		int pageSize=10;
		int blockSize=5;
		
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pagerMap=new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());

		Map<String, Object> returnMap=new HashMap<String, Object>();
		returnMap.put("ThemeList", themeService.getThemeList2(pagerMap));
		returnMap.put("pager", pager);
		
		return returnMap;
	}	
	
	@RequestMapping(value = "/admin/theme_delete", method = RequestMethod.POST)
	@ResponseBody
	public String adminCheckDelete(@RequestParam(value="ThemeEmail[]") ArrayList<String> ThemeList)  {
		
		for(int i=0; i<ThemeList.size(); i++) {
			themeService.removeTheme(ThemeList.get(i));
		}

		return "success";
	}

	@RequestMapping(value = "/admin/theme_write_admin", method = RequestMethod.GET)
	public String adminThemeInsert()  {
		return "admin/admin_theme_write";
	}
	
	@RequestMapping(value = "/admin/theme_write_admin", method = RequestMethod.POST)
	public String upload(@ModelAttribute Theme theme) throws IllegalStateException, IOException {
		if(theme.getFile().isEmpty()) {
			return "admin/upload_fail";
		}
		
		String uploadDirectory=context.getServletContext().getRealPath("/resources/images/theme/detail/theme_img");
		
		String originalFilename=theme.getFile().getOriginalFilename();
		File imageFile=new File(uploadDirectory, originalFilename);
		
		theme.setThemeImageLoc(originalFilename);
		
		String uploadFilename=originalFilename;
		
		int i=0;
		while(imageFile.exists()) {
			i++;
			int index=originalFilename.lastIndexOf(".");
			
			uploadFilename=originalFilename.substring(0, index)+"_"+i+originalFilename.substring(index);

			imageFile=new File(uploadDirectory, uploadFilename);
		}
		
		theme.getFile().transferTo(imageFile);
		themeService.addTheme(theme);
		
		return "admin/admin_theme";
	}
	
	
	@RequestMapping(value = "/admin/theme_insert", method = RequestMethod.POST)
	@ResponseBody
	public String adminThemeInsert(Theme theme)  {
		
		themeService.addTheme(theme);
		return "redirect:/admin";
	}
	
	@RequestMapping(value = "/admin/admin_theme_modify/{themeNo}", method = RequestMethod.GET)
	public String adminThemeModify(@PathVariable int themeNo,@ModelAttribute Theme theme, Model model){
		theme = themeService.getThemeList(themeNo);
		String[] recommend = theme.getThemeRecommend().split("~");
		String themeRecommend1 = recommend[0];
		String themeRecommend2 = recommend[1];
		
		model.addAttribute("theme", theme);
		model.addAttribute("themeRecommend1", themeRecommend1);
		model.addAttribute("themeRecommend2", themeRecommend2);
		return "admin/admin_theme_modify";
	}
	
	@RequestMapping(value = "/admin/admin_theme_modify/{themeNo}", method = RequestMethod.POST)
	public String adminThemeModify(@PathVariable int themeNo,@ModelAttribute Theme theme, @RequestParam String themeRecommend1
			, @RequestParam String themeRecommend2) throws IllegalStateException, IOException {
		
		if(theme.getFile().isEmpty()) {
			themeService.modifyTheme(theme);
			
			return "admin/admin_theme";
		}
		
		theme.setThemeRecommend(themeRecommend1+"~"+themeRecommend2);
		
		String uploadDirectory=context.getServletContext().getRealPath("/resources/images/theme/detail/theme_img");
		
		String originalFilename=theme.getFile().getOriginalFilename();
		File imageFile=new File(uploadDirectory, originalFilename);
		
		String uploadFilename=originalFilename;
		
		int i=0;
		while(imageFile.exists()) {
			i++;
			int index=originalFilename.lastIndexOf(".");
			
			uploadFilename=originalFilename.substring(0, index)+"_"+i+originalFilename.substring(index);

			imageFile=new File(uploadDirectory, uploadFilename);
		}
		theme.setThemeImageLoc(uploadFilename);
		
		theme.getFile().transferTo(imageFile);
		themeService.modifyTheme(theme);
		
		return "admin/admin_theme";
	}
	
	

}
