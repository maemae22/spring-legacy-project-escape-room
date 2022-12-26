<%@page import="open.sesame.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">

#displayDiv{
	width: 100%;
    padding: 60px;
    background-color: #f0f0f0;
}

#fix{
	width: 850px;
	margin-left: auto;
	margin-right: auto;
}

#topTitle, #topNick{
	
    display: inline-block;
    height: 20px;
}

#topTitle{
	width: 500px;
}

#topNick{
	width: 270px;
}

#topNick, #topNick>p, #topNick>label{
	float: right;
}

#topNick>label{
	margin-left: 30px;
}

#topTitle>p, #topNick>p{
	margin-left: 30px;
}

#topTitle>p, #topTitle>label,#topNick>p, #topNick>label, .replyNickDiv, .replyContentDiv{
	display: inline-block;
}

#replyBtn, #replyBtn2{
	cursor: pointer;
}

#divs{
	background-color: white;
	border: 1px solid lightgrey;
}

#topDiv{
	padding : 5px 30px 5px 30px;
	margin-bottom: 10px;
	margin-top : 30px;
}

#contextDiv{
	min-height: 200px;
    padding: 45px;
}

#allreplyDiv{
	padding-left: 40px;
}

#replyBtn, #replyBtn2{
	width: 70px;
    height: 25px;
    padding-left: 7px;
    padding-top: 3px;
    float: right;
    margin-right: 40px;
    margin-top: 7px;
    border: 1px solid #cfcfcf;
}

#replyBtn:hover{
	background-color: #cfcfcf;
}

#replyFormDiv2{
	display: none;
}

.replyNickDiv{
	font-weight: bold;
    margin-right: 20px;
    width: 110px;
    text-align: left;
}

.replyList{
    margin-bottom: 7px;
    margin-left: 30px;
}

#replyFormDiv{
	margin-bottom: 60px;
}

#replyDiv{
	margin: 30px;
    margin-left: 65px;
}

</style>
<div id="titleImages">
	<img src="${pageContext.request.contextPath}/images/board/freeBoard.png" width="1920px" height="300px">
</div>
<div id="displayDiv">
	<div id="fix">
		<div id="divs">
			<div id="topDiv">
				<div id="topTitle">
					<label>제목</label>
					<p>${board.boardTitle }</p>
				</div>
				<div id="topNick">	
					<p>${board.boardNick }</p>
					<label>작성자</label>
					<p style="opacity: 10%">｜</p>
				</div>		
			</div>
			<hr style="width: 95%;">
			<div id="contextDiv">
				<div id="contentText">
				<p>${board.boardContent }</p>
			</div>
		</div>
		<hr style="width: 95%;">
			<div id="allreplyDiv">
					<c:forEach var="reply" items="${reply}">
							<div class="replyList">
							<label class="replyNickDiv">${reply.replyNick }</label>
							<div class="replyContentDiv">${reply.replyContent }</div>
							</div>
							<div id="replyFormDiv2">
							<form id="replyForm" name="replyForm">
							<div id="writeNick">
							<label>댓글 작성자</label>
							<input style="border: none;" type="text" class="replyNick1" value="${reply.replyNick }" readonly="readonly">
							</div>
							<div>
							<input style="width: 95%; height: 100px; border: 1px solid #cfcfcf;" type="text" id="replyContent2" name="replyContent2">
							<input type="hidden" id="replyBno" name="replyBno" value="${board.boardNo }" readonly="readonly">
							</div>
							<div class="replyBtn2" data-replyDept="${reply.replyDept }">댓글달기</div>
							</form>
							</div>
					</c:forEach>
				</div>
				<div id="replyDiv">
			
				<div id="replyFormDiv">
					<form id="replyForm" name="replyForm" action="${pageContext.request.contextPath}/board/reply_add">
						<div id="writeNick">
						<label>댓글 작성자</label>
						<input style="border: none;" type="text" id="replyNick1" name="replyNick1" value="${member.memberNick }" readonly="readonly">
						</div>
						<div>
						<textarea style="width: 95%; height: 100px; border: 1px solid #cfcfcf; padding: 7px;" id="replyContent" name="replyContent"></textarea>
						<input type="hidden" id="replyBno" name="replyBno" value="${board.boardNo }" readonly="readonly">
						</div>
						<div id="replyBtn">댓글달기</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

if ($("#replyNick1").val()=="") {
	$("#replyNick1").val("Unknown");
}

$(function (){



	$("#replyBtn").click(function() {
		
		
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/board/reply_add",
			data : JSON.stringify({"replyNick": $("#replyNick1").val(),
								"replyContent" : $("#replyContent").val(),
								"replyBno" : $("#replyBno").val()}),
			dataType: "json",
			contentType:'application/json',
			
			success: function(replyMap){
				
				var html="";
				$(replyMap.replyList).each(function(){
					html+= '<div class="replyList">'
					html+= '<div class="replyNickDiv">'+this.replyNick+'</div>'
					html+= '<div class="replyContentDiv">'+this.replyContent+'</div>'
					html+= '<input type="hidden" id="replyDept" name="replyDept" value="'+this.replyDept+'">'
					html+= '</div>'
					html+= '<div id="replyFormDiv2">'
					html+= '<form id="replyForm" name="replyForm">'
					html+= '<label>작성자</label>'
					html+= '<input type="text" id="replyNick" name="replyNick" value="'+this.replyNick+'" readonly="readonly">'
					html+= '<label>댓글내용</label>'
					html+= '<input type="text" id="replyContent2" name="replyContent2">'
					html+= '<div class="replyBtn2" data-replyDept="'+this.replyDept+'">댓글달기</div>'
					html+= '</form>'
					html+= '</div>'
				});
				$("#allreplyDiv").html(html);
			},
			
			error:function(xhr){
		        alert("에러 코드 = " + xhr.status);
	
		    }
			
		})
		
	});
	
	$(".replyBtn2").click(function() {
	
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/board/reply_reAdd",
			data : JSON.stringify({"replyNick": $("#replyNick1").val(),
								"replyContent" : $("#replyContent").val(),
								"replyBno" : $("#replyBno").val(),
								"replyDept":this.data("replyDept")}),
			dataType: "json",
			contentType:'application/json',
			
			success: function(replyMap){
				
				var html="";
				$(replyMap.replyList).each(function(){
					html+= '<div class="replyList">'
					html+= '<p>'+this.replyNick+'</p>'
					html+= '<p>'+this.replyContent+'</p>'
					html+= '<input type="hidden" id="replyDept" name="replyDept" value="'+this.replyDept+'">'
					html+= '</div>'
					html+= '<div id="replyFormDiv2">'
					html+= '<form id="replyForm" name="replyForm">'
					html+= '<label>작성자</label>'
					html+= '<input type="text" id="replyNick" name="replyNick" value="'+this.replyNick+'" readonly="readonly">'
					html+= '<label>댓글내용</label>'
					html+= '<input type="text" id="replyContent2" name="replyContent2">'
					html+= '<div class="replyBtn2" data-replyDept="'+this.replyDept+'">댓글달기</div>'
					html+= '</form>'
					html+= '</div>'
				});
				$("#allreplyDiv").html(html);
			},
			
			error:function(xhr){
		        alert("에러 코드 = " + xhr.status);
	
		    }
			
		})
		
	});

});
</script>