<%@page import="org.mindrot.jbcrypt.BCrypt"%>
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
    padding-left: 20px;
    padding-top: 10px;
    margin-top: 30px;
    height: 250px;
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
	margin-top: 25px;
    height: 355px;
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
	margin-top: 20px;
    margin-bottom: 20px;
}

#modifyDiv{
	display: none;
}

#submitCheck{
	cursor: pointer;
	margin-top: 5px;
	font-size: 15px;
	font-weight: bold;
}

#modifyBtn{
	cursor: pointer;
}

#label{
	font-size: 15px;
}

input{
	margin-left: 5px;
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
				<p class="mypageTitle">회원정보 변경</p>
				<div id="passwdCheck">
					<label id="label">비밀번호 확인</label>  
					<input type="password" name="memberPasswd" id="memberPasswd">
					<div id="submitCheck">확인</div>
				</div>
				
				<div id="modifyDiv">
				<form id = "modifyForm" action="${pageContext.request.contextPath}/mypage/memberModify_action">
				<label class="mypageLabel">EMAIL</label><input type="text" name="memberEmail" value="${member.memberEmail }" readonly="readonly"><br/>
				<label class="mypageLabel">PASSWORD</label><input type="password" name="memberPasswd"><br/>
				<label class="mypageLabel">NICKNAME</label><input type="text" name="memberNick" value="${member.memberNick }"><br/>
				<label class="mypageLabel">PHONE</label><input type="text" name="memberPhone" value="${member.memberPhone }"><br/>
				<input type="hidden" name="memberStatus" value="${member.memberStatus }" >
				<div id="modifyBtn">정보수정</div>
				</form>
				</div>
			</div>
			
		</div>
		<div class="clear"></div>
	</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

$("#submitCheck").click(function() {
	
	var passwd = $("#memberPasswd").val();
	var passwd2 = "${member.memberPasswd }"
	
	/*
	alert(passwd);
	alert(passwd2);
	*/
	
	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/mypage/passwdCheck",
		data: {"passwd":passwd, "passwd2":passwd2},
		success: function(resultMap) {
			
			//alert(resultMap);
			
			if(resultMap.result=="fail"){
				
				alert("비밀번호가 일치하지 않습니다.");
				
			}else{
				
				$("#passwdCheck").hide();
				$("#modifyDiv").show();
			}
		}
	});
	
	
	
	
	
});

jQuery.fn.serializeObject = function() {
    var obj = null;
    try {
        if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
            var arr = this.serializeArray();
            if (arr) {
                obj = {};
                jQuery.each(arr, function() {
                    obj[this.name] = this.value;
                });
            }//if ( arr ) {
        }
    } catch (e) {
        alert(e.message);
    } finally {
    }
 
    return obj;
};

$("#modifyBtn").click(function(){
	var formData = $("#modifyForm").serializeObject()
	//alert(formData)
	$.ajax({
		url: "${pageContext.request.contextPath}/mypage/memberModify_action",
		type : "POST",
		contentType : "application/json",
		data : JSON.stringify(formData),
		success : function(data){
			alert("회원님의 정보를 수정하였습니다.")
			location.href="${pageContext.request.contextPath}/mypage"
		}
		
	})
});

</script>