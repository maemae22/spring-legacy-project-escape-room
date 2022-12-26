<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#admin {
	
}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src='${pageContext.request.contextPath}/js/TweenMax.min.js'></script>
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/css/header.css"/>'>
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/css/bootstrap.css"/>'>
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/css/login_layer.css"/>'>
</head>
<body>
<div id="login_wrap_back" class="login_wrap_back" style="width:100%;"></div>
    <div id="login_wrap" class="login_wrap">
	<div class="login_layer">
		<div class="login_logo">
			<img src="<c:url value="/images/auth/login_logobig.jpg"/>" alt="" />
		</div>

		<div id="login_frm" class="login_frm" >
			<div class="input_box email_input_box">
				<label>아이디</label>
				<input type="email" id="login_email" class="login_email" name="memberEmail" placeholder="이메일" 
				required oninvalid="this.setCustomValidity('가입 하신 이메일을 입력해주세요.')" 
				oninput="this.setCustomValidity('')"/>
			</div>
					
			<div class="input_box password_input_box">
				<label>비밀번호</label>
				<input type="password" id="login_password" class="login_password" name="memberPasswd"  placeholder="비밀번호" 
				required oninvalid="this.setCustomValidity('비밀번호를 입력해주세요.')" 
				oninput="this.setCustomValidity('')"/>
			</div>

			<div class="btns">
				<button type="button" id="login_sbmt_btn">로그인</button>
			</div>
		</div>
		<hr class="hr" />
		
		<div class="login_box">
		<div class="social_btns">
				<a href="#"><img alt="구글로그인" src="<c:url value="/images/auth/google.jpg"/>" width="48"></a>
				<a href="#"><img alt="카카오로그인" src="<c:url value="/images/auth/cacao.jpg"/>" width="48"></a>
		</div>
		 <div class="memb_info_find">
                <a href="${pageContext.request.contextPath}/member/findEmail">아이디 찾기</a>
                <a href="${pageContext.request.contextPath}/member/findPwView">비밀번호 찾기</a>
                <a href="${pageContext.request.contextPath}/member/agree">회원이 아니세요?</a>
         </div>
         </div>
	</div>
</div>
		

    <script>
        $(document).ready(function () {

            $('.login_layer_open').click(function () {

                var animation = new TimelineLite();
                $("html").css("overflow", "hidden");
                animation.to('#m_main_menu', 0.2, { css: { className: '-=active', display: 'none' }, delay: 0, ease: Linear.easeNone });

                $("body").css("overflow", "hidden");
                $("#login_wrap_back").css("display", "block");
                $("#login_wrap").css("display", "block");
                $(".container").addClass("not_ie");
			    $("#login_wrap_back").addClass("not_ie");
			
			    
			    
            });

            $('.login_layer_close').click(function () {

                $("html").css("overflow", "auto");
                $('body').css("overflow", "auto");
                $("#login_layer_back").css("display", "none");
                $("#login_wrap").css("display", "none");
				$(".container").removeClass("not_ie");
				$("#login_wrap_back").removeClass("not_ie");
				
				
            });

            $('#login_wrap_back').click(function () {

                $("html").css("overflow", "auto");
                $('body').css("overflow", "auto");
                $("#login_wrap_back").css("display", "none");
                $("#login_wrap").css("display", "none");
              	$(".container").removeClass("not_ie");
				$("#login_wrap_back").removeClass("not_ie");
				
			
            });
        });
    </script>
    
     
    <script>
	$("#login_frm").on("keydown",function(key){
    	if(key.keyCode==13) {
    		var email=$("#login_email").val();
       		var password=$("#login_password").val();
      		
       		if(email=="") {
    			alert("이메일을 입력해 주세요.");
    			return;
    		}
    		
    		if(password=="") {
    			alert("비밀번호를 입력해 주세요.");
    			return;
    		}
       		
      		$.ajax({
      			type: "POST",
      			url: "${pageContext.request.contextPath}/member/login_add",
      			
      			data: JSON.stringify({"memberEmail":email, "memberPasswd":password}),
      			contentType: "application/json",
      			dataType: "json",
      			success: function(resultMap) {
      				if(resultMap.result=="fail") {
    					alert(resultMap.errorMessage);
      					
      				} else {
      					alert("로그인 성공");
      					document.location.reload();
      				}
      			},
      			error: function(xhr) {
      				alert("에러코드(login) = "+xhr.status);
      			}
      		});
      		return false;
    		
    	}
    });

     $("#login_sbmt_btn").on('click',function() {
    	 
     	var email=$("#login_email").val();
   		var password=$("#login_password").val();
  		
   		if(email=="") {
			alert("이메일을 입력해 주세요.");
			return;
		}
		
		if(password=="") {
			alert("비밀번호를 입력해 주세요.");
			return;
		}
   		
  		$.ajax({
  			type: "POST",
  			url: "${pageContext.request.contextPath}/member/login_add",
  			
  			data: JSON.stringify({"memberEmail":email, "memberPasswd":password}),
  			contentType: "application/json",
  			dataType: "json",
  			success: function(resultMap) {
  				if(resultMap.result=="fail") {
					alert(resultMap.errorMessage);
  					
  				} else {
  					alert("로그인 성공");
  					document.location.reload();
  				}
  			},
  			error: function(xhr) {
  				alert("에러코드(login) = "+xhr.status);
  			}
  		});
  		return false;
     });
      
    </script>
	
	<div id="m_main_menu" class="m_main_menu">
        <c:choose>
        <c:when test="${empty(loginMember)}">
        <div id="m_main_menu_close_btn" class="m_main_menu_close_btn">
            <a class="m_login login_layer_open" href="javascript:void(0);">
                <img src="<c:url value="/images/header/m_login.png"/>" alt="" />
            </a>
            <a class="m_join" href="#">
                회원이 아니세요?
            </a>
            <img src="<c:url value="/images/header/m_close.png"/>" alt="" />
            </div>
        </c:when>
		<c:otherwise>
            <a class="m_join" href="javascript:void(0);">
                ${loginMember.memberNick}님, 환영합니다.
            </a>
            <a class="m_join" href="#">
              
               <button type="button" onclick="location.href='<c:url value="/member/logout"/>';" >로그아웃</button>
            </a>
            <c:if test="${loginMember.memberStatus==9 }">
				<button type="button" onclick="location.href='<c:url value="/userinfo/write"/>';">@</button>
				
			</c:if>
            <img src="<c:url value="/images/header/m_close.png"/>" alt="" />
		</c:otherwise>	
        </c:choose>
       
		
        <nav>
            <ul>
                <li><a href="#"><span>홈</span></a></li>
                <li><a href="${pageContext.request.contextPath}/cafe"><span>카페</span></a></li>
                <li><a href="${pageContext.request.contextPath}/theme"><span>테마</span></a></li>
                <li><a href="${pageContext.request.contextPath}/reserve"><span>예약</span></a></li>
                <li><a href="${pageContext.request.contextPath}/chat"><span>채팅</span></a></li>
                <li><a href="${pageContext.request.contextPath}/board"><span>커뮤니티</span></a></li>

            </ul>
        </nav>
    </div>
    <header id="header" class="header">
        <div class="header_wrap">
            <h1 class="logo">
                <a href="${pageContext.request.contextPath}/main">
                    <img src='<c:url value="/images/header/logo_version2.png"/>' alt="" />
                </a>
            </h1>

            <nav class="main_menu">
                <ul class="depth1">
                    <li><a href="${pageContext.request.contextPath}/cafe">카페</a></li>
                    <li><a href="${pageContext.request.contextPath}/theme">테마</a></li>
                    <li><a href="${pageContext.request.contextPath}/chat">채팅</a></li>
                    <li><a href="${pageContext.request.contextPath}/reserve">예약</a></li>
                    <li><a href="${pageContext.request.contextPath}/board">커뮤니티</a></li>

                </ul>
            </nav>

            <div class="header_util">
            <c:choose>
        	<c:when test="${empty(loginMember)}">
                <div id="login_btn" class="login">
                    <a class="login_layer_open" href="javascript:void(0);">
                        <img class="login_btn_mouse_leave" src='<c:url value='/images/header/login.png'/>' alt="" />
                        <img class="login_btn_mouse_over" src="<c:url value='/images/header/login_hover.png'/>" alt="" />
                    </a>
                </div>

                <div class="join">
                     <a href="${pageContext.request.contextPath}/member/agree">회원이 아니세요?</a>
                </div>
             </c:when>
			 <c:otherwise>
			 <div class="join">	
				<a class="" href="javascript:void(0);" onclick="location.href='${pageContext.request.contextPath}/mypage';">[ ${loginMember.memberNick} ]님, 환영해요.</a>
           	  <c:if test="${loginMember.memberStatus==9}">
				<a class="join_one" href="javascript:void(0);" onclick="location.href='${pageContext.request.contextPath}/admin';">@</a>
			  </c:if>
           	 </div>	
           		<div id="logout_btn" class="logout">
                    <a class="" href="javascript:void(0);" onclick="location.href='<c:url value="/member/logout"/>';">
                        <img class="logout_btn" src='<c:url value='/images/header/logout.png'/>' alt="" />
                    </a>
                </div>
		    </c:otherwise>	
            </c:choose>
            </div>
        </div>

        <div class="m_header_wrap"> <!-- 화면크기 줄였을 때만 햄버거 보여야됨 display none으로 설정  -->
            <div id="m_main_menu_btn" class="m_main_menu_btn">
                <img src="${pageContext.request.contextPath}/images/header/hamburger.png" alt="" />
            </div>
        </div>

        <script>
            $('#m_main_menu_btn').click(function () {
                var animation = new TimelineLite();

                $('#m_main_menu').show();
                $("html").css("overflow", "hidden");
                animation.to('#m_main_menu', 0.2, { css: { className: '+=active', display: 'block' }, delay: 0, ease: Linear.easeNone });
            });

            $('#m_main_menu_close_btn').click(function () {
                var animation = new TimelineLite();

                $("html").css("overflow", "initial");
                animation.to('#m_main_menu', 0.2, { css: { className: '-=active', display: 'none' }, delay: 0, ease: Linear.easeNone });
            });
        </script>

        <script>
            $('#login_btn').hover(function () {
                $('.login_btn_mouse_leave').hide();
                $('.login_btn_mouse_over').show();
            }, function () {
                $('.login_btn_mouse_leave').show();
                $('.login_btn_mouse_over').hide();
            });

            $('#logout_btn').hover(function () {
                $('.logout_btn_mouse_leave').hide();
                $('.logout_btn_mouse_over').show();
            }, function () {
                $('.logout_btn_mouse_leave').show();
                $('.logout_btn_mouse_over').hide();
            });
        </script>
    </header>
</body>
</html>