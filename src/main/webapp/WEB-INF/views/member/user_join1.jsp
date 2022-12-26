<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value="/css/join_layer.css"/>"/>
<style type="text/css">
.id_ok{
color:#008000;
display: none;
}

.id_already{
color:#6A82FB; 
display: none;
}
.id_not_email{
color:#6A82FB; 
display: none;
}

.nick_ok{
color:#008000;
display: none;
}

.nick_already{
color:#6A82FB; 
display: none;
}

.phone_already{
color:#6A82FB; 
display: none;
}
</style>
</head>

<body class="join_find">
	<div class="join_box">
		<div class="join_title">
			<img src="<c:url value="/images/auth/join_logo1_back.png"/>">
		</div>
		
		<form action="${pageContext.request.contextPath}/member/join" id="join_frm" class="join_frm" method="post">
			<div class="email_box">
				<label for="join_email">이메일</label>
				<input type="text" id="join_email" class="join_email" name="memberEmail" placeholder="이메일을 입력해주세요." value="${member.memberEail}" onchange = "javascript:checkEmail();">
				<span class="id_ok">사용 가능한 이메일입니다.</span>
				<span class="id_already">사용 중인 이메일입니다.</span>
				<span class="id_not_email">이메일 형식으로 작성바랍니다.</span>
			</div>

			<div class="passwd_box">
				<label for="join_password">비밀번호</label>
				<input type="password" id="join_password" class="join_password" name="memberPasswd" placeholder="사용할 비밀번호를 입력해주세요." value="${member.memberPasswd}">
			
				<input type="password" id="join_repassword" class="join_repassword" placeholder="입력한 비밀번호를 확인해주세요." value="${member.memberPasswd}">
				<span class="span">비밀번호는 영문자,숫자,특수문자가 포함된 6~20 범위의 문자로 작성해주세요.</span>
				
			</div>

			<div class="nickname_box">
				<label for="join_nickname">닉네임</label>
				<input type="text" id="join_nickname" class="join_nickname" name="memberNick" placeholder="닉네임을 입력해주세요." value="${member.memberNick}" onchange="javascript:checkNick();">
				<span class="nick_ok">최고로 멋진 닉네임입니다.</span>
				<span class="nick_already">사용 중인 닉네임입니다.</span>
			</div>

			<div class="phon_box">
				<label for="join_phon">전화번호</label>
				<input type="text" id="join_phon" class="join_phon" name="memberPhone" placeholder="-없이 입력해주세요." value="${member.memberPhone}" onchange="javascript:checkPhone();">
				<span class="phone_already">이미 가입되어있는 핸드폰 번호입니다.</span>
			</div>
			
			<div class="btns">
				<input type="button" id="join_sbmt_btn" value="회원가입" >
			</div>		
		</form>
	</div>
	
	<!-- 알런트 창으로 했는데 고쳐봄  -->
	<script type="text/javascript">
		$("#join_email").focus();
		//var checkEmail = false;
		function emailCheckFn(email) {
			var emailReg=/^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
			return emailReg.test(email);
		}
		
		$("#join_sbmt_btn").click(function() {
			

			if($("#join_email").val()=="") {
				alert("이메일을 입력해주세요.");
				$("#join_email").focus();
				return;
			} else if(!emailCheckFn($("#join_email").val())) {
				alert("이메일을 형식에 맞게 입력해주세요.");
				$("#join_email").focus();
				return;
			}

			var passwdReg=/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{6,20}$/g;
			if($("#join_password").val()=="") {
				alert("비밀번호를 입력해주세요.");
				$("#join_password").focus();
				return;
			} else if(!passwdReg.test($("#join_password").val())) {
				alert("비밀번호를 형식에 맞게 입력해 주세요.");
				$("#join_password").focus();
				return;
			} 
			
			if($("#join_repassword").val()=="") {
				alert("비밀번호를 확인을 입력해주세요.");
				$("#join_repassword").focus();
				return;
			} else if($("#join_password").val()!=$("#join_repassword").val()) {
				alert("입력한 비밀번호와 비밀번호 확인이 맞지않습니다.");
				$("#join_repassword").focus();
				return;
			}
			
			if($("#join_nickname").val()=="") {
				$("#join_nickname").focus();
				alert("닉네임을 입력해주세요.");
				return;
			}
			
			var phoneReg = /01[016789][^0][0-9]{2,3}[0-9]{3,4}$/g;
			if($("#join_phon").val()=="") {
				$("#join_phon").focus();
				alert("전화번호를 입력해주세요.");
				return;
			} else if(!phoneReg.test($("#join_phon").val())) {
				alert("전화번호를 -없이 입력해주세요.");
				$("#join_phon").focus();
				return;
			} 
				
			$("#join_frm").submit();
			alert("회원가입이 되었습니다. 로그인 해주세요.");
																	
		});
	
		 function checkEmail(){
			 //이메일 형태인 경우에만 ajax 호출하도록 처리.
			 if($("#join_email").val() == '' || !emailCheckFn($("#join_email").val())) {
                 $('.id_ok').css("display","none"); 
                 $('.id_already').css("display", "none");
                 $('.id_not_email').css("display", "inline-block");
				 return;
			 }
			 
			 var email=$("#join_email").val();
		        $.ajax({
		        	type: "POST",
		  			url: "${pageContext.request.contextPath}/member/emailCheck",
		  			
		  			data: email,
		  			contentType: "application/json",
		  			dataType: "text",
		  			success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
		                if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
		                    $('.id_ok').css("display","inline-block"); 
		                    $('.id_already').css("display", "none");
		                    $('.id_not_email').css("display", "none");
		                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
		                    $('.id_already').css("display","inline-block");
		                    $('.id_ok').css("display", "none");
		                    $('.id_not_email').css("display", "none");
		                }
		            },
		            error:function(){
		                alert("에러입니다");
		            }
		        });
		        };
		  
		  function checkNick() {
		 	 var nick=$("#join_nickname").val();  
		 	 if(nick=="") {
                 $('.nick_ok').css("display","none"); 
                 $('.nick_already').css("display", "none");
		 		 return ;
		 	 }
			  $.ajax({
		        	type: "POST",
		  			url: "${pageContext.request.contextPath}/member/nickCheck",
		  			
		  			data: nick,
		  			contentType: "application/json",
		  			dataType: "text",
		  			success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
		                if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
		                    $('.nick_ok').css("display","inline-block"); 
		                    $('.nick_already').css("display", "none");
		                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
		                    $('.nick_already').css("display","inline-block");
		                    $('.nick_ok').css("display", "none");
		                }
		            },
		            error:function() {
		                alert("에러입니다");
		            }
		        });
		};
		
		function checkPhone() {
		 	 var phone=$("#join_phon").val();  
		 	 if(phone=="") {
                $('.phone_already').css("display", "none");
		 		 return ;
		 	 }
			  $.ajax({
		        	type: "POST",
		  			url: "${pageContext.request.contextPath}/member/phoneCheck",
		  			
		  			data: phone,
		  			contentType: "application/json",
		  			dataType: "text",
		  			success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
		                if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
		                    $('.phone_already').css("display", "none");
		                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
		                    $('.phone_already').css("display","inline-block");
		                }
		            },
		            error:function() {
		                alert("에러입니다");
		            }
		        });
		};
		
	    
	</script>
</body>
</html>