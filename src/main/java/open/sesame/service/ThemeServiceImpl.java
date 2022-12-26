package open.sesame.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import open.sesame.dao.ThemeDAO;
import open.sesame.dto.Theme;

@Service
@RequiredArgsConstructor
public class ThemeServiceImpl implements ThemeService {
	private final ThemeDAO themeDAO;

	@Override
	public int getThemeListCafeName(Map<String, Object> map) {
		return themeDAO.selectCafeThemeCount(map);
	}

	@Override
	public Theme getThemeList(int themeNo) {
		return themeDAO.selectTheme(themeNo);
	}

	@Override
	public List<Theme> getThemeListCafe(String themeCname) {
		return themeDAO.selectThemeListCafe(themeCname);
	}

	@Override
	public List<Theme> getThemeList() {
		return themeDAO.selectThemeList();
	}

	@Override
	public List<Theme> getOtherThemeList(String themeCname) {
		return themeDAO.selectOtherThemeList(themeCname);
	}

	@Override
	public List<Theme> getThemeCateList(Map<String, Object> map) {
		return themeDAO.selectThemeCateList(map);
	}

	@Override
	public int getThemeCount() {
		return themeDAO.selectThemeCount();

	}

	@Override
	public void removeTheme(String themeName) {

		themeDAO.deleteTheme(themeName);
	}

	@Override
	public List<Theme> getThemeList2(Map<String, Object> map) {
		return themeDAO.selectThemeList2(map);
	}
	@Override
	public void addTheme(Theme theme) {
		themeDAO.insertTheme(theme);
	}
	@Override
	public void modifyTheme(Theme theme) {
		themeDAO.updateTheme(theme);
	}
}
