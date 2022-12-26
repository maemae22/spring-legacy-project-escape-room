<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#findPw_body {
	background-color:#f0f0f0;
}
#findPw {
    
    min-width: 400px;
    max-width: 500px;
    margin-top: 140px;
    margin-bottom: -170px;
    margin-left: auto;
    margin-right: auto;
    min-height: 563px;
   
}


.ment {
	font-size: 30px;
	text-align: center;
	margin-bottom: 15px;
}

#member {
	font-size: 40px;
	text-align: center;
	margin-bottom: 15px;
	font-weight: bold;
}

#findPw_logo {
	width: 300px;
	margin-left: 140px;
	margin-top: 20px;
}

</style>
</head>
<body id="findPw_body">
	<div id="findPw">
		<div class="ment">임시 비밀번호가 전송되었습니다.</div>
	  	<div id="member">${member}</div>
	  	<div class="ment">가입하신 메일을 확인해주세요.</div>
	  	 <a id="findPw_logo" href="${pageContext.request.contextPath}/main">
                <img src="<c:url value="/images/auth/join_logo_back.png"/>" style="width: 200px;">
         </a>
	</div>
</body>
</html>