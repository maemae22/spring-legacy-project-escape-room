<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="<c:url value="/css/passwd_find.css"/>"/>

</head>
<body class="passwd">

	<div class="passwd_box">
		<div class="passwd_title"><img src="<c:url value="/images/auth/passwdfind1.png"/>"></div>
		<div id="ment">가입시 입력한 정보를 입력해주세요.</div>
		<form method="post" action="${pageContext.request.contextPath}/member/findPw" id="passwd_frm" class="passwd_frm" >
			
			<div class="email_box">
				<input type="text" id="findpass_email" class="findpass_email" name="memberEmail" placeholder="이메일을 입력해주세요." value="${memberEmail}">
			</div>
			<div class="phone_box">
				<input type="text" id="findpass_phone" class="findpass_phone" name="memberPhone" placeholder="핸드폰 번호를 - 없이 입력해주세요." value="${memberPhone}">
			</div>
			
			<div class="btns">
				<button type="button" id="passwd_btn">비밀번호 찾기</button>
			</div>		
		</form>
	</div>
<script type="text/javascript">
	function emailCheckFn(email) {
		var emailReg=/^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
		return emailReg.test(email);
	}
			 
	$("#passwd_btn").click(function () {
		
		
		if($("#findpass_email").val()=="") {
			alert("이메일을 입력해주세요.");
			$("#findpass_email").focus();
			return;
		} else if(!emailCheckFn($("#findpass_email").val())) {
			alert("이메일을 형식에 맞게 입력해주세요.");
			$("#findpass_email").focus();
			return;
		}
		
		var phoneReg = /01[016789][^0][0-9]{2,3}[0-9]{3,4}$/g;
		if($("#findpass_phone").val()=="") {
			$("#findpass_phone").focus();
			alert("전화번호를 입력해주세요.");
			return;
		} else if(!phoneReg.test($("#findpass_phone").val())) {
			alert("전화번호를 -없이 입력해주세요.");
			$("#findpass_phone").focus();
			return;
		} 
		
		var msg = "${msg}";
		if (msg != "") { //이메일과 핸드폰번호가 없다고 나올경우
			alert(msg);
			return;
		}
		
		$("#passwd_frm").submit();
	});
	
</script>	

</body>
</html>