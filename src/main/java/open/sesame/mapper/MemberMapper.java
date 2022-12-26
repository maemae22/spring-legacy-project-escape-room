package open.sesame.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import open.sesame.dto.Member;

public interface MemberMapper {
	int insertMember(Member member);
	int updateMember(Member member);
	int deleteMember(String memberEmail);
	Member selectMember(String memberEmail);
	List<Member> selectMemberList(Map<String, Object> map);
	String findId(String memberPhone);
	Member findPass(Member member);
	int emailCheck(String memberEmail);
	int nickCheck(String memberNick);
	int phoneCheck(String memberPhone);
    int selectMemberCount();
	
	int findPwCheck(Member member); 
	int findPw(@Param("memberPasswd") String memberPasswd,@Param("memberEmail") String memberEmail,@Param("memberPhone") String memberPhone);
}

