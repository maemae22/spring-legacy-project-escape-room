package open.sesame.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import open.sesame.dao.ReserveDAO;
import open.sesame.dto.Reserve;

@Service
@RequiredArgsConstructor
public class ReserveServiceImpl  implements ReserveService{
	public final ReserveDAO reserveDao;

	@Override
	public void addReserve(Reserve reserve) {
		reserveDao.insertReserve(reserve);
		
	}

	@Override
	public void modifyUserinfo(int reserveNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeReserve(int reserveNo) {
		reserveDao.deleteReserve(reserveNo);
		
	}

	@Override
	public Reserve getUserinfo(int reserveNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Reserve> getReserveList(Map<String, Object> map) {
		return reserveDao.selectReserveList(map);
	}

	@Override
	public List<String> getCheckAllowTime(Map<String, Object> map) {
		return reserveDao.checkReserveTime(map);
	}

	@Override
	public int getreserveCount() {
		return reserveDao.reserveCount();
	}

	@Override
	public List<Reserve> getMyReserveList(Map<String, Object> map) {
		return reserveDao.selectMyReserveList(map);
	}

	@Override
	public int getMyreserveCount(String memberEmail) {
		return reserveDao.myReserveCount(memberEmail);
	}
}
