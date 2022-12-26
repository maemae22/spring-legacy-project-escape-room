<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="${pageContext.request.contextPath}/css/board_write.css" rel="stylesheet" type="text/css">

<div id="titleImages">
	<img src="${pageContext.request.contextPath}/images/board/freeBoard.png" width="1920px" height="300px">
</div>

<div id="writeContent">
	<div id="fix">
		<div id="divs">
			<form action="${pageContext.request.contextPath}/board/board_add">
				<div id="topDiv">
					<div id="topTitle">			
						<label>제목</label>
						<input style="border: 1px solid #cfcfcf;" type="text" name="boardTitle" id="boardTitle">
					</div>
					<div id="topNick">
						<input style= "border: none; text-align: right;" type="text" name="boardNick" id="boardNick" value="${member.memberNick }" readonly="readonly">
						<label>작성자</label>	
					</div>
				</div>
				<textarea style="width: 95%; height: 300px; border: 1px solid #cfcfcf; padding: 7px;" id="boardContent" name="boardContent"></textarea>
				<input type="hidden" name="boardCate" id="boardCate" value="1">
				<button id="submitBtn" type="submit">등록</button>
			</form>
		</div>
	</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

if ($("#boardNick").val()=="") {
	$("#boardNick").val("Unknown");
}

</script>
			