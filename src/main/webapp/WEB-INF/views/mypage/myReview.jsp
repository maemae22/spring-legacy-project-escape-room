<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">

@import url("https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css");

body{
	font-family: "nanumbarungothic";
	margin: 0px;
}

.clear{
	clear: both;
}

#mypage{
	width: 100%;
	box-sizing: border-box;
	padding: 50px;
	background-color: #f0f0f0;
}

#fix{
	width: 1000px;
	margin-left: auto;
	margin-right: auto;
	min-height: 433.5px;
}

#titleAndButton {
	width: 100%;
	height: 55px;
	margin-left: auto;
	margin-right: auto;
}

#title{
	float: left;
    font-size: 35px;
    font-weight: bold;
    margin-bottom: 5px;
}

#btn{
	width: 61%;
    height: 50px;
    float: right;
}

#btn ul{
	padding: 0px;
    float: right;
    margin: 0px;
}

#btn ul li{
	border: 1px solid #E3E3E3;
    width: 190px;
    height: 50px;
    float: left;
    list-style: none;
    text-align: center;
    background-color: white;
    margin-left: 10px;
    font-size: 18px;
    padding-top: 14px;
    color: #ABABAB;
    display: inline-block;
    cursor: pointer;
}

#btn ul li>a{
	text-decoration: none;
    color: ABABAB;
}

#btn ul li.active{
	color: black;
	background-color: orange;
}

#btn ul li.active>a{
	text-decoration: none;
    color: black;
}

#mypageContent{
	width: 100%;
	background-color: white;
}

#myInfoFix{
	box-sizing: border-box;
	padding: 20px;
}

#myInfo{
	border: 2px solid #E3E3E3;
	border-radius: 30px;
	width: 96%;
    margin-left: 20px;
	height: 300px;
}

#escapeGrade{
	border: 2px solid #E3E3E3;
    border-radius: 30px;
    width: 96%;
    margin-left: 20px;
    height: 500px;
    margin-top: 10px;
}

#context{
	background-color: white;
	padding-top: 20px;
	padding-bottom: 20px;
	margin-top: 35px;
	
}
table {
	clear: both;
	width: 100%;
	padding: 0px;
	border-collapse: collapse;
	border-left: 1px solid #EAEDF1;
	border-top: 1px solid #D6E1EA;
}

table th {
	margin: 0;
	padding: 8px 0px 8px 0px;
	line-height: 13px;
	text-align: center;
	border-bottom: 1px solid #D6E1EA;
	border-right: 1px solid #D6E1EA;
	background-color: #F7F7F7;
	color: #000000;
}

table td {
	word-break: break-all;
	margin: 0;
	padding: 8px 0px 8px 0px;
	line-height: 14px;
	text-align: center;
	border-bottom: 1px solid #EAEDF1;
	border-right: 1px solid #EAEDF1;
	color: #000000;
}
</style>

<div id="mypage">
	<div id="fix">
		<div id="titleAndButton">
			<div id="title">
			마이페이지
			</div>
			<div id="btn">
			<ul>
				<li class="select_mypage myInfo_select" data-page="myBasic" onclick="location.href='${pageContext.request.contextPath}/mypage'">기본정보</li>
				<li class="select_mypage myReview_select active" data-page="myReview">나의 탈출일지</li>
				<li class="select_mypage myReservation_select" data-page="myReservation" onclick="location.href='${pageContext.request.contextPath}/mypage/myReservation'">예약내역</li>
			</ul>
			</div>
		</div>
		<div id="reviewListDiv"></div>

			<%-- 페이지 번호를 출력하는 영역 --%>
		<div id="pageNumDiv"></div>
	</div>
</div>

<script type="text/javascript">

var page=1;//현재 요청 페이지의 번호를 저장하기 위한 전역변수

//회원 목록을 출력하는 함수 호출
reviewListDisplay(page);

//AJAX 기능으로 요청하여 응답결과를 이용하여 게시글 목록을 출력하는 함수 - 페이징 처리
function reviewListDisplay(pageNum) {
	page=pageNum;
	$.ajax({
		type: "get",
		url: "${pageContext.request.contextPath}/mypage/reviewInfo?pageNum="+pageNum,
		dataType: "json",
		success: function(json) {
			console.log(json);
			if(json.reviewList.length==0) {
				var html="<table>";
				html+="<tr>";
				html+="<th width='800' colspan='8'>작성하신 리뷰가 하나도 없습니다.</th>";	
				html+="</tr>";
				html+="</table>";
				$("#reviewListDiv").html(html);
				return;
			}
			
			var html="<table>";
			html+="<tr>";		
			html+="<th>번호</th>";							
			html+="<th>테마</th>";				
			html+="<th>플레이날짜</th>";				
			html+="<th>나의평점</th>";				
			html+="<th>성공여부</th>";				
			html+="<th>남은시간</th>";					
			html+="<th>힌트</th>";								
			html+="</tr>";
			$(json.reviewList).each(function(index) {
				
				html+="<tr>";
				html+="<td>"+(index+1)+"</td>";
				html+="<td>";
				html+="<a href='${pageContext.request.contextPath}/theme/theme_detail/"+this.REVIEW_TNO+"'><img src='${pageContext.request.contextPath}/images/theme/detail/theme_img/"+this.THEME_IMAGE_LOC+"' width='80px' height='60px' ></img></a>";
				html+="</td>";
				html+="<td>"+this.REVIEW_PLAYDATE+"</td>";
				html+="<td>"+this.REVIEW_RATING+"</td>";
				html+="<td>"+this.REVIEW_CLEAR+"</td>";
				html+="<td>"+this.REVIEW_TIME+"</td>";
				html+="<td>"+this.REVIEW_HINT+"</td>";
				html+="</tr>";

			});
			html+="</table>";
			
			
			$("#reviewListDiv").html(html);
			
			//페이지 번호를 출력하는 함수 호출
			pageNumDisplay(json.pager);
		},
		error: function(xhr) {
			alert("에러코드(SELECT) = "+xhr.status);
		}
	});
}

//페이지 번호를 출력하는 함수
function pageNumDisplay(pager) {
	var html="";
	
	if(pager.startPage>pager.blockSize) {
		html+="<a href='javascript:reviewListDisplay(1);'>[처음]</a>";
		html+="<a href='javascript:reviewListDisplay("+pager.prevPage+");'>[이전]</a>";
	} else {
		html+="[처음][이전]";
	}
	
	for(i=pager.startPage;i<=pager.endPage;i++) {
		if(pager.pageNum!=i) {
			html+="<a href='javascript:reviewListDisplay("+i+");'>["+i+"]</a>";
		} else {
			html+="["+i+"]";
		}
	}
	
	if(pager.endPage!=pager.totalPage) {
		html+="<a href='javascript:reviewListDisplay("+pager.nextPage+");'>[다음]</a>";
		html+="<a href='javascript:reviewListDisplay("+pager.totalPage+");'>[마지막]</a>";
	} else {
		html+="[다음][마지막]";
	}
	
	$("#pageNumDiv").html(html);
}
</script>