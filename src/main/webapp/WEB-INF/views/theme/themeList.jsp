<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<meta charset="utf-8">
<style type="text/css">
@import url("https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css");

body{
	font-family: "nanumbarungothic";
	margin: 0px;
}
#slide{
	background-color: black;
	height: 800px;
	display: none;
}

#selectTheme{
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

.locBox{
	display: inline-block;
	background-color: white;
	margin-bottom: 10px;
	width : 100%;
	height: 40px;
}

.genreBox{
	display: inline-block;
	background-color: white;
	margin-bottom: 10px;
	width : 100%;
	height: 160px;
}

.difficultyBox{
	display: inline-block;
	background-color: white;
	margin-bottom: 5px;
	margin-right: 10px;
	width : 50%;
	height: 40px;
}

.activityBox{
	display: inline-block;
	background-color: white;
	margin-bottom: 5px;
	width : 45%;
	height: 40px;
}

.mensCountBox{
	display: inline-block;
	background-color: white;
	margin-bottom: 10px;
	width : 100%;
	height: 40px;
}

#titleAndSearch {
	width: 100%;
	height: 40px;
	margin-left: auto;
	margin-right: auto;
}

#title{
	float: left;
    font-size: 35px;
    font-weight: bold;
    margin-bottom: 5px;
}

#searchTheme{
	float: right;
    width: 27%;
    height: 30px;
    margin-top: 4px;
    border-color: grey;
}

#searchTheme input{
	text-align: right;
    width: 100%;
    font-size: 15px;
    height: 30px;
}

.clear{
	clear: both;
}

#selectTheme ul{
	margin: 0px;
}

#selectTheme ul li{
	float : left;
	list-style: none;
}

.locBox .select.selectOne, .genreBox .select.selectOne, .mensCountBox .select.selectOne{
	background: transparent;
    width: 90px;
    height: 40px;
}

.locBox .select .select_inner, .genreBox .select .select_inner, .mensCountBox .select .select_inner{
	width: 80px;
    height: 30px;
    display: inline-block;
    border-radius: 2.5px;
    text-align: center;
    margin: 5px;
    font-size: 17px;
    font-weight: 600;
    cursor: pointer;
    padding-top: 5px;
}

.difficultyBox .select.selectOne{
	background: transparent;
    width: 44px;
    height: 40px;
}

.difficultyBox .select .select_inner{
	width: 34px;
    height: 30px;
    display: inline-block;
    border-radius: 2.5px;
    text-align: center;
    margin: 5px;
    font-size: 17px;
    font-weight: 600;
    cursor: pointer;
    padding-top: 5px;
}

.activityBox .select.selectOne{
	background: transparent;
    width: 64px;
    height: 40px;
}

.activityBox .select .select_inner{
	width: 54px;
    height: 30px;
    display: inline-block;
    border-radius: 2.5px;
    text-align: center;
    margin: 5px;
    font-size: 17px;
    font-weight: 600;
    cursor: pointer;
    padding-top: 5px;
}

.bar{
	width : 12px;
	margin-top: 11px;
	color: grey;
    opacity: 35%;
}

.select .select_inner:hover{
	background-color: orange;
}

.select .select_inner.active{
	background-color: orange;
}

.cateTitle{
	float: left;
	width: 15%;
    font-size: 22px;
    font-weight: 500;
    color: grey;
    opacity: 70%;
    padding-top: 8px;
    padding-left: 8px;
}

#cateList{
	height: 100%;
	width: 83%;
	float: left;
}

.themes{
	display: inline-block;
    width: 33%;
    height: 350px;
}

#themeList{
	padding-left: 30px;
}

#searchCateBtn{
	cursor: pointer;
}

.themeListImg{

	width: 90%;
	height: 350px;

}

</style>

<div id="slide">
	<img src="images/theme/themeAd.png" width="1920px" height="800px">
</div>
<div id="selectTheme">
	<div id="fix">
		<div id="titleAndSearch">
			<div id="title">
			방탈출 테마
			</div>
			<div id="searchTheme">
			<input type="text" name="searchTheme" id="searchTheme">
			</div>
		</div>
		<div class="clear"></div>
		<div id="location" class="locBox">
			<div class="cateTitle">
				지역
			</div>
			<div id="cateList">
				<ul>
					<li class="select selectOne">
						<span class="loc_select select_inner active" data-loc="전체">전체</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="loc_select select_inner" data-loc="홍대">홍대</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="loc_select select_inner" data-loc="강남">강남</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="loc_select select_inner" data-loc="건대">건대</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="loc_select select_inner" data-loc="신촌">신촌</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="loc_select select_inner" data-loc="대학로">대학로</span>
					</li>
					<li class="bar">│</li>
				</ul>
			</div>
		</div>
		<div class="clear"></div>
		<div id="genre" class="genreBox">
			<div class="cateTitle">
				장르
			</div>
			<div id="cateList">
				<ul>
					<li class="select selectOne">
						<span class="genre_select select_inner active" data-genre="전체">전체</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="공포">공포</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="스릴러">스릴러</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="판타지">판타지</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="동화">동화</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="어드벤처">어드벤처</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="코믹">코믹</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="게임">게임</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="SF">SF</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="미스터리">미스터리</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="추리">추리</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="역사">역사</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="로맨스">로맨스</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="탈출">탈출</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="범죄">범죄</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="수사">수사</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="드라마">드라마</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="잠입">잠입</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="모험">모험</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="음악">음악</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="코미디">코미디</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="감성">감성</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="아케이드">아케이드</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="야외방탈출">야외방탈출</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="genre_select select_inner" data-genre="?">?</span>
					</li>
					<li class="bar">│</li>
				</ul>
			</div>
		</div>
		<div class="clear"></div>
		<div id="difficulty" class="difficultyBox">
			<div class="cateTitle">
				난이도
			</div>
			<div id="cateList">
				<ul>
					<li class="select selectOne">
						<span class="difficulty_select select_inner active" data-difficulty="1">1</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="difficulty_select select_inner" data-difficulty="2">2</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="difficulty_select select_inner" data-difficulty="3">3</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="difficulty_select select_inner" data-difficulty="4">4</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="difficulty_select select_inner" data-difficulty="5">5</span>
					</li>
				</ul>
			</div>
		</div>
		<div id="activity" class="activityBox">
			<div class="cateTitle">
				활동성
			</div>
			<div id="cateList">
				<ul>
					<li class="select selectOne">
						<span class="activity_select select_inner active" data-activity="낮음">낮음</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="activity_select select_inner" data-activity="보통">보통</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="activity_select select_inner" data-activity="높음">높음</span>
					</li>
				</ul>
			</div>
		</div>
		<div class="clear"></div>
		<div id="mensCount" class="mensCountBox">
			<div class="cateTitle">
				추천인원
			</div>
			<div id="cateList">
				<ul>
					<li class="select selectOne">
						<span class="mensCount_select select_inner active" data-count="2~">2명</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="mensCount_select select_inner" data-count="3~">3명</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="mensCount_select select_inner" data-count="4~">4명</span>
					</li>
					<li class="bar">│</li>
					<li class="select selectOne">
						<span class="mensCount_select select_inner" data-count="5~">5명 이상</span>
					</li>
				</ul>
			</div>
		</div>
		
		<div id="searchCateBtn">
		검색하기
		</div>
	
		<div id="themeList">

			<c:forEach var="themeList" items="${themeList }">
			<div class="themes">
				<a href="${pageContext.request.contextPath}/theme/theme_detail/${themeList.themeNo }">
					<img class="themeListImg" src="${pageContext.request.contextPath}/images/theme/detail/theme_img/${themeList.themeImageLoc}">
				</a>
				<p><a href="${pageContext.request.contextPath}/theme/theme_detail/${themeList.themeNo }" style="text-decoration: none;">
					${themeList.themeName }
				</a></p>
			<p>${themeList.themeDifficult }</p>
			<p>${themeList.themeRecommend }</p>
			<p>${themeList.themeCname }</p>
			</div>
			</c:forEach>

			
		</div>
	</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<script>

var $themeCate_loc = new Array();
var $themeCate_genre = new Array();
var $themeCate_difficult = new Array();
var $themeCate_activity = new Array();
var $themeCate_recommend = new Array();

$(".loc_select").click(function() {
	
	if($(this).hasClass("active")!=true){
		$(".loc_select").removeClass("active");
		$(this).addClass("active");
	}
	
});

$(".genre_select").click(function() {
	
	if($(".genre_select.active").length==1){
		if ($(this).hasClass("active")==true) {
			return false;
		}
	}	
	
	if($(this).hasClass("active")!=true){
		$(this).addClass("active");
		
		if($(this).data("genre")=="전체") {
			
			$(".genre_select").each(function() {
				if($(this).data("genre")!="전체"){
					$(this).removeClass("active");
				}
			});
		}else {
			$(".genre_select").each(function() {
				if($(this).data("genre")=="전체"){
					$(this).removeClass("active");
				}
			});
		}
	}else {
		$(this).removeClass("active");
	}
	
	
	
});

$(".difficulty_select").click(function() {
	
	if($(".difficulty_select.active").length==1){
		if ($(this).hasClass("active")==true) {
			return false;
		}
	}	
	
	if($(this).hasClass("active")!=true){
		$(this).addClass("active");
	}else {
		$(this).removeClass("active");
	}
	
	
	
});

$(".activity_select").click(function() {
	
	if($(".activity_select.active").length==1){
		if ($(this).hasClass("active")==true) {
			return false;
		}
	}	
	
	if($(this).hasClass("active")!=true){
		$(this).addClass("active");
	}else {
		$(this).removeClass("active");
	}
	
	
	
});

$(".mensCount_select").click(function() {
	
	if($(".mensCount_select.active").length==1){
		if ($(this).hasClass("active")==true) {
			return false;
		}
	}	
	
	if($(this).hasClass("active")!=true){
		$(this).addClass("active");
	}else {
		$(this).removeClass("active");
	}
	
	
});
	

$("#searchCateBtn").click(function() {
	
	$themeCate_loc.length=0;
	$themeCate_genre.length=0;
	$themeCate_difficult.length=0;
	$themeCate_activity.length=0;
	$themeCate_recommend.length=0;
	
	$(".loc_select.active").each(function(){
		$themeCate_loc.push($(this).data("loc"));
		
	});
	
	$(".genre_select.active").each(function(){
		$themeCate_genre.push($(this).data("genre"));
		
	});
	
	$(".difficulty_select.active").each(function(){
		$themeCate_difficult.push($(this).data("difficulty"));
		
	});
	
	$(".activity_select.active").each(function(){
		$themeCate_activity.push($(this).data("activity"));
		
	});
	
	$(".mensCount_select.active").each(function(){
		$themeCate_recommend.push($(this).data("count"));
		
	});
	
	if($themeCate_loc[0]=="전체"){
		$themeCate_loc.length=0;
		$themeCate_loc.push("홍대","강남","건대","신촌","대학로");
		
	}
	
	if($themeCate_genre[0]=="전체"){
		$themeCate_genre.length=0;
		$themeCate_genre.push("공포","스릴러","판타지","동화","어드벤처","코믹","게임","SF","미스터리","추리","역사","로맨스","탈출","범죄","수사","드라마","잠입","모험","음악","코미디","감성","아케이드","야외방탈출","?");
		
	}
	
	//alert($themeCate_loc);
	//alert($themeCate_genre);
	
	
	$.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/theme/themeCateSearch",
		data : JSON.stringify({"themeCate_loc": $themeCate_loc,
								"themeCate_genre": $themeCate_genre,
								"themeCate_difficult": $themeCate_difficult,
								"themeCate_activity": $themeCate_activity,
								"themeCate_recommend": $themeCate_recommend}),
		contentType : "application/json",
		dataType: "json",
		
		success: function(returnMap){
			//alert(returnMap);
			
			var html="";
			
			if(returnMap.themeCateList.length==0){
				html+="<p>검색된 카페 정보가 없습니다.</p>"
				$("#themeList").html(html);
				return;
			}
			
			$(returnMap.themeCateList).each(function(){
				html+= '<div class="themes">'
				html+= '<img class="themeListImg" src="${pageContext.request.contextPath}/images/theme/detail/theme_img/'+this.themeImageLoc+'">'
				html+= '<p>'+this.themeName+'</p>'
				html+= '<p>'+this.themeDifficult+'</p>'
				html+= '<p>'+this.themeRecommend+'</p>'
				html+= '<p>'+this.themeCname+'</p>'
				html+= '</div>'
			});
			$("#themeList").html(html);
			
			$themeCate_loc.length=0;
			$themeCate_genre.length=0;
			$themeCate_difficult.length=0;
			$themeCate_activity.length=0;
			$themeCate_recommend.length=0;
		},
		
		error:function(xhr){
	        alert("에러 코드 = " + xhr.status);
	        
	        $themeCate_loc.length=0;
			$themeCate_genre.length=0;
			$themeCate_difficult.length=0;
			$themeCate_activity.length=0;
			$themeCate_recommend.length=0;
	    }
		
	});
	
});


</script>
