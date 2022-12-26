<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<head>
<meta charset="utf-8">

<!-- IE 대응 -->

<link href="${pageContext.request.contextPath}/css/fonte9d4.css?ver=" rel="stylesheet" />

<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>

<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css"/>


<link href="${pageContext.request.contextPath}/css/reset.css?ver=171755" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/style.css?ver=171755" rel="stylesheet" />

<link href="${pageContext.request.contextPath}/css/common.css?ver=171755" rel="stylesheet" />

<%-- <link href="${pageContext.request.contextPath}/css/header.css?ver=171755" rel="stylesheet" /> --%>
<link href="${pageContext.request.contextPath}/css/footer.css?ver=171755" rel="stylesheet" />

<link href="${pageContext.request.contextPath}/css/sub_banner.css?ver=171755" rel="stylesheet" />


<link href="${pageContext.request.contextPath}/css/store.css?ver=171755" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/store_banner.css?ver=171755" rel="stylesheet" />



<!--jquery UI libaray -->


<!-- 검색 결과 출력 list css -->
<style type="text/css">
.location, .theme_num {
	width : 140px;
	text-align: center;
	padding : 10px;
}

.location img, .theme_num img {
	width : 15px;
}

table {
	border: 2px solid #e6e6e6;
    border-radius: 2px;
	border-collapse: collapse !important;
	float: left;
	width: 31.2%;
	background-color : white;
}

td {
	border: 2px solid #e6e6e6;
    border-radius: 2px;
	border-collapse: collapse !important;
	padding: 3px;
}

.info_detail {
	padding : 10px;
}

.info_detail span {
	margin : 10px;
}

#info_detail_name {
	font-size: 17px;
	padding-bottom: 5px;
}

.info_detail_ {
	font-size: 15px;
}

.go_site {
	width: 100%;
	height: 100%;
	border : none;
	cursor: pointer;
	padding : 7px !important;
	background-color: white;
}

.go_site:hover {
	background-color: #e6e6e6;
}

#search_keyword_btn {
	cursor: pointer;
	height: 100%;
}

#search_keyword_btn img {
	width : 16px;
}

.store.main .container .container_inner.section.section_search .search .search_channel.channel_2 {
    position: relative;
    width: 100%;
    height: 35px !important;
    box-sizing: border-box;
    border: 1px solid #e5e5e5;
    background-color: #ffffff;
}

#company_list_row  table {
	margin : 10px;
}

.store.main .container .container_inner.section.section_result {
    width: 100%;
    padding: 20px !important;
    box-sizing: border-box;
    background-color: #f0f0f0;
}

#nosearchcafe {
	display: none;
	text-align:center;
}


/* header CSS */
.header .header_wrap .logo a img {
    display: inline-block;
    position: inherit !important;
    bottom: 0;
    top: 0;
    width: 76%;
    margin-top: 3.5px !important;
    margin-bottom: auto;
}



</style>

	<style>
		.store.main .container .container_inner.section.section_result .row .col.normal_border { border: 7px solid #fff;  }

		.store.main .container .container_inner.section.section_result .row .col.premium_border { border: 7px solid #ffde45;  }
		
		.store.main .container .container_inner.section.section_result .row .col .ratio .ratio_inner .content .premium { position: absolute;top: 0;right: 0;width: 30%; }

    	.store.main .container .container_inner.section.section_result .row .col .m_ratio .m_ratio_inner .content .premium { position: absolute;top: 0;right: 0;width: 30%; }

    	.store.main .container .container_inner.section.section_result .row .col .ratio .ratio_inner .content .premium img { width:100%; }

    	.store.main .container .container_inner.section.section_result .row .col .m_ratio .m_ratio_inner .content .premium img { width:100%; }
	</style>

<title>전국방탈출 - 방탈출카페의 모든 것</title>
</head>
<body class="store main">

	<div class="container">
	
			<!-- 검색 부분 -->	
			<div class="container_inner section section_search">
				<div class="fixing_wid fixing_wid_960">
					<!-- <script async src="../../pagead2.googlesyndication.com/pagead/js/f.txt"></script> -->
					<div id="google_ad_wrap" class="google_ad_wrap" style="position:absolute;left:-215px;">
						<ins class="adsbygoogle"
						     style="display:inline-block;width:200px;height:600px;"
						     data-ad-client="ca-pub-6757436006436446"
						     data-ad-slot="4568050729"></ins>
					</div>


					<!-- 방탈출 카페 지점 text image -->
					<div class="title">
						<img src="${pageContext.request.contextPath}/images/store/title.jpg" alt="" />
					</div>
					<br>
					
					<div class="search">
						<div class="search_channel channel_1">
							<!-- 평점 높은 순 / 리뷰 많은 순 정렬 -->
							<!-- 
							<div class="search_type">
								<div class="type type_1">
									<span class="type_click_event" data-type="grade">평점 높은 순</span>
								</div>

								<div class="type type_2">
									<span class="type_click_event" data-type="review">리뷰 많은 순</span>
								</div>
							</div> -->

							<div class="clearfix"></div>

							<!-- 검색창 -->
							<div class="search_input">
								<input type="text" id="search_keyword" name="search_keyword" class="" />
								<button id="search_keyword_btn" type="button">
									<img alt=""
									src="${pageContext.request.contextPath}/images/store/search_button.png">
								</button>
							</div>
						</div>

						<div class="clearfix"></div>

						<div class="search_channel channel_2">
							<div id="loc_reveal" class="tag">
								<span>지역</span>
							</div>

							<div id="loc" class="loc">
								<ul>
									<li class="value">
										<span class="loc_value" data-loc="전국">전체</span>
									</li>
									<li class="pipe">
										<span class="pipe">|</span>
									</li>
									<li class="value">
										<span class="loc_value" data-loc="홍대">홍대</span>
									</li>
									<li class="pipe">
										<span class="pipe">|</span>
									</li>
									<li class="value">
										<span class="loc_value" data-loc="강남">강남</span>
									</li>
									<li class="pipe">
										<span class="pipe">|</span>
									</li>
									<li class="value">
										<span class="loc_value" data-loc="건대">건대</span>
									</li>
									<li class="pipe">
										<span class="pipe">|</span>
									</li>
									<li class="value">
										<span class="loc_value" data-loc="신촌">신촌</span>
									</li>
									<li class="pipe">
										<span class="pipe">|</span>
									</li>
									<li class="value">
										<span class="loc_value" data-loc="대학로">대학로</span>
									</li>
									<li class="pipe">
										<span class="pipe">|</span>
									</li>
								
									
									<!-- <li class="pipe">
										<span class="pipe"></span>
									</li>
									<li class="value" style="cursor:none;">
										<span class="" style="cursor:none;"></span>
									</li> -->
								</ul>
							</div>
						</div>

						<div class="clearfix"></div>

						<div class="search_channel channel_3">
							<div class="search_btn_box">
								<button type="button" id="search_btn" style="cursor:pointer;">검색</button>
								<!-- <a href="sesame/theme/theme_detail"><button type="button" style="cursor:pointer;">내꺼 테마 상세페이지</button></a> -->
							</div>
						</div>

						<div class="clearfix"></div>
					</div>
				</div>
			</div>

			<div class="clearfix"></div>

			
			

			<!-- 검색 결과 출력되는 부분 -->
			<div class="container_inner section section_result">
				<div class="fixing_wid fixing_wid_960">
					<div id="nosearchcafe">
						<p>검색된 카페 정보가 없습니다</p>
					</div>
					<div id="cafeKeywordSearchDiv" class="row">
					</div>
					
					
					<div id="company_list_row" class="row">
							<c:choose>
								<c:when test="${empty(cafeList)} ">
								<table>
									<tr align="center">
										<td colspan="2">검색된 카페 정보가 없습니다.</td>
									</tr>
								</table>
								</c:when>
								<c:otherwise>
									<c:forEach var="cafe" items="${cafeList }">
										<table>
										<tr>
											<td class="location"><img alt=""
												src="${pageContext.request.contextPath}/images/store/location.png">&nbsp;
												${cafe.cafeLoc }</td>
											<%-- <td class="theme_num"><img alt=""
												src="${pageContext.request.contextPath}/images/store/home.png">&nbsp;
												5개 테마</td> --%>
											<td style="padding:0px;">
												<a href="${cafe.cafeDomain }" target="_blank" style="">
												<button class="go_site">사이트 바로가기</button>					
												</a>
											</td>
										</tr>
										<tr>
											<td colspan="2" style="height: 125px !important;">
												<div class="info_detail">
													<span id="info_detail_name"><b>${cafe.cafeName }</b></span><br><br> <span>주소
														: ${cafe.cafeAddress }</span><br> <span>영업시간 : ${cafe.cafeBhours }</span><br>
													<span>Tel : ${cafe.cafeTel }</span>
												</div>
											</td>
										</tr>
										<%-- <tr>
											<td colspan="2" style="padding:0px;">
												<a href="${cafe.cafeDomain }" target="_blank" style="">
												<button class="go_site">사이트 바로가기</button>					
												</a>
											</td>
										</tr> --%>
										</table>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						
					</div>

					<div id="company_list_more" class="company_list_more" style="margin-top: 50px; margin-bottom: 50px; padding-right: 40px;">
						<div id="company_list_more_inner" class="company_list_more_inner">
							<button id="company_list_more_btn" type="button" style="width: 110px; height: 40px;">more</button>
						</div>
					</div>
				
				</div>
			</div>

	</div>

	<!--  -->
	<script>
		function isEmpty(value) { 
            if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
                return true 
            } else { 
                return false 
            } 
        }

		$('document').ready(function() {

			//함수 deley 막기 변수
			var $timer = null;

			//more 버튼 시 현재 검색 타임 분별 변수
			var $current_search_type = "";

			//more 버튼 시 더 출력해야할(+24개) 테마(필터로 검색된)를 가져오기 위한 변수들 
			var $company_list_typing = "";
			var $company_list_typing_length = 0;

			//more 버튼 시 더 출력해야할(+24개) 테마(타이핑으로 검색된)를 가져오기 위한 변수들 
			var $company_list_filter = "";
			var $company_list_filter_length = 0;

			//more 버튼 시 $theme_list_xxx 변수에서 몇번째 부터 몇번째 까지 출력할지를 위한 변수 들
			var $more_start_num = 0;	
			var $more_end_num = 24;


			/***** 타이핑 검색 시 타이핑된 검색어를 넣을 변수 ****/
			var $search_keyword = "";
			

			/***** 필터 검색 시 필터값을 넣을 변수 ****/
			var $search_select_type = "";
			var $search_select_store_option = new Array();
			var $search_select_loc = new Array();


			//페이지가 로드 되었을 시 선택된 상태로 설정 - 검색 유형
			$('.type_1 .type_click_event').addClass('active');
			$('.type_click_event.active').each(function() {
				$search_select_type = $(this).data('loc');
			});

			//페이지가 로드 되었을 시 선택된 상태로 설정 - 지역
			$('.loc_value').each(function() {
				if($(this).data('loc') == "전국" ) {
					$(this).addClass('active');
				} else {
					$(this).removeClass('active');
				}

				//이후 선택한 값만 배열에 담기
				$search_select_loc.length = 0;
				$('.loc_value.active').each(function() {
					$search_select_loc.push($(this).data('loc'));
					
				});
			});

			// 검색창 타이핑 검색
			/* search_keyword */
			$('#search_keyword_btn').click(function() {
				$search_keyword = $('#search_keyword').val();
			});


			$('.loc_value').click(function() { //지역 선택 버튼

				// if($timer !== null) {
				// 	clearTimeout($timer);
				// }

				if($(this).hasClass("active") !== true) {
					
					//한개 만 선택 가능
					//$('.loc_value').removeClass("active");
					$(this).addClass("active");

					//전국 vs 서울~대전 버튼의 대한 버튼 이벤트 설정
					if($(this).data("loc") == "전국") {

						//전국을 선택할 시에는 다른 지역들의 선택 해제
						$('.loc_value').each(function() {
							if($(this).data("loc") != "전국") {
								$(this).removeClass('active');
							} 
						});
					} else { 

						//전국을 선택되어 있는 상태에서 다른 지역들의 선택시 전국 버튼 해제
						$('.loc_value').each(function() {
							if($(this).data('loc') == "전국") {
								$(this).removeClass('active');
							} 
						});
					}

				} else {

					//모두 해제 막기
					var $num_of_btn_click = 0;
					$(".loc_value.active").each(function() {
						$num_of_btn_click++;
					});

					if($num_of_btn_click == 1) {
						return false;
					} else {
						$(this).removeClass("active");
					}
				}

				//선택 이후 선택한 값만 배열에 담기
				$search_select_loc.length = 0;
				$('.loc_value.active').each(function() {
					$search_select_loc.push($(this).data('loc'));
				});

				//console.log($search_select_loc);

				//검색요청
				// if(isEmpty($("#search_keyword").val()) !== true) {

				// 	//검색어 가져오기
				// 	var $search_keyword = $("#search_keyword").val();
				// 	//검색어 앞뒤 공백 제거
				// 	var $search_keyword = $search_keyword.trim();

				// 	$timer = setTimeout(function() {
				// 		company_typing_search($search_keyword);
				// 	},600);
				// } else {
				// 	$timer = setTimeout(function() {
				// 		company_filter_search();
				// 	},600);
				// }
			});



			/***** 타이핑 검색 *****/
			$('#search_keyword_btn').click(function() {
				
				// $("#company_list_row").hide();
				
				var $search_keyword = $("#search_keyword").val();
					console.log($search_keyword );
				//검색어 앞뒤 공백 제거
				var $search_keyword = $search_keyword.trim();
	
				$.ajax({
					type: "POST",
			        url: "${pageContext.request.contextPath}/cafe/cafe_keyword_search",
			        data: JSON.stringify({ "search_keyword" : $search_keyword}),
			      	contentType : "application/json",
			        dataType: "json",
			        success: function(data) {
			        	//console.log(data.cafeList);
			        	
			        	var html="";
			        	if(data.cafeList.length==0) {
			        		$("#cafeKeywordSearchDiv").hide();
			        		$("#nosearchcafe").show();
			        		$("#company_list_row").html(html);
			        		html+="<p>검색된 카페 정보가 없습니다</p>";
			        		return;
			        	}
			        	
			        	
			        	$(data.cafeList).each(function () {
			        	html+="<table>";
			        	html+="<tr>";
						html+="<td class='location'><img src='${pageContext.request.contextPath}/images/store/location.png'>&nbsp;"+this.cafeLoc+"</td>";
						
						html+="<td style='padding:0px;'>";
						html+="<a href="+this.cafeDomain+" target='_blank'>";
						html+="<button class='go_site'>사이트 바로가기</button>";
						html+="</a></td>";
						
						
						html+="</tr>";
			        	html+="<tr>";
						
			        	html+="<td colspan='2' style='height: 125px !important;'>";
			        	html+="<div class='info_detail'>";
			        	html+="<span id='info_detail_name'><b>"+this.cafeName+"</b></span>";
			        	html+="<br><br> <span>주소 : "+this.cafeAddress+"</span><br>";
			        	html+="<span>영업시간 : "+this.cafeBhours+"</span><br>";
			        	html+="<span>Tel : "+this.cafeTel+"</span>";
			        	html+="</div>";
			        	html+="</td>";
			        	
			        	html+="</tr>";
						html+="</table>";
			        	
						}); 
			        	$("#company_list_row").html(html);
			        	$("#nosearchcafe").hide();
			        	//$("#cafeKeywordSearchDiv").show();
			        	
			        },
			        error:function(xhr){
			        	alert("에러 코드 = " + xhr.status);
			        }
			       });
				//company_typing_search($search_keyword);
				
				
				
			});

			$("#search_keyword").keydown(function(key) {
				if (key.keyCode == 13) {
					company_typing_search($(this).val());
				}
			});

			
			//처음 접속 시
			//company_filter_search();

			$("#company_list_more_btn").click(function() {
				company_list_more();
			});

			$("#search_btn").click(function() {
				
				//var $search_select_loc = $("#search_select_loc").val();
				//console.log($search_select_loc );
				
				$.ajax({
					type: "POST",
			        url: "${pageContext.request.contextPath}/cafe/cafe_loc_search",
			        data: 
			        	JSON.stringify({ "search_select_loc" : $search_select_loc}),
			        
			      	contentType : "application/json",
			        dataType: "json",
			        
			        success: function(data) {
			        	//console.log(data.cafeList);

			        	var html="";
			        	if(data.cafeList.length==0) {
			        		$("#cafeKeywordSearchDiv").hide();
			        		$("#nosearchcafe").show();
			        		$("#company_list_row").html(html);
			        		html+="<p>검색된 카페 정보가 없습니다</p>";
			        		return;
			        	}
			        	
			        	
			        	$(data.cafeList).each(function () {
			        	html+="<table>";
			        	html+="<tr>";
						html+="<td class='location'><img src='${pageContext.request.contextPath}/images/store/location.png'>&nbsp;"+this.cafeLoc+"</td>";
						
						html+="<td style='padding:0px;'>";
						html+="<a href="+this.cafeDomain+" target='_blank'>";
						html+="<button class='go_site'>사이트 바로가기</button>";
						html+="</a></td>";
						
						
						html+="</tr>";
			        	html+="<tr>";
						
			        	html+="<td colspan='2' style='height: 125px !important;'>";
			        	html+="<div class='info_detail'>";
			        	html+="<span id='info_detail_name'><b>"+this.cafeName+"</b></span>";
			        	html+="<br><br> <span>주소 : "+this.cafeAddress+"</span><br>";
			        	html+="<span>영업시간 : "+this.cafeBhours+"</span><br>";
			        	html+="<span>Tel : "+this.cafeTel+"</span>";
			        	html+="</div>";
			        	html+="</td>";
			        	
			        	html+="</tr>";
						html+="</table>";
			        	
						}); 
			        	$("#company_list_row").html(html);
			        	$("#nosearchcafe").hide();
			        	//$("#cafeKeywordSearchDiv").show();
			        	
			        },
			        error:function(xhr){
			        	alert("에러 코드 = " + xhr.status);
			        }
			       });
				//company_typing_search($search_keyword);
								
				
			});	
			
			
			
		});
	</script>
	
	
	<!--  -->


</body>

</html>