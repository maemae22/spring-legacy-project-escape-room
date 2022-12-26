<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value="/css/id_find.css"/>"/>
</head>
<body class="id">
	<div class="id_box">
		<div class="id_title"><img src="<c:url value="/images/auth/idfind1.png"/>"></div>
		<div id="ment">가입시 입력한 핸드폰 번호를 입력해주세요.</div>
		<form action="${pageContext.request.contextPath}/member/join" id="id_frm" class="id_frm">
			<div class="phon_box">
				<input type="text" id="id_phone" class="id_phone" name="memberPhone" placeholder="하이픈 - 없이 입력" value="${member.memberPhone}">
			</div>
			
			<div class="btns">
				<button type="button" id="id_find_btn">아이디 찾기</button>
			</div>			
			<div id="email"></div>
		</form>
	</div>

<script type="text/javascript">
		$("#id_find_phone").focus();
		
		$("#id_find_btn").click(function() {
			var phone=$("#id_phone").val();
			
			if(phone=="") {
				alert("작성자를 입력해 주세요.");
				return;
			}
			
		$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/member/findId",
				contentType: "application/json",
				data: phone,
				dataType: "text",
				success: function (data) {
					if(data!="") {
						$("#email").html(data);
					} else {
						$("#email").html("가입된 이메일이 없습니다.");
					}
				}, 
				error: function(xhr) {
					alert("에러코드() = "+xhr.status);
				}
			});
		});
		
		
	</script>

</body>
</html>


