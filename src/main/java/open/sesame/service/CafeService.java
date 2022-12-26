package open.sesame.service;

import java.util.List;
import java.util.Map;

import open.sesame.dto.Cafe;
import open.sesame.dto.Member;

public interface CafeService {
	
	void addCafe(Cafe cafe);
	void modifyCafe(Cafe cafe);
	void removeCafe(int cafeNo);
	void removeCafe2(String cafeName);
	Cafe getCafe(int cafeNo);
	Cafe getCafeByName(String cafeName);
	List<String> getCafeListLoc(String cafeLoc); //예약 페이지에서 지역누르면 카페 이름만 반환
	List<String> getCafeNameList(); //예약 페이지에서 지역 서울 카페 전체 반환
	List<Cafe> getCafeList();
	List<Member> getCafeList2(Map<String, Object> map);
	List<Cafe> getLocCafeList(Map<String,Object> loc);
	List<Cafe> getSearchCafeList(String search_keyword);
	int getCafeCount();
}
