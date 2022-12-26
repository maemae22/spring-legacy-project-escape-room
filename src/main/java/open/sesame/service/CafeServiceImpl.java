package open.sesame.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import open.sesame.dao.CafeDAO;
import open.sesame.dto.Cafe;
import open.sesame.dto.Member;

@Service
@RequiredArgsConstructor
public class CafeServiceImpl implements CafeService {
	private final CafeDAO cafeDAO;

	@Transactional
	@Override
	public void addCafe(Cafe cafe) {
		cafeDAO.insertCafe(cafe);
	}

	@Transactional
	@Override
	public void modifyCafe(Cafe cafe) {
		cafeDAO.updateCafe(cafe);
	}

	@Transactional
	@Override
	public void removeCafe(int cafeNo) {
		cafeDAO.deleteCafe(cafeNo);
	}

	@Override
	public Cafe getCafe(int cafeNo) {
		Cafe cafe = cafeDAO.selectCafe(cafeNo);
		return cafe;
	}

	@Override
	public List<Cafe> getCafeList() {
		return cafeDAO.selectCafeList();
	}

	@Override
	public List<Cafe> getLocCafeList(Map<String, Object> loc) {
		return cafeDAO.selectLocCafeList(loc);
	}

	@Override
	public List<Cafe> getSearchCafeList(String search_keyword) {
		return cafeDAO.selectSearchCafeList(search_keyword);
	}

	// 예약 페이지에서 지역 누르면 카페 이름만 반환
	@Override
	public List<String> getCafeListLoc(String cafeLoc) {
		return cafeDAO.selectCafeListLoc(cafeLoc);
	}

	// 예약 페이지에서 서울 누르면 카페 이름만 전체 반환
	@Override
	public List<String> getCafeNameList() {
		return cafeDAO.selectCafeNameList();
	}

	@Override
	public Cafe getCafeByName(String cafeName) {
		Cafe cafe = cafeDAO.selectCafeByName(cafeName);
		return cafe;
	}

	@Override
	public int getCafeCount() {
		return cafeDAO.selectCafeCount();
	}

	@Override
	public List<Member> getCafeList2(Map<String, Object> map) {
		return cafeDAO.selectCafeList2(map);
	}

	@Override
	public void removeCafe2(String cafeName) {

		cafeDAO.deleteCafe2(cafeName);
	}

}
