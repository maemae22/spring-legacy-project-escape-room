package open.sesame.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import open.sesame.dto.Member;
import open.sesame.dto.Reserve;
import open.sesame.mapper.ReserveMapper;

@Repository
@RequiredArgsConstructor
public class ReserveDAOImpl implements ReserveDAO {
	private final SqlSession sqlSession;

	@Override
	public int insertReserve(Reserve reserve) {
		return sqlSession.getMapper(ReserveMapper.class).insertReserve(reserve);
	}

	@Override
	public int updateReserve(Reserve reserve) {
		return sqlSession.getMapper(ReserveMapper.class).updateReserve(reserve);
	}

	@Override
	public int deleteReserve(int reserveNo) {
		return sqlSession.getMapper(ReserveMapper.class).deleteReserve(reserveNo);
	}

	@Override
	public Reserve selectReserve(int reserveNo) {
		return sqlSession.getMapper(ReserveMapper.class).selectReserve(reserveNo);
	}

	@Override
	public List<Reserve> selectReserveList(Map<String, Object> map) {
		return sqlSession.getMapper(ReserveMapper.class).selectReserveList(map);
	}

	@Override
	public List<String> checkReserveTime(Map<String, Object> map) {
		return sqlSession.getMapper(ReserveMapper.class).checkReserveTime(map);
	}

	@Override
	public int reserveCount() {
		return sqlSession.getMapper(ReserveMapper.class).reserveCount();
	}

	@Override
	public List<Reserve> selectMyReserveList(Map<String, Object> map) {
		return sqlSession.getMapper(ReserveMapper.class).selectMyReserveList(map);

	}

	@Override
	public int myReserveCount(String memberEmail) {
		return sqlSession.getMapper(ReserveMapper.class).myReserveCount(memberEmail);
	}
}
