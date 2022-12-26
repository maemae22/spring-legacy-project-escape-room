package open.sesame.dao;

import java.util.List;
import java.util.Map;

import open.sesame.dto.Cafe;
import open.sesame.dto.Member;

public interface CafeDAO {
	int insertCafe(Cafe cafe);
	int updateCafe(Cafe cafe);
	int deleteCafe(int cafeNo);
	int deleteCafe2(String cafeName);
	Cafe selectCafe(int cafeNo);
	Cafe selectCafeByName(String cafeName);
	List<Member> selectCafeList2(Map<String, Object> map);
	List<String> selectCafeListLoc(String cafeLoc);
	List<String> selectCafeNameList();
	List<Cafe> selectCafeList();
	List<Cafe> selectLocCafeList(Map<String,Object> loc);
	List<Cafe> selectSearchCafeList(String search_keyword);
	int selectCafeCount();
}
