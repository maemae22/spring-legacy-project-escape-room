<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<style type="text/css">

.titleClick{
	cursor: pointer;
}

</style>

<link href="${pageContext.request.contextPath}/css/board.css" rel="stylesheet" type="text/css">
<div id="titleImages">
	<img src="${pageContext.request.contextPath}/images/board/notice.png" width="1920px" height="300px">
</div>
<div id="boardSpace">
	<div id="fix">
		<div id="btn">
			<ul>
				<li class="freeBoard_select" onclick="location.href='${pageContext.request.contextPath}/board'"><p>자유게시판</p></li>
				<li class="teamBoard_select" onclick="location.href='${pageContext.request.contextPath}/board/teamBoard'"><p>일행구하기</p></li>
				<li class="notice_select active"><p>공지사항</p></li>
			</ul>
		</div>
		<div class="clear"></div>
		<div id="boardList">
		
		</div>
		<c:if test="${loginMember.memberNick !=null and loginMember.memberStatus == 9}">
			<div id="writeBtn">
			<a class="btn btn-default pull-right" onclick="location.href='${pageContext.request.contextPath}/board/notice_write'">글쓰기</a>	
			</div>
		</c:if>
		<div id="pageNum" class="text-center">
					
		</div>
		
	</div>
</div>


<script type="text/javascript">
	
	var page=1;
	
	boardListDisplay(page);
	
	function boardListDisplay(pageNum) {
		page=pageNum;
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath}/board/notice_list?pageNum="+pageNum,
			dataType: "json",
			success: function(json) {
				if(json.noticeList.length==0) {
					html="<table class = 'table table-hover' id='boardTable'>";
					html+="<tr>";
					html+="<th width='800' colspan='6'>검색된 게시글이 하나도 없습니다.</th>";	
					html+="</tr>";
					html+="</table>";
					$("#boardList").html(html);
					return;
				}
				
				var html="<table class = 'table table-hover boardTable' id='boardTable'>";	
				html+="<tr>";
				html+="<th class='boardTh' width='50'>번호</th>";
				html+="<th class='boardTh' width='420'>제목</th>";
				html+="<th class='boardTh' width='90'>작성자</th>";	
				html+="<th class='boardTh' width='60'>조회수</th>";
				html+="<th class='boardTh' width='170'>작성일</th>";								
				html+="</tr>";
				$(json.noticeList).each(function() {
					html+="<tr>";
					html+="<td class='boardTd' align='center'>"+this.boardNo+"</td>";
					html+="<td class = 'titleClick boardTd' align='center' onclick='location.href="+'"${pageContext.request.contextPath}/board/'+this.boardNo+'"'+"'>"+this.boardTitle+"</td>";
					html+="<td td class='boardTd' align='center'>"+this.boardNick+"</td>";
					html+="<td td class='boardTd'>"+this.boardClick+"</td>";
					html+="<td td class='boardTd' align='center'>"+this.boardDate+"</td>";
					html+="</tr>";
				});
				html+="</table>";
				html+="</hr>";
				
				$("#boardList").html(html);
				
				pageNumDisplay(json.pager);
			},
			error: function(xhr) {
				alert("에러코드(SELECT) = "+xhr.status);
			}
		});
	}
	
	function pageNumDisplay(pager) {
		var html="";
		
		
		
		/*
		if(pager.startPage>pager.blockSize) {
			html+="<a href='javascript:boardListDisplay(1);'>[처음]</a>";
			html+="<a href='javascript:boardListDisplay("+pager.prevPage+");'>[이전]</a>";
		} else {
			html+="[처음][이전]";
		}
		*/
		
		html+="<ul class='pagination'>";
		
		for(i=pager.startPage;i<=pager.endPage;i++) {
			if(pager.pageNum!=i) {
				html+="<li><a href='javascript:boardListDisplay("+i+");'>["+i+"]</a></li>";
			} else {
				html+="<li><a>"+i+"</a></li>";
			}
		}
		
		html+="</ul>";
		
		/*
		if(pager.endPage!=pager.totalPage) {
			html+="<a href='javascript:boardListDisplay("+pager.nextPage+");'>[다음]</a>";
			html+="<a href='javascript:boardListDisplay("+pager.totalPage+");'>[마지막]</a>";
		} else {
			html+="[다음][마지막]";
		}
		*/
		
		
		$("#pageNum").html(html);
	}
</script>