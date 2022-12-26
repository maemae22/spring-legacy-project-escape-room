package open.sesame.dao;

import java.util.List;
import java.util.Map;

import open.sesame.dto.Theme;

public interface ThemeDAO {
	Theme selectTheme(int themeNo);
	int selectCafeThemeCount(Map<String,Object> map);
	List<Theme> selectThemeListCafe(String themeCname);
	List<Theme> selectThemeList();
	List<Theme> selectOtherThemeList(String themeCname);
	List<Theme> selectThemeCateList(Map<String,Object> map);
	List<Theme> selectThemeList2(Map<String,Object> map);
	int insertTheme(Theme theme);
	int selectThemeCount();
	int deleteTheme(String themeName);
	int updateTheme(Theme theme);

}
