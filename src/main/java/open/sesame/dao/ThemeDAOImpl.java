package open.sesame.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import open.sesame.dto.Theme;
import open.sesame.mapper.MemberMapper;
import open.sesame.mapper.ThemeMapper;

@Repository
@RequiredArgsConstructor
public class ThemeDAOImpl implements ThemeDAO {

	private final SqlSession sqlSession;

	@Override
	public Theme selectTheme(int themeNo) {
		return sqlSession.getMapper(ThemeMapper.class).selectTheme(themeNo);
	}

	// 카페 이름을 value로 가지고 있는 map 객체를 이용해 카페 이름에 맞는 테마 갯수 출력
	@Override
	public int selectCafeThemeCount(Map<String, Object> map) {
		return sqlSession.getMapper(ThemeMapper.class).selectCafeThemeCount(map);
	}

	@Override
	public List<Theme> selectThemeListCafe(String themeCname) {
		return sqlSession.getMapper(ThemeMapper.class).selectThemeListCafe(themeCname);
	}

	@Override
	public List<Theme> selectThemeList() {
		return sqlSession.getMapper(ThemeMapper.class).selectThemeList();
	}

	@Override
	public List<Theme> selectOtherThemeList(String themeCname) {
		return sqlSession.getMapper(ThemeMapper.class).selectOtherThemeList(themeCname);
	}

	@Override
	public List<Theme> selectThemeCateList(Map<String, Object> map) {
		return sqlSession.getMapper(ThemeMapper.class).selectThemeCateList(map);
	}

	@Override
	public int selectThemeCount() {
		return sqlSession.getMapper(ThemeMapper.class).selectThemeCount();
	}

	@Override
	public int deleteTheme(String themeName) {
		return sqlSession.getMapper(ThemeMapper.class).deleteTheme(themeName);
	}
	@Override
	public List<Theme> selectThemeList2(Map<String, Object> map) {
		return sqlSession.getMapper(ThemeMapper.class).selectThemeList2(map);
	}
	@Override
	public int insertTheme(Theme theme) {
		return sqlSession.getMapper(ThemeMapper.class).insertTheme(theme);
	}
	@Override
	public int updateTheme(Theme theme) {
		return sqlSession.getMapper(ThemeMapper.class).updateTheme(theme);
		
	}
}
