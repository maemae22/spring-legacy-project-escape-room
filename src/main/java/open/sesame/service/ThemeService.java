package open.sesame.service;

import java.util.List;
import java.util.Map;

import open.sesame.dto.Review;
import open.sesame.dto.Theme;

public interface ThemeService {
	
	int getThemeListCafeName(Map<String, Object> map);
	void addTheme(Theme theme);
	Theme getThemeList(int themeNo);
	List<Theme> getThemeListCafe(String themeCname);
	List<Theme> getThemeList();
	List<Theme> getOtherThemeList(String themeCname);
	List<Theme> getThemeCateList(Map<String, Object> map);
	List<Theme> getThemeList2(Map<String, Object> map);
	void removeTheme(String themeName);
	int getThemeCount();
	void modifyTheme(Theme theme);
	
}
