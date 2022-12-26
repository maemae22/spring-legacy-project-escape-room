package open.sesame.service;

import java.util.List;
import java.util.Map;

import open.sesame.dto.Reserve;

public interface ReserveService {
	void addReserve(Reserve reserve);
	void modifyUserinfo(int reserveNo);
	void removeReserve(int reserveNo);
	int getreserveCount();
	int getMyreserveCount(String memberEmail);
	Reserve getUserinfo(int reserveNo);
	List<String> getCheckAllowTime(Map<String, Object> map);
	List<Reserve> getReserveList(Map<String, Object> map);
	List<Reserve> getMyReserveList(Map<String, Object> map);
}
