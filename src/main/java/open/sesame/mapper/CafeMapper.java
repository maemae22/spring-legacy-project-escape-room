package open.sesame.mapper;

import java.util.List;
import java.util.Map;

import open.sesame.dto.Cafe;
import open.sesame.dto.Member;

public interface CafeMapper {
	int insertCafe(Cafe cafe);
	int updateCafe(Cafe cafe);
	int deleteCafe(int cafeNo);
	int deleteCafe2(String cafeName);
	Cafe selectCafe(int cafeNo);
	Cafe selectCafeByName(String cafeName);
	List<String> selectCafeListLoc(String cafeLoc);
	List<String> selectCafeNameList();
	List<Cafe> selectCafeList();
	List<Cafe> selectLocCafeList(Map<String,Object> loc);
	List<Cafe> selectSearchCafeList(String search_keyword);
	List<Member> selectCafeList2(Map<String, Object> map);
    int selectCafeCount();
}
