<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
	<meta charset="utf-8">

	<!-- 반응형 meta -->
	<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1, user-scalable=yes">

	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<link href="${pageContext.request.contextPath}/css/book.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/css/vanillaCalendar.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/css/sub_banner.css" rel="stylesheet" />
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


	<title>전국방탈출 - 방탈출카페의 모든 것</title>
</head>

<body class="book list">

	<div class="sub_banner">
		<div class="banner_title" style="background-image:url('${pageContext.request.contextPath}/images/reserve/book_sub_banner_back.jpg');">
			<img src="${pageContext.request.contextPath}/images/reserve/book_sub_banner_text.png" alt="" />
		</div>

		<div class="banner_title m" style="background-image:url('${pageContext.request.contextPath}/images/reserve/m_book_sub_banner_back.jpg');"></div>
	</div>
	<div class="book_inner inner_1_depth">
		<div class="book_panel">
			<div class="calender">
				<div id="v-cal">
					<div class="vcal-header">
						<button class="vcal-btn" data-calendar-toggle="previous">
							<svg height="24" version="1.1" viewbox="0 0 24 24" width="24"
								xmlns="http://www.w3.org/2000/svg">
								<path d="M20,11V13H8L13.5,18.5L12.08,19.92L4.16,12L12.08,4.08L13.5,5.5L8,11H20Z"></path>
							</svg>
						</button>

						<div class="vcal-header__label" data-calendar-label="month">
							JULY 1994
						</div>


						<button class="vcal-btn" data-calendar-toggle="next">
							<svg height="24" version="1.1" viewbox="0 0 24 24" width="24"
								xmlns="http://www.w3.org/2000/svg">
								<path d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z">
								</path>
							</svg>
						</button>
					</div>
					<div class="vcal-week">
						<span>Mon</span>
						<span>Tue</span>
						<span>Wed</span>
						<span>Thu</span>
						<span>Fri</span>
						<span>Sat</span>
						<span>Sun</span>
					</div>
					<div class="vcal-body" data-calendar-area="month"></div>
				</div>

				<p class="demo-picked"><span data-calendar-label="picked"></span>
				</p>
			</div>

			<div class="location">
				<div class="loc_header">
					<span>지역</span>
				</div>

				<div class="loc_list">

					<div class="loc seoul" data-loc="서울">
						<span>서울</span>
					</div>

					<div class="loc hongdae" data-loc="홍대">
						<span>홍대</span>
					</div>

					<div class="loc gangman" data-loc="강남">
						<span>강남</span>
					</div>

					<div class="loc gundae" data-loc="건대">
						<span>건대</span>
					</div>

					<div class="loc sinchon" data-loc="신촌">
						<span>신촌</span>
					</div>

					<div class="loc daehakro" data-loc="대학로">
						<span>대학로</span>
					</div>

				</div>
			</div>

			<div class="store_selector">
				<div class="store_header">
					<span>매장</span>
				</div>

				<div id="store_list" class="store_list">
					
				</div>
			</div>

			<div class="theme_selector">
				<div class="theme_header">
					<span>테마</span>
				</div>

				<div id="theme_list" class="theme_list">
				</div>
			</div>


			<div class="time_selector">
				<div class="time_header">
					<span>시간</span>
				</div>

				<div id="time_list" class="time_list">
					
				</div>
			</div>

			<div class="book_btn_box">
				<button type="button" id="book_btn">
					예약하기
				</button>
			</div>
		</div>
	</div>

	<script>
		window.addEventListener('load', function () {
			vanillaCalendar.init({
				disablePastDays: true
			});
		})
	</script>
	<script src="${pageContext.request.contextPath}/js/vanillaCalendar.js" type="text/javascript"></script>

	<script>
		var $date = "";
		var $datetime_string = "";
		var $loc = "";
		var $store_id = "";
		var $theme_id = "";
		var $time = "";

		function isEmpty(value) {
			if (value == "" || value == null || value == undefined || (value != null && typeof value == "object" && !Object.keys(value).length)) {
				return true
			} else {
				return false
			}
		}

		function onlyNumber(obj) {
			$(obj).keyup(function () {
				$(this).val($(this).val().replace(/[^0-9]/g, ""));
			});
		}

		function noneSpace(obj) {
			$(obj).keyup(function () {
				$(this).val($(this).val().replace(/\s/g, ""));
			});
		}

		function getParameterByName(name, url) {
			if (!url) url = window.location.href;
			name = name.replace(/[\[\]]/g, "\\$&");
			var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|&)"),
				results = regex.exec(url);
			return results[2];
		}
	</script>

	<script>
	function dateSwitch(date){
		$dateYear = date.substr(11,4);
		$dateMonth = date.substr(4,3);
		$dateDay = date.substr(8,2);
		switch($datetime_string.substr(4,3)) {
		case 'Jan': $dateMonth = '1'; break;  
		case 'Feb': $dateMonth = '2'; break;  
		case 'Mar': $dateMonth = '3'; break;  
		case 'Apr': $dateMonth = '4'; break;  
		case 'May': $dateMonth = '5'; break;  
		case 'Jun': $dateMonth = '6'; break;  
		case 'Jul': $dateMonth = '7'; break;  
		case 'Aug': $dateMonth = '8'; break;  
		case 'Sep': $dateMonth = '9'; break;  
		case 'Oct': $dateMonth = '10'; break;  
		case 'Nov': $dateMonth = '11'; break;  
		case 'Dec': $dateMonth = '12'; break;  
		}
		
		return $dateYear+'/'+$dateMonth+'/'+$dateDay;
	}
		$(window).on("load", function () {
				
			//시간 기본 선택
			//if (getParameterByName('type') == "select") {
			//	setTimeout(function () {
			//		$date = $(".vcal-date[data-calendar-status='active']").children().html();
			//		$datetime_string = $(".vcal-date[data-calendar-status='active']").data("calendar-date");
			//	}, 500);

				//지역 기본 선택
			//	$('.loc[data-loc="서울"]').children().addClass('active');
			//	$loc = "all";
				/*} else if (getParameterByName('type') == "store_direct") {
				setTimeout(function () {
					$date = $(".vcal-date[data-calendar-status='active']").children().html();
					$datetime_string = $(".vcal-date[data-calendar-status='active']").data("calendar-date");
					$loc = "";
					$store_id = "";
				}, 500);
			} else if (getParameterByName('type') == "theme_direct") {
				setTimeout(function () {
					$date = $(".vcal-date[data-calendar-status='active']").children().html();
					$datetime_string = $(".vcal-date[data-calendar-status='active']").data("calendar-date");
					$loc = "";
					$store_id = "";
					$theme_id = "";

					//search_allow_time($theme_id,$datetime_string);
				}, 500);
			}*/
			
			//$("#time_list").hide();
			
			$datetime_string = $(".vcal-date[data-calendar-status='active']").data("calendar-date");
				//console.log($datetime_string);
				
			$clickDate = dateSwitch($datetime_string);
				
				
				//$dateMonth = $datetime_string.substr(4,3);
				//$dateDay = $datetime_string.substr(8,2);
				//$dateYear = $datetime_string.substr(11,4);
				
				//console.log("현재 월 = "+$dateMonth);
				//console.log("현재 날 = "+$dateDay);
				//console.log("현재 년 = "+$dateYear);
				
			
			
			});
	</script>

	<script>
		
		function check_allow_time($theme_id,$clickDate) {
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/reserve/check",
				contentType: 'application/json',
				data: JSON.stringify({
					
					"reserveTheme" : $theme_id,
					"reserveDate" : $clickDate
				}),
					
				
				dataType : "json",
				success: function(data) {
					$result = data.reserveAllowTime;
					
					
				$("#time_list").append(

					"<div class='time "+$result[0]+"' data-reserve-allow="+$result[0]+" data-reserve-time ='10:00'>"
					+"<span>10:00</span>"
					+"</div>"
					+"<div class='time "+$result[1]+"' data-reserve-allow="+$result[1]+" data-reserve-time ='11:30'>"
					+"<span>11:30</span>"
					+"</div>"
					+"<div class='time "+$result[2]+"' data-reserve-allow="+$result[2]+" data-reserve-time ='13:00'>"
					+"<span>13:00</span>"
					+"</div>"
					+"<div class='time "+$result[3]+"' data-reserve-allow="+$result[3]+" data-reserve-time ='14:30'>"
					+"<span>14:30</span>"
					+"</div>"
					+"<div class='time "+$result[4]+"' data-reserve-allow="+$result[4]+" data-reserve-time ='16:00'>"
					+"<span>16:00</span>"
					+"</div>"
					+"<div class='time "+$result[5]+"' data-reserve-allow="+$result[5]+" data-reserve-time ='17:30'>"
					+"<span>17:30</span>"
					+"</div>"
					+"<div class='time "+$result[6]+"' data-reserve-allow="+$result[6]+" data-reserve-time ='19:00'>"
					+"<span>19:00</span>"
					+"</div>"
					+"<div class='time "+$result[7]+"' data-reserve-allow="+$result[7]+" data-reserve-time ='20:30'>"
					+"<span>20:30</span>"
					+"</div>"
					);
				},
				error : function(xhr){
					alert("에러코드 = " + xhr.status);
				}
			});
		}

		$(".loc").click(function () {
			if(isEmpty("${loginMember.memberEmail}") === true){
				var animation = new TimelineLite();
                $("html").css("overflow", "hidden");
                animation.to('#m_main_menu', 0.2, { css: { className: '-=active', display: 'none' }, delay: 0, ease: Linear.easeNone });

                $("body").css("overflow", "hidden");
                $("#login_wrap_back").css("display", "block");
                $("#login_wrap").css("display", "block");
                $(".container").addClass("not_ie");
			    $("#login_wrap_back").addClass("not_ie");
			    return false;
			}
			
			$("#book_btn").hide();

			$loc = $(this).data("loc");
			$(".loc").children().removeClass("active");
			$(this).children().addClass("active");
			

			/** 매장 출력 **/
			
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/reserve/loc",
				data: JSON.stringify({"loc" : $loc}),
				contentType: 'application/json',
				dataType: "json",
				success: function(data) {
					//$result = JSON.parse(data);
					$result = eval(data);
	
					
					if($result.result == "fail") {
						alert($result.msg);
					} else {
						
						$("#store_list").empty();
						$("#theme_list").empty();
						$("#time_list").empty();

						$result.cafeLoc.forEach(function(element,idx) {
							$("#store_list").append(
									"<div class='store' data-store='"+element+"'>"
									+"<span>"+element+"</span>"
									+"</div>");
						})
						/*
						$("#store_list").append(
								"<div class='store'>"
								+"<span>"+$result.cafeLoc[0]+"</span>"
								+"</div>");
						$("#store_list").append(
								"<div class='store'>"
								+"<span>"+$result.cafeLoc[1]+"</span>"
								+"</div>");
						$("#store_list").append(
								"<div class='store'>"
								+"<span>"+$result.cafeLoc[2]+"</span>"
								+"</div>");
						$("#store_list").append(
								"<div class='store'>"
								+"<span>"+$result.cafeLoc[3]+"</span>"
								+"</div>");
						$("#store_list").append(
								"<div class='store'>"
								+"<span>"+$result.cafeLoc[4]+"</span>"
								+"</div>");
						$("#store_list").append(
								"<div class='store'>"
								+"<span>"+$result.cafeLoc[5]+"</span>"
								+"</div>");
						*/
					}
				},
				error : function(xhr){
					alert("에러코드 = " + xhr.status);
				}
			});
		});


		$('.store_list').on('click', '.store', function () {
			if(isEmpty("${loginMember.memberEmail}") === true){
				var animation = new TimelineLite();
                $("html").css("overflow", "hidden");
                animation.to('#m_main_menu', 0.2, { css: { className: '-=active', display: 'none' }, delay: 0, ease: Linear.easeNone });

                $("body").css("overflow", "hidden");
                $("#login_wrap_back").css("display", "block");
                $("#login_wrap").css("display", "block");
                $(".container").addClass("not_ie");
			    $("#login_wrap_back").addClass("not_ie");
			    return false;
			}
			$("#book_btn").hide();

			$(".store").children().removeClass("active");
			$(this).children().addClass("active");

			$store_id = $(this).data("store");
			/** 매장 내의 테마 출력 **/
			
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/reserve/cafe",
				data: JSON.stringify({
					"themeCname" : $store_id
				}),
				dataType: "json",
				contentType: "application/json",
				success: function(data) {
					$result = eval(data);
					if($result.result == 'fail') {
						alert($result.msg);
					} else {
						$("#theme_list").empty();
						$("#time_list").empty();
						
						$result.themeCafe.forEach(function(element,idx) {
							$("#theme_list").append(
									"<div class='theme' data-theme='"+element+"'>"
									+"<span>"+element+"</span>"
									+"</div>");
						})

					}
				}
			});
		});

		$('.theme_list').on('click', '.theme', function () {

			if(isEmpty("${loginMember.memberEmail}") === true){
				var animation = new TimelineLite();
                $("html").css("overflow", "hidden");
                animation.to('#m_main_menu', 0.2, { css: { className: '-=active', display: 'none' }, delay: 0, ease: Linear.easeNone });

                $("body").css("overflow", "hidden");
                $("#login_wrap_back").css("display", "block");
                $("#login_wrap").css("display", "block");
                $(".container").addClass("not_ie");
			    $("#login_wrap_back").addClass("not_ie");
			    return false;
			}
			
			$("#book_btn").hide();
			$("#time_list").empty();
			

			$(".theme").children().removeClass("active");
			$(this).children().addClass("active");

			$theme_id = $(this).data("theme");
			//console.log($theme_id);
			
			check_allow_time($theme_id,$clickDate);

		});

		/* calender */
		$('.calender').on('click', '.vcal-date', function () {

			$("#book_btn").hide();

			$datetime_string = $(this).data("calendar-date");
			$clickDate = dateSwitch($datetime_string);
			
			
		});

		$('.time_list').on('click', '.time', function () {
			if(isEmpty("${loginMember.memberEmail}") === true){
				var animation = new TimelineLite();
                $("html").css("overflow", "hidden");
                animation.to('#m_main_menu', 0.2, { css: { className: '-=active', display: 'none' }, delay: 0, ease: Linear.easeNone });

                $("body").css("overflow", "hidden");
                $("#login_wrap_back").css("display", "block");
                $("#login_wrap").css("display", "block");
                $(".container").addClass("not_ie");
			    $("#login_wrap_back").addClass("not_ie");
			    return false;
			}

			$('.time').removeClass("active");
			$(this).addClass("active");

			$reserve_allow = $(this).data('reserve-allow');

			console.log($loc);
			console.log($store_id);
			console.log($theme_id);
			console.log($clickDate);
			console.log($reserve_allow);

			if ($reserve_allow === false) {
				alert("해당 시간은 예약이 만료되었습니다.");
				$('.time').removeClass("active");
				$("#book_btn").hide();
			}

			if ($reserve_allow === true) {
				//$theme_id = $(this).data("theme");
				$datetime = $(this).data("reserve-time");
				console.log($datetime);
				$("#book_btn").show();
			}
		});

		$('.book_btn_box').on('click', '#book_btn', function () {
			if(isEmpty("${loginMember.memberEmail}") === true){
				var animation = new TimelineLite();
                $("html").css("overflow", "hidden");
                animation.to('#m_main_menu', 0.2, { css: { className: '-=active', display: 'none' }, delay: 0, ease: Linear.easeNone });

                $("body").css("overflow", "hidden");
                $("#login_wrap_back").css("display", "block");
                $("#login_wrap").css("display", "block");
                $(".container").addClass("not_ie");
			    $("#login_wrap_back").addClass("not_ie");
			}
			// if(isEmpty($loc) === true) {
			// 	alert("지역을 선택해주세요.");
			// 	return false;
			// }
			// if(isEmpty($store_id) === true) {
			// 	alert("매장을 선택해주세요.");
			// 	return false;
			// }
			// if(isEmpty($theme_id) === true) {
			// 	alert("테마를 선택해주세요.");
			// 	return false;
			// }
			// if(isEmpty($date) === true) {
			// 	alert("예약할 날짜를 선택해주세요.");
			// 	return false;
			// }
			// if(isEmpty($datetime) === true) {
			// 	alert("예약할 날짜를 선택해주세요.");
			// 	return false;
			// }


			//브라우저 체크
			var agent = navigator.userAgent.toLowerCase();
			if ((navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1)) {
				//ie
				var $element = "<div id='reserve_wrap_back' class='reserve_wrap_back ie'></div>";
			} else {
				//not ie
				var $element = "<div id='reserve_wrap_back' class='reserve_wrap_back not_ie'></div>";
			}

			$element += "<div id='reserve_wrap' class='reserve_wrap'>";
			$element += "<div class='reserve_layer'>";
			$element += "<h2>예약정보 입력</h2>";
			$element += "<p>취소나 변경 희망시 매장으로 꼭! 연락 해주세요!</p>";
			$element += "<form id='reserve_frm' class='reserve_frm'>";
			$element += "<div class='reserve_input_box'>";
			$element += "<label class='reserve_label'>메모</label>";
			$element += "<input type='text' id='reserver_memo' class='reserve_input' name='reserver_memo' maxlength='200' placeholder='200자 이하' />";
			$element += "</div>";
			$element += "<div class='reserve_input_box'>";
			$element += "<label class='reserve_label'>인원</label>";
			$element += "<input type='text' id='reserver_player' class='reserve_input' name='reserver_player' maxlength='200' placeholder='인원수를 입력해 주세요(숫자)' />";
			$element += "</div>";
			$element += "<div class='reserve_input_box'>";
			$element += "<label class='reserve_label'>결제방법</label>";
			$element += "<input type='text' id='reserver_payment' class='reserve_input' name='reserver_payment' maxlength='200' placeholder='현금or계좌이체만 가능' />";
			$element += "</div>";
			$element += "<div class='reserve_btn_box'>";
			$element += "<input type='submit' id='reserve_btn' class='reserve_btn' value='예약' />";
			$element += "<button type='button' id='cancel_btn' class='cancel_btn'>취소</button>";
			$element += "</div>";
			$element += "</div>";

			$("body").prepend($element);
		});

		$("body").on("submit", "#reserve_frm", function (e) {
			e.preventDefault();
			
			if(isEmpty("${loginMember.memberEmail}") === true){
				alert("로그인 후 이용해주세요.");
				return false;
			}

			if (isEmpty($loc) === true) {
				alert("지역을 선택해주세요.");
				return false;
			}
			if (isEmpty($store_id) === true) {
				alert("매장을 선택해주세요.");
				return false;
			}
			if (isEmpty($theme_id) === true) {
				alert("테마를 선택해주세요.");
				return false;
			}
			if (isEmpty($clickDate) === true) {
				alert("예약할 날짜를 선택해주세요.");
				return false;
			}

			if (isEmpty($("#reserver_memo").val()) === true) {
				alert("메모를 입력해주세요.");
				return false;
			}
			
			if (isEmpty($("#reserver_player").val()) === true) {
				alert("인원을 입력해주세요.");
				return false;
			}
			
			if (isEmpty($("#reserver_payment").val()) === true) {
				alert("결제방식을 입력해주세요.");
				return false;
			}

			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/reserve/ok",
				data: JSON.stringify({
					"reserveEmail":"${loginMember.memberEmail}",
					"reserveDate": $clickDate,
					"reserveLoc": $loc,
					"reserveCafe": $store_id,
					"reserveTheme": $theme_id,
					"reserveTime": $datetime,
					"reservePlayer": $("#reserver_player").val(),
					"reserveMoney": $("#reserver_player").val()*20000,
					"reservePayment": $("#reserver_payment").val(),
					"reserveComment": $("#reserver_memo").val()
					
				}),
				contentType: "application/json",
				dataType: "text",
				success: function (data) {


					if (data==="fail") {
						alert("예약 실패 ");
						return false;
					} else {
						alert("예약 성공");
						location.reload();
						return false;
					}
				},
				error : function(xhr){
					alert("에러코드 = " + xhr.status);
				}
			});
		});
	</script>

	<script>
		$('body').on('click', '#reserve_wrap_back', function () {
			$('#reserve_wrap_back').remove();
			$('#reserve_wrap').remove();
		});

		$('body').on('click', '#reserve_close_btn', function () {
			$('#reserve_wrap_back').remove();
			$('#reserve_wrap').remove();
		});

		$('body').on('click', '#cancel_btn', function () {
			$('#reserve_wrap_back').remove();
			$('#reserve_wrap').remove();
		});
	</script>
</body>
</html>