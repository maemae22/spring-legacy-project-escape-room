package open.sesame.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import open.sesame.dto.Member;
import open.sesame.mapper.MemberMapper;

@Repository
@RequiredArgsConstructor
public class MemberDAOImpl implements MemberDAO{
	private final SqlSession sqlSession;

	@Override
	public int insertMember(Member member) {
		return sqlSession.getMapper(MemberMapper.class).insertMember(member);
	}

	@Override
	public int updateMember(Member member) {
		return sqlSession.getMapper(MemberMapper.class).updateMember(member);
	}

	@Override
	public int deleteMember(String memberEmail) {
		return sqlSession.getMapper(MemberMapper.class).deleteMember(memberEmail);
	}

	@Override
	public Member selectMember(String memberEmail) {
		return sqlSession.getMapper(MemberMapper.class).selectMember(memberEmail);
	}

	@Override
	public List<Member> selectMemberList(Map<String, Object> map) {
		return sqlSession.getMapper(MemberMapper.class).selectMemberList(map);
	}
	
	
	

	@Override
	public Member findPass(Member member) {
		return sqlSession.getMapper(MemberMapper.class).findPass(member);
	} 
	@Override
	public int emailCheck(String memberEmail) {
		int cnt = sqlSession.getMapper(MemberMapper.class).emailCheck(memberEmail);
		return cnt;
	}

	@Override
	public int nickCheck(String memberNick) {
		int cnt = sqlSession.getMapper(MemberMapper.class).nickCheck(memberNick);
		return cnt;
	}

	@Override
	public int phoneCheck(String memberPhone) {
		int cnt = sqlSession.getMapper(MemberMapper.class).phoneCheck(memberPhone);
		return cnt;
	}

	@Override
	public String findId(String memberPhone) {
		return sqlSession.getMapper(MemberMapper.class).findId(memberPhone);
	}

	@Override
	public int findPwCheck(Member member) {
		return sqlSession.getMapper(MemberMapper.class).findPwCheck(member);
	}

	@Override
	public int findPw(String memberEmail, String memberPhone, String memberPasswd) {
		return sqlSession.getMapper(MemberMapper.class).findPw(memberPasswd, memberEmail, memberPhone);
	}

	//페이징 처리 위한 카운트
	@Override
	public int selectMemberCount() {
		return sqlSession.getMapper(MemberMapper.class).selectMemberCount();
	}

	



	
}
