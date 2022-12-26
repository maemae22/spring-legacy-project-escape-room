package open.sesame.service;

import java.util.List;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import open.sesame.dao.MemberDAO;
import open.sesame.dto.Member;
import open.sesame.exception.LoginAuthFailException;
import open.sesame.exception.MemberExistsException;
import open.sesame.exception.MemberNotFoundException;
import open.sesame.mail.MailUtils;
import open.sesame.mail.TempKey;


@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
	private final MemberDAO memberDAO;
	private final JavaMailSender mailSender;
	
	
	@Transactional
	@Override
	public void addMember(Member member) throws MemberExistsException {
		if(memberDAO.selectMember(member.getMemberEmail())!=null) {
			throw new MemberExistsException("이미 사용중인 이메일 입니다.", member);
		}
		member.setMemberPasswd(BCrypt.hashpw(member.getMemberPasswd(), BCrypt.gensalt()));
		
		memberDAO.insertMember(member);
	}
	
	@Transactional
	@Override
	public void modifyMember(Member member) throws MemberNotFoundException {
		if(memberDAO.selectMember(member.getMemberEmail())==null) {
			throw new MemberNotFoundException("이메일의 회원정보가 존재하지 않습니다.");
		}
		if(member.getMemberPasswd()!=null && !member.getMemberPasswd().equals("")) {
			member.setMemberPasswd(BCrypt.hashpw(member.getMemberPasswd(), BCrypt.gensalt()));
		}
		memberDAO.updateMember(member);
	}

	@Transactional
	@Override
	public void removeMember(String memberEmail) throws MemberNotFoundException {
		if(memberDAO.selectMember(memberEmail)==null) {
			throw new MemberNotFoundException("이메일의 회원정보가 존재하지 않습니다.");
		}
		memberDAO.deleteMember(memberEmail);
	}

	@Override
	public Member getMember(String memberEmail) throws MemberNotFoundException {
		Member member=memberDAO.selectMember(memberEmail);
		if(member==null) {
			throw new MemberNotFoundException("이메일의 회원정보가 존재하지 않습니다.");
		}
		return member;
	}

	@Override
	public List<Member> getMemberList(Map<String, Object> map) {
		return memberDAO.selectMemberList(map);
	}

	@Override
	public void loginAuth(Member member) throws LoginAuthFailException {
		Member authMember=memberDAO.selectMember(member.getMemberEmail());
		
		if(authMember==null) {
			throw new LoginAuthFailException("이메일의 회원정보가 존재하지 않습니다.", member.getMemberEmail());
		}
		if(!BCrypt.checkpw(member.getMemberPasswd(), authMember.getMemberPasswd())) {
			throw new LoginAuthFailException("이메일이 없거나 비밀번호가 맞지 않습니다.", member.getMemberEmail());
		}
	}

	

	@Override
	public Member findPassMember(Member member) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int emailCheck(String memberEmail) {
		int cnt = memberDAO.emailCheck(memberEmail);
		return cnt;
	}

	@Override
	public int nickCheck(String memberNick) {
		int cnt = memberDAO.nickCheck(memberNick);
		return cnt;
	}

	@Override
	public int phoneCheck(String memberPhone) {
		int cnt = memberDAO.phoneCheck(memberPhone);
		return cnt;
	}

	@Override
	public String findId(String memberPhone) {
		return memberDAO.findId(memberPhone);
	}

	@Override
	public int findPwCheck(Member member) throws Exception {
		return memberDAO.findPwCheck(member);
	}
	
	@Override
	public void findPw(String memberEmail, String memberPhone) throws Exception {
		String memberKey = new TempKey().getKey(6,false);
		String memberPw = BCrypt.hashpw(memberKey, BCrypt.gensalt());
		memberDAO.findPw(memberEmail, memberPhone, memberPw);
		MailUtils sendMail = new MailUtils(mailSender);
		sendMail.setSubject("[열려라 참깨 방탈출카페 임시 비밀번호 입니다.]"); //메일제목
		sendMail.setText(
				"<h1>임시비밀번호 발급</h1>" +
						"<br/>"+memberEmail+"님 "+
						"<br/>비밀번호 찾기를 통한 임시 비밀번호입니다."+
						"<br/>임시비밀번호 :  <h2>"+memberKey+"</h2>"+
						"<br/>로그인 후 비밀번호 변경을 해주세요."+
						"<a href='http://localhost:8000/sesame/main>"+
						"로그인 페이지</a>");
		sendMail.setFrom("happybok93@gmail.com", "열려라참깨");
		sendMail.setTo(memberEmail);
		sendMail.send();
	}

	//페이징 처리를 위한 카운트
	@Override
	public int getMemberCount() {
		return memberDAO.selectMemberCount();
	}


	
}
