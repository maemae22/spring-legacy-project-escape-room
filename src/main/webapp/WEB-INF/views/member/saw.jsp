<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.saw {
	background: black;
}
.saw_box {
	    /* min-width: 400px; */
    max-width: 400px;
    margin-top: 120px;
    margin-bottom: -100px;
    margin-left: auto;
    margin-right: auto;
    min-height: 657px;
}

.saw .saw_box {

}

.saw .saw_box img{
	width: 800px;
	height: 500px;
	margin-left: -210px;
}
</style>
</head>
<body class="saw">
	<div class="saw_box">
	<a href="${pageContext.request.contextPath}/member/agree"><img src="<c:url value="/images/auth/saw.jpg"/>"></a>
	</div>
	
</body>
</html>