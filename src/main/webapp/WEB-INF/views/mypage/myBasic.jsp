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
    padding-left: 20px;
    padding-top: 10px;
}

#escapeGrade{
	border: 2px solid #E3E3E3;
    border-radius: 30px;
    width: 96%;
    margin-left: 20px;
    margin-top: 10px;
    text-align: center;
    padding-top: 20px;
    padding-left: 20px;
    padding-bottom: 10px;
    
}

#context{
	background-color: white;
	padding-top: 20px;
	padding-bottom: 20px;
	margin-top: 35px;
}

.mypageLabel{
	float: left;
	width: 10%;
	margin-left: 10px;
}

.mypageTitle{
	font-size: 25px;
	text-align: left;
	font-weight: bold;
}

#modifyBtn{
	margin-left: 9px;
	cursor: pointer;
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
				<li class="select_mypage myInfo_select active" data-page="myBasic">기본정보</li>
				<li class="select_mypage myReview_select" data-page="myReview" onclick="location.href='${pageContext.request.contextPath}/mypage/myReview'">나의 탈출일지</li>
				<li class="select_mypage myReservation_select" data-page="myReservation" onclick="location.href='${pageContext.request.contextPath}/mypage/myReservation'">예약내역</li>
			</ul>
			</div>
		</div>
		<div id="context">
			<div id="myInfo">
				<p class="mypageTitle">INFORMATION</p>
				<label class="mypageLabel">EMAIL</label><p id="email">${member.memberEmail }</p>
				<label class="mypageLabel">NICKNAME</label><p id="nickname">${member.memberNick }</p>
				<label class="mypageLabel">PHONE</label><p id="phone">${member.memberPhone }</p>
				<div id="modifyBtn" onclick="location.href='${pageContext.request.contextPath}/mypage/memberModify'">정보수정</div>
			</div>
			
			
			<div id="escapeGrade">
				<p class="mypageTitle">ESCAPE GRADE</p>
				<% int a = 12; %>
				<% String rankName = null; %> 
				<% if(a>=1 && a<10){ %>
					<img src="${pageContext.request.contextPath}/images/mypage/bronze.png" class="rank">
				<% rankName = "Bronze";
					}else if(a>=10 && a<30){ %>
					<img src="${pageContext.request.contextPath}/images/mypage/silver.png" class="rank">
				<% rankName = "Silver";
					}else if(a>=30){ %>
					<img src="${pageContext.request.contextPath}/images/mypage/gold.png" class="rank">
				<% rankName = "Gold";
					}else{ %>
					<img src="${pageContext.request.contextPath}/images/mypage/unknown.png" class="rank">
				<% rankName = "Unknown";
					} %>
				<br/>
				### 님의 탈출횟수는 총 <span id="count"><%=a %></span> 회 입니다.
				<br/>
				<span id="rankName"><%=rankName %></span> 등급입니다.
				
				
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div>

<script type="text/javascript">

<%--
$("#modifyBtn").click(function() {
	$.ajax({
		url: "${pageContext.request.contextPath}/mypage/memberModify"
	})
	.done(function(result) {
		$("#myInfo").html(result);
	})
});
--%>

$("#email").val()


</script>