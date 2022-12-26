package open.sesame.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import open.sesame.dto.Cafe;
import open.sesame.dto.Member;
import open.sesame.mapper.CafeMapper;
import open.sesame.mapper.MemberMapper;

@Repository
@RequiredArgsConstructor
public class CafeDAOImpl implements CafeDAO {

	private final SqlSession sqlSession;

	@Override
	public int insertCafe(Cafe cafe) {
		return sqlSession.getMapper(CafeMapper.class).insertCafe(cafe);
	}

	@Override
	public int updateCafe(Cafe cafe) {
		return sqlSession.getMapper(CafeMapper.class).updateCafe(cafe);
	}

	@Override
	public int deleteCafe(int cafeNo) {
		return sqlSession.getMapper(CafeMapper.class).deleteCafe(cafeNo);
	}

	@Override
	public Cafe selectCafe(int cafeNo) {
		return sqlSession.getMapper(CafeMapper.class).selectCafe(cafeNo);
	}

	@Override
	public List<String> selectCafeListLoc(String cafeLoc) {
		return sqlSession.getMapper(CafeMapper.class).selectCafeListLoc(cafeLoc);
	}

	@Override
	public List<String> selectCafeNameList() {
		return sqlSession.getMapper(CafeMapper.class).selectCafeNameList();

	}

	@Override
	public List<Cafe> selectCafeList() {
		return sqlSession.getMapper(CafeMapper.class).selectCafeList();
	}

	@Override
	public List<Cafe> selectLocCafeList(Map<String, Object> loc) {
		return sqlSession.getMapper(CafeMapper.class).selectLocCafeList(loc);
	}

	@Override
	public List<Cafe> selectSearchCafeList(String search_keyword) {
		return sqlSession.getMapper(CafeMapper.class).selectSearchCafeList(search_keyword);
	}

	@Override
	public Cafe selectCafeByName(String cafeName) {
		return sqlSession.getMapper(CafeMapper.class).selectCafeByName(cafeName);
	}

	@Override
	public int selectCafeCount() {
		return sqlSession.getMapper(CafeMapper.class).selectCafeCount();
	}

	@Override
	public List<Member> selectCafeList2(Map<String, Object> map) {
		return sqlSession.getMapper(CafeMapper.class).selectCafeList2(map);
	}

	@Override
	public int deleteCafe2(String cafeName) {
		return sqlSession.getMapper(MemberMapper.class).deleteMember(cafeName);
	}
}
