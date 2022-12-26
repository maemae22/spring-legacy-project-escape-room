package open.sesame.dao;

import java.util.List;
import java.util.Map;

import open.sesame.dto.Member;
import open.sesame.dto.Reserve;

public interface ReserveDAO {
	int insertReserve(Reserve reserve);
	int updateReserve(Reserve reserve);
	int deleteReserve(int reserveNo);
	int reserveCount();
	int myReserveCount(String memberEmail);
	Reserve selectReserve(int reserveNo);
	List<String> checkReserveTime(Map<String, Object> map);
	List<Reserve> selectReserveList(Map<String, Object> map);
	List<Reserve> selectMyReserveList(Map<String, Object> map);
}
