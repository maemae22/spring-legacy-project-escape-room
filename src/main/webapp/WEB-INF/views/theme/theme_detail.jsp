<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
<html lang="ko">


<!-- 
maxcdn 부트스트랩 넣으면 별점 정상적으로 나옴
ajax.googleapis.com 넣으면 X버튼 먹음 + 로그인 레이어 뜸
 -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
<meta charset="utf-8">

<link href="${pageContext.request.contextPath}/css/fonte9d4.css?ver=" rel="stylesheet" />


<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css"/>


<link href="${pageContext.request.contextPath}/css/reset.css?ver=171755" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/style.css?ver=171755" rel="stylesheet" />

<link href="${pageContext.request.contextPath}/css/common.css?ver=171755" rel="stylesheet" />


<link href="${pageContext.request.contextPath}/css/popup_layer.css?ver=171755" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/theme.detail.popup.css?ver=171755" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/theme.detail.css?ver=171755" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/theme.detail.banner.css?ver=171755" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/theme.review.css?ver=171755" rel="stylesheet" />


<link href="${pageContext.request.contextPath}/css/nonbootstrap.css?ver=171755" rel="stylesheet" />


<!-- tweenmax libaray -->
<script src="${pageContext.request.contextPath}/js/TweenMax.min.js"></script>

<!--jquery UI libaray -->

<!-- safari browser css -->
<%-- <script src="${pageContext.request.contextPath}/js/safari.js"></script> --%>

<script type="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>
<script>
	var $assets_url = "../_template/assets/index.html";
	var $home_url = "../index.html";
</script>



<!-- 내가 추가 (셋 중 하나는 datepicker) -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- 이 코드 없으면 X 버튼 눌렀을 때 안 닫힘 + datepicker 안 먹힘 -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- 이게 datepicker 관련 -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <!-- 리뷰 팝업창 팝업 레이어로 뜨게 하는 코드
  <script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>  -->


<!-- 내가 추가한 css -->
<style type="text/css">
.review_modify, .review_delete {
	background-color: #f7ba00;
    border: none;
    color: white;
    width: 50px;
    display: inline-block !important;
    margin: 3px;
    padding: 5px;
    font: menu;
}

/* .reivew_agent{
	text-align: right;
} */

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


	<!-- 추가되는 theme.css -->
	<style>
		.theme.detail .container .container_inner.section_detail.section_detail_more_info .fixing_wid.fixing_wid_960 .more_info_left .intro_in_more_info .intro_in_more_info_category {
			margin-bottom:20px;
		}

		.element_row.input_box .input_row .tag {
			width: 70px;
		}

		.element_row.input_box .input_row .input .input_inner .difficulty .difficulty_inner {
			text-align:center;
		}

		.element_row.input_box .input_row .input .input_inner .difficulty .difficulty_inner label.difficulty_label img {
			height: 17px;
		}

		.difficulty .difficulty_inner .difficulty_radio_box > label > img {
			width: 15px;
    		margin-right: 5px;
		}

		.difficulty .difficulty_inner .difficulty_radio_box > span:nth-child(2) {
			font-size: 13px;
		}

		.input_row .input.success_n_fail .input_inner .success_radio_box .success_radio_box_inner label:nth-child(2) img {
			width:15px;
		}

		.theme.detail .container .container_inner.section_detail.section_detail_more_info .fixing_wid.fixing_wid_960 .more_info_left .review_in_more_info .memb_review_box .reivew_agent {
			margin-top:20px;
		}
		.memb_review_box .review_modi_delete_btns {
			display: inline-block;
		}

		.theme.detail .container .container_inner.section_detail.section_detail_more_info .fixing_wid.fixing_wid_960 .more_info_left .review_in_more_info .memb_review_box .review_recommend_btn {
	        display: inline-block;
		    float: right;
		    position: relative;
		    vertical-align: middle;
		    position: absolute;
		    bottom: 10px;
		    right: 10px;
		}

		.theme.detail .container .container_inner.section_detail.section_detail_more_info .fixing_wid.fixing_wid_960 .more_info_left .review_in_more_info .memb_review_box .review_recommend_btn .review_report_btn {
			display: inline-block;
		    vertical-align: middle;
		    background-color: #fff;
		    border: 0;
		    margin: 0 5px;
		    padding: 0;
		    outline: none;
		}

		.theme.detail .container .container_inner.section_detail.section_detail_more_info .fixing_wid.fixing_wid_960 .more_info_left .review_in_more_info .memb_review_box .review_recommend_btn .review_recommend {
			display: inline-block;
		    vertical-align: middle;
		    width: 35px;
		    background-color: #fff;
		    border: 0;
		    margin: 0 5px;
		    padding: 0;
		    outline:none;
		} 

		.theme.detail .container .container_inner.section_detail.section_detail_more_info .fixing_wid.fixing_wid_960 .more_info_left .review_in_more_info .memb_review_box .review_recommend_btn .review_recommend img {
			width: 18px;
    		display: inline-block;
    		vertical-align: middle;
		}

		.theme.detail .container .container_inner.section_detail.section_detail_more_info .fixing_wid.fixing_wid_960 .more_info_left .review_in_more_info .memb_review_box .review_recommend_btn .review_recommend span.value {
			display: inline-block;
		    vertical-align: middle;
		    vertical-align: text-bottom;
		    font-size: 15px;
    		color: #938e8e;
		}

		.theme.detail .container .container_inner.section_detail.section_detail_more_info .fixing_wid.fixing_wid_960 .more_info_left .review_in_more_info .memb_review_box .review_recommend_btn .review_report {
			display: inline-block;
		    vertical-align: middle;
		    background-color: #fff;
		    border: 0;
		    padding: 0;
		    margin: 0 5px;
		    outline:none;
		}

		.theme.detail .container .container_inner.section_detail.section_detail_more_info .fixing_wid.fixing_wid_960 .more_info_left .review_in_more_info .memb_review_box .review_recommend_btn .review_report img {
			display: inline-block;
		    width: 18px;
		    vertical-align: middle;
		}

		.theme.detail .container .container_inner.section_detail.section_detail_more_info .fixing_wid.fixing_wid_960 .more_info_left .review_in_more_info .memb_review_box .review_recommend_btn .review_report span.value {
			display: inline-block;
			min-width:25px;
		    vertical-align: middle;
		}

		@media all and (max-width:650px) {
			.theme.detail .container .container_inner.section_detail.section_detail_more_info .fixing_wid.fixing_wid_960 .more_info_left .review_in_more_info .memb_review_box .review_recommend_btn .review_recommend {
				width:15px;
			}

			.theme.detail .container .container_inner.section_detail.section_detail_more_info .fixing_wid.fixing_wid_960 .more_info_left .review_in_more_info .memb_review_box .review_recommend_btn .review_recommend img { 
				width:15px;
			}

			.theme.detail .container .container_inner.section_detail.section_detail_more_info .fixing_wid.fixing_wid_960 .more_info_left .review_in_more_info .memb_review_box .review_recommend_btn .review_report img { 
				width:15px;
			}
		}
	</style>
	<!-- 추가되는 theme.css end -->

	<!-- 추가되는 theme.review.css -->
	<style>
		@media all and (max-width:650px) {
			.element_row.input_box .input_row .tag {
				width: 70px;
			}

			.element_row.input_box .input_row {
				padding-left:0;
				padding-right:0;
			}

			.difficulty .difficulty_inner .difficulty_radio_box label {
				width:12px;
			}

			.difficulty .difficulty_inner .difficulty_radio_box label img {
				width:12px;
			}

			.difficulty .difficulty_inner .difficulty_radio_box > span:nth-child(2) {
				margin-left: 5px;
			}
		}

		@media all and (max-width:550px) {
			.element_row.input_box .input_row.difficulty_input_row .tag {
				    display: block;
				    width: 100%;
				    text-align: center;
			}	

			.element_row.input_box .input_row.difficulty_input_row .input.difficulty_input {
				display: block;
				width: 100%;
			}

			.element_row.input_box .input_row.difficulty_input_row .input .input_inner .difficulty {
				display: inline-block;
				margin: 10px 1px;
			}

			.element_row.input_box .input_row.difficulty_input_row .input {
				display: block;
				width: 100%;
				margin-top:10px;
			}

			.element_row.input_box .input_row.difficulty_input_row .input .input_inner {
				display: block;
				text-align:center;
			}

			.difficulty .difficulty_inner .difficulty_radio_box {
				margin-top: 10px;
			    display: block;
			    text-align: center;
			}
		}
	</style>
	<!-- 추가되는 theme.review.css end -->

	<!-- 추가되는 theme.review.modal.css -->
	<style>
		.report_wrap_back {
			display: none;
		    position: fixed;
		    z-index: 9997;
		    top: 0;
		    bottom: 0;
		    left: 0;
		    right: 0;
		    width: 100%;
		    height: 100%;
		    margin: auto;
		}

		.report_wrap {
			display: block;
			position: fixed;
		    z-index: 9998;
		    top: 0;
		    bottom: 0;
		    left: 0;
		    right: 0;
		    margin: auto;
		    width: 80%;
		    min-width: 300px;
		    max-width: 500px;
		    height: 90%;
		    min-height: 400px;
		    max-height: 510px;
		}

		.report_wrap .report_layer {
			display: block;
		    position: absolute;
		    z-index: 9998;
		    top: 0;
		    bottom: 0;
		    left: 0;
		    right: 0;
		    width: 100%;
		    height: 100%;
		    margin: auto;
		    padding: 80px 50px;
		    background-color: #fff;
		    border-radius: 3px;
		    -webkit-box-shadow: 11px 10px 23px -2px rgba(0,0,0,0.75);
		    -moz-box-shadow: 11px 10px 23px -2px rgba(0,0,0,0.75);
		    box-shadow: 11px 10px 23px -2px rgba(0,0,0,0.75);
		    border-top: 1px solid #d9dbda;
		}

		.report_wrap .report_layer .report_frm {
		    width: 100%;
		}

		.report_wrap .report_layer .report_frm .input_box {
			width: 100%;
    		margin: 20px 0;
    		height: 100%;
		}

		.report_wrap .report_layer .report_frm .frm-btn {
			width: 100%;
    		text-align: right;
		}

		.report_wrap .report_layer .report_frm .frm-btn .review_reporting {
			width: 150px;
		    padding: 11px;
		    background-color: #ff6060;
		    border: 0;
		    border-radius:5px;
		    color: #fff;
		}

		.report_wrap .report_layer .report_frm .input_box textarea {
			width: 100%;
    		height: 300px;
    		padding:10px;
    		resize:none;
		}

		.review_form_pop_up_layer .input_box.datetime_input_box {
			border:0;
			text-align:right;
		}

		.review_form_pop_up_layer .input_box.datetime_input_box .datetime {
			float:none;
			height: 20px;
		    color: #868686;
		    font-size: 13px;
		    line-height: 20px;   
		}

		.review_form_pop_up_layer .input_box.datetime_input_box .datetime input {
			width: 70px;
		    padding: 1px 2px;
		    text-align: center;
		    border: 0;
		    border-bottom: 1px solid #ccc;
		    outline:none;
		}

		.review_form_pop_up_layer .rating_input_agent {
			float:right;
		}

		.review_form_pop_up_layer .rating_input_agent .no_rating_input {
		    display: inline-block;
		    padding: 4px 10px;
		    border: 1px solid #dddddd;
		    border-radius: 7px;
		    background-color: #fff;
		    color: #b0b0b0;
		    vertical-align: middle;
		    outline:none;
		}

		.review_form_pop_up_layer .rating_input_agent .no_rating_input.active {
			background-color:#ffb800;
			color:#fff;
		}

		.review_form_pop_up_layer .modify_rating_input_agent {
			float:right;
		}

		.review_form_pop_up_layer .modify_rating_input_agent .modify_no_rating_input {
		    display: inline-block;
		    padding: 4px 10px;
		    border: 1px solid #dddddd;
		    border-radius: 7px;
		    background-color: #fff;
		    color: #b0b0b0;
		    vertical-align: middle;
		    outline:none;
		}

		.review_form_pop_up_layer .modify_rating_input_agent .modify_no_rating_input.active {
			background-color:#ffb800;
			color:#fff;
		}

		.theme.detail .container .container_inner.section_detail.section_detail_more_info .fixing_wid.fixing_wid_960 .more_info_left .intro_in_more_info .desc.theme_producer p span {
			font-weight:600;
		}
	</style>
	<!-- 추가되는 theme.review.modal.css end -->
	<script>
		function onlyNumber(obj) {
            $(obj).keyup(function(){
                $(this).val($(this).val().replace(/[^0-9]/g,""));
            }); 
        }


        function noneSpace(obj) {
            $(obj).keyup(function(){
                    $(this).val($(this).val().replace(/\s/g,""));
            }); 
        }


		function isEmpty(value) { 
            if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
                return true 
            } else { 
                return false 
            } 
        }

        function getParameterByName(name,url) {
	      	if(!url) url = window.location.href;
	        name = name.replace(/[\[\]]/g,"\\$&");
	       	var regex = new RegExp("[?&]"+name+"(=([^&#]*)|&|#|&)"),
	       	results = regex.exec(url);
	       	if(isEmpty(results) === false) {
	       		return results[2];
	       	} else {
	       		return "";
	       	}
	   	}
	</script>
</head>

<!-- 리뷰 팝업에 내가 추가한 css -->
<style type="text/css">
.review_form_pop_up_layer .element_row {
    width: 100%;
}

.element_row.input_box .input_row {
    display: table;
    width: 100%;
    padding: 10px 15px;
    border-bottom: 1px solid #c5c1c1;
}

.difficulty .difficulty_inner .difficulty_radio_box {
    display: table;
    margin-top: 0px;
}

.writer {
	margin-bottom: 10px;
}

.reviewPopupFrm_submit, .reviewPopupFrm_btn_box, .reviewFrm_submit {
	cursor: pointer !important;
}

</style>


<body class="theme detail">

	<!-- 리뷰 팝업 : 후기 등록 버튼 눌렀을 때 뜨는 팝업 -->
	<!-- 0. 플레이 날짜 / 1. 작성자 부분 / 2. 별점 / 3. 난이도 / 
		 4. 성공여부 / 5. 남은시간 / 6. 힌트수 / 7. 리뷰 내용 -->
	<div id="review_form_pop_up_back_opacity" class="review_form_pop_up_back_opacity" style="display:none;"></div>
	<div id="review_form_pop_up_wrap" class="review_form_pop_up_wrap" style="display:none;">
	<!-- <div id="review_form_pop_up_back_opacity" class="review_form_pop_up_back_opacity" style=""></div>
	<div id="review_form_pop_up_wrap" class="review_form_pop_up_wrap" style=""> -->
		<div class="review_form_pop_up_wrap_inner">
			<form id="reviewPopupFrm" class="reviewPopupFrm">
				<div class="review_form_pop_up_layer">
					<div class="element_row close_btn_box">
						<!-- 닫기 X 버튼 이미지 -->
						<img src="${pageContext.request.contextPath}/images/theme/detail/review/close.png" alt=""  style="margin-top: 5px;"/>
					</div>

					<div class="element_row review_form_pop_up_title">
						<h2>후기작성</h2>
					</div>
					
					<div class="element_row input_box datetime_input_box"> 
						<div class="datetime">
							<span class="tag">플레이날짜</span>
							<input type="text" id="review_write_time" name="review_write_time" class="review_write_time" value="" maxlength="8" readonly="readonly" />
						</div>
					</div>

					<!-- 노란색 테두리 안쪽 내용 -->
					<div class="element_row input_box">
						<!-- 1. 작성자 부분 + 별점 안매기기 -->
						<div class="writer_info_row">
							<!-- 작성자 -->
							<div class="writer">
								<span class="icon">
									<img src="${pageContext.request.contextPath}/images/theme/detail/review/login_none.jpg" alt="" style="vertical-align: middle; width: 40px;"  />
								</span>
								<span class="text" style="margin-left: 5px;">${member.memberNick }</span>
							</div>

							<!-- 별점안매기기 버튼
							<div class="rating_input_agent">
								<input type="hidden" name="rated_star_inputed" id="rated_star_inputed" value="true" />
								<button type="button" id="no_rating_input" class="no_rating_input">별점안매기기</button>
							</div> -->
						</div>
						
						<!-- 2. 별점 -->
						<div class="input_row">
							<div id="rating_ioput_row" class="rating_ioput_row">
								<div class="tag">
									<span>별점</span>
								</div>
								<div class="input">
									<div class="rating_star">
										<fieldset class="rate">
											<input type="radio" id="rating10" name="rating" value="10"/><label for="rating10" title="5 stars"></label>
											<input type="radio" id="rating9" name="rating" value="9" /><label class="half" for="rating9" title="4 1/2 stars"></label>
											<input type="radio" id="rating8" name="rating" value="8" /><label for="rating8" title="4 stars"></label>
											<input type="radio" id="rating7" name="rating" value="7" /><label class="half" for="rating7" title="3 1/2 stars"></label>
											<input type="radio" id="rating6" name="rating" value="6" /><label for="rating6" title="3 stars"></label>
											<input type="radio" id="rating5" name="rating" value="5" /><label class="half" for="rating5" title="2 1/2 stars"></label>
											<input type="radio" id="rating4" name="rating" value="4" /><label for="rating4" title="2 stars"></label>
											<input type="radio" id="rating3" name="rating" value="3" /><label class="half" for="rating3" title="1 1/2 stars"></label>
											<input type="radio" id="rating2" name="rating" value="2" /><label for="rating2" title="1 star"></label>
											<input type="radio" id="rating1" name="rating" value="1" /><label class="half" for="rating1" title="1/2 star"></label>
											<input type="hidden" name="rated_star" id="rated_star"/>
										</fieldset>
										<span>이 테마의 솔직한 별점을 남겨주세요</span>
									</div>
								</div>
							</div>
						</div>

						<!-- 3. 난이도 -->
						<div class="input_row difficulty_input_row">
							<div class="tag">
								<span>난이도</span>
							</div>

							<div class="input">
								<div class="input_inner">
								
									<div class="difficulty very_easy">
										<div class="difficulty_inner">
											
											<div class="difficulty_radio_box">
												<label for="difficulty_very_easy">
													<input type="radio" id="difficulty_very_easy" name="difficulty" value="veryEasy" style="visibility: visible; margin-top: 0px;"/>
												</label>
												<span>&nbsp;매우쉬움&nbsp;&nbsp;&nbsp;</span>
											</div>
										</div>
									</div>

									<div class="difficulty easy">
										<div class="difficulty_inner">
											
											<div class="difficulty_radio_box">
												<label for="difficulty_easy">
													<input type="radio" id="difficulty_easy" name="difficulty" value="easy" style="visibility: visible; margin-top: 0px;"/>
												</label>
												<span>&nbsp;쉬움&nbsp;&nbsp;&nbsp;</span>
											</div>
										</div>
									</div>

									<div class="difficulty normal">
										<div class="difficulty_inner">
											
											<div class="difficulty_radio_box">
												<label for="difficulty_normal">
													<input type="radio" id="difficulty_normal" name="difficulty" value="normal" style="visibility: visible; margin-top: 0px;"/>
												</label>
												<span>&nbsp;보통&nbsp;&nbsp;&nbsp;</span>
											</div>
										</div>
									</div>

									<div class="difficulty hard">
										<div class="difficulty_inner">
											
											<div class="difficulty_radio_box">
												<label for="difficulty_hard">
													<input type="radio" id="difficulty_hard" name="difficulty" value="hard" style="visibility: visible; margin-top: 0px;"/>
												</label>
												<span>&nbsp;어려움&nbsp;&nbsp;&nbsp;</span>
											</div>
										</div>
									</div>

									<div class="difficulty very_hard">
										<div class="difficulty_inner">
											
											<div class="difficulty_radio_box">
												<label for="difficulty_very_hard">
													<input type="radio" id="difficulty_very_hard" name="difficulty" value="veryHard" style="visibility: visible; margin-top: 0px;"/>
												</label>
												<span>&nbsp;매우어려움&nbsp;&nbsp;&nbsp;</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 4. 성공여부 -->
						<div class="input_row">
							<div class="tag">
								<span>성공여부</span>
							</div>

							<div class="input success_n_fail">
								<div class="input_inner">
									<div class="success_radio_box">
										<div class="success_radio_box_inner">
											<label for="success" class="success_n_fail_label_1"><img src="${pageContext.request.contextPath}/images/theme/detail/review/success.png" alt="" /></label>
											<input type="radio" id="success" name="success_n_fail" value="성공" style="visibility: visible; margin-top: 0px;" />
											<span>&nbsp;성공&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
										</div>
									</div>

									<div class="success_radio_box">
										<div class="success_radio_box_inner">
											<label for="fail" class="success_n_fail_label_1"><img src="${pageContext.request.contextPath}/images/theme/detail/review/fail.png" alt="" /></label>
											<input type="radio" id="fail" name="success_n_fail" value="실패"  style="visibility: visible; margin-top: 0px;"/>
											<span>&nbsp;실패</span>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 5. 남은시간 -->
						<div class="input_row">
							<div class="tag">
								<span>남은시간</span>
							</div>

							<div class="input time_remaining">
								<div class="input_inner">
									<div class="input_text_wrap">
										<div class="input_text_time">
											<input type="text" name="rated_escape_time_minute" placeholder="00" onkeydown="onlyNumber(this)" onkeyup="noneSpace(this)"  maxlength="2" />
											<span>분</span>
										</div>

										<div class="input_text_minute">
											<input type="number" name="rated_escape_time_second" placeholder="00" onkeydown="onlyNumber(this)" onkeyup="noneSpace(this)" maxlength="2" max='59' min='0' />
											<span>초</span>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 6. 힌트수 -->
						<div class="input_row">
							<div class="tag">
								<span>힌트수</span>
							</div>

							<div class="input numb_of_hints_used">
								<div class="input_inner">
									<div class="input_text_wrap">
										<div class="input_text_numb_of_hints_used">
											<!-- <input type="text" name="" placeholder="(선택사항)" /> -->
											<select name="rated_escape_item">
												<option value="0개">0개</option>
											    <option value="1개">1개</option>
											    <option value="2개">2개</option>
											    <option value="3개">3개</option>
											    <option value="4개">4개</option>
											    <option value="5개 이상">5개 이상</option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 7. 코멘트 -->
						<div class="input_row pop_up_review_content" style="width: 100%;">
							<div style="text-align: right !important; ">
								<span class="textCount">0자</span> <span class="textTotal">/200자</span>
							</div>
							<textarea class="reviewPopupFrm_content" id="reviewPopupFrm_content" placeholder="이 테마의 어떤점이 마음에 드셨나요?" style="resize: none;" maxlength="200"></textarea>  
						</div>
						
						
					</div>

					<!-- 후기 등록 버튼 -->
					<div class="reviewPopupFrm_btn_box">
	 						<input type="submit" id="reviewPopupFrm_submit" class="reviewPopupFrm_submit" value="후기 등록" />
							<!-- <input type="submit" id="reviewPopupFrm_submit" class="reviewPopupFrm_submit"  value="후기 등록" disabled="disabled"/> -->
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 리뷰 팝업 끝 -->
	
	<script type="text/javascript">
	
	$('#reviewPopupFrm_content').keyup(function (e) {
		let content = $(this).val();
	    
	    // 글자수 세기
	    if (content.length == 0 || content == '') {
	    	$('.textCount').text('0자');
	    } else {
	    	$('.textCount').text(content.length + '자');
	    }
	    
	    // 글자수 제한
	    if (content.length > 200) {
	    	// 200자 부터는 타이핑 되지 않도록
	        $(this).val($(this).val().substring(0, 200));
	        // 200자 넘으면 알림창 뜨도록
	        alert('글자수는 200자까지 입력 가능합니다.');
	    };
	});
	
	
	</script>
	
	
	
	
	<!-- 리뷰 팝업 (변경) : 후기 수정 버튼 눌렀을 때 뜨는 팝업 -->
	<!-- 0. 플레이 날짜 / 1. 작성자 부분 / 2. 별점 / 3. 난이도 / 
		 4. 성공여부 / 5. 남은시간 / 6. 힌트수 / 7. 리뷰 내용 -->
	<div id="review_form_pop_up_back_opacity_update" class="review_form_pop_up_back_opacity" style="display:none;"></div>
	<div id="review_form_pop_up_wrap_update" class="review_form_pop_up_wrap" style="display:none;">
	<!-- <div id="review_form_pop_up_back_opacity" class="review_form_pop_up_back_opacity" style=""></div>
	<div id="review_form_pop_up_wrap" class="review_form_pop_up_wrap" style=""> -->
		<div class="review_form_pop_up_wrap_inner">
			<form id="reviewPopupFrm_update" class="reviewPopupFrm">
				<div class="review_form_pop_up_layer">
					<div class="element_row close_btn_box" id="close_btn_box_update">
						<!-- 닫기 X 버튼 이미지 -->
						<img src="${pageContext.request.contextPath}/images/theme/detail/review/close.png" alt=""  style="margin-top: 5px;"/>
					</div>

					<div class="element_row review_form_pop_up_title">
						<h2>후기작성</h2>
					</div>
					
					<input type="hidden" id="updateNum">
					
					<div class="element_row input_box datetime_input_box"> 
						<div class="datetime">
							<span class="tag">플레이날짜</span>
							<input type="text" id="review_write_time_update" name="review_write_time_update" class="review_write_time" value="" maxlength="8" readonly="readonly" />
						</div>
					</div>

					<!-- 노란색 테두리 안쪽 내용 -->
					<div class="element_row input_box">
						<!-- 1. 작성자 부분 + 별점 안매기기 -->
						<div class="writer_info_row">
							<!-- 작성자 -->
							<div class="writer">
								<span class="icon">
									<img src="${pageContext.request.contextPath}/images/theme/detail/review/login_none.jpg" alt="" style="vertical-align: middle; width: 40px;"  />
								</span>
								<span class="text" style="margin-left: 5px;">
									<input type="text" id="review_write_nickname" name="review_write_nickname" class="review_write_nickname" value="" readonly="readonly" style="border: none;"/>
								</span>
							</div>

							<!-- 별점안매기기 버튼
							<div class="rating_input_agent">
								<input type="hidden" name="rated_star_inputed" id="rated_star_inputed" value="true" />
								<button type="button" id="no_rating_input" class="no_rating_input">별점안매기기</button>
							</div> -->
						</div>
						
						<!-- 2. 별점 -->
						<div class="input_row">
							<div id="rating_ioput_row" class="rating_ioput_row">
								<div class="tag">
									<span>별점</span>
								</div>
								<div class="input">
									<div class="rating_star">
										<fieldset class="rate">
											<input type="radio" id="rating10" name="rating_update" value="10"/><label for="rating10" title="5 stars"></label>
											<input type="radio" id="rating9" name="rating_update" value="9" /><label class="half" for="rating9" title="4 1/2 stars"></label>
											<input type="radio" id="rating8" name="rating_update" value="8" /><label for="rating8" title="4 stars"></label>
											<input type="radio" id="rating7" name="rating_update" value="7" /><label class="half" for="rating7" title="3 1/2 stars"></label>
											<input type="radio" id="rating6" name="rating_update" value="6" /><label for="rating6" title="3 stars"></label>
											<input type="radio" id="rating5" name="rating_update" value="5" /><label class="half" for="rating5" title="2 1/2 stars"></label>
											<input type="radio" id="rating4" name="rating_update" value="4" /><label for="rating4" title="2 stars"></label>
											<input type="radio" id="rating3" name="rating_update" value="3" /><label class="half" for="rating3" title="1 1/2 stars"></label>
											<input type="radio" id="rating2" name="rating_update" value="2" /><label for="rating2" title="1 star"></label>
											<input type="radio" id="rating1" name="rating_update" value="1" /><label class="half" for="rating1" title="1/2 star"></label>
											<input type="hidden" name="rated_star_update" id="rated_star_update"/>
										</fieldset>
										<span>이 테마의 솔직한 별점을 남겨주세요</span>
									</div>
								</div>
							</div>
						</div>

						<!-- 3. 난이도 -->
						<div class="input_row difficulty_input_row">
							<div class="tag">
								<span>난이도</span>
							</div>

							<div class="input">
								<div class="input_inner">
								
									<div class="difficulty very_easy">
										<div class="difficulty_inner">
											
											<div class="difficulty_radio_box">
												<label for="difficulty_very_easy">
													<input type="radio" id="difficulty_very_easy" name="difficulty_update" value="veryEasy" style="visibility: visible; margin-top: 0px;"/>
												</label>
												<span>&nbsp;매우쉬움&nbsp;&nbsp;&nbsp;</span>
											</div>
										</div>
									</div>

									<div class="difficulty easy">
										<div class="difficulty_inner">
											
											<div class="difficulty_radio_box">
												<label for="difficulty_easy">
													<input type="radio" id="difficulty_easy" name="difficulty_update" value="easy" style="visibility: visible; margin-top: 0px;"/>
												</label>
												<span>&nbsp;쉬움&nbsp;&nbsp;&nbsp;</span>
											</div>
										</div>
									</div>

									<div class="difficulty normal">
										<div class="difficulty_inner">
											
											<div class="difficulty_radio_box">
												<label for="difficulty_normal">
													<input type="radio" id="difficulty_normal" name="difficulty_update" value="normal" style="visibility: visible; margin-top: 0px;"/>
												</label>
												<span>&nbsp;보통&nbsp;&nbsp;&nbsp;</span>
											</div>
										</div>
									</div>

									<div class="difficulty hard">
										<div class="difficulty_inner">
											
											<div class="difficulty_radio_box">
												<label for="difficulty_hard">
													<input type="radio" id="difficulty_hard" name="difficulty_update" value="hard" style="visibility: visible; margin-top: 0px;"/>
												</label>
												<span>&nbsp;어려움&nbsp;&nbsp;&nbsp;</span>
											</div>
										</div>
									</div>

									<div class="difficulty very_hard">
										<div class="difficulty_inner">
											
											<div class="difficulty_radio_box">
												<label for="difficulty_very_hard">
													<input type="radio" id="difficulty_very_hard" name="difficulty_update" value="veryHard" style="visibility: visible; margin-top: 0px;"/>
												</label>
												<span>&nbsp;매우어려움&nbsp;&nbsp;&nbsp;</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 4. 성공여부 -->
						<div class="input_row">
							<div class="tag">
								<span>성공여부</span>
							</div>

							<div class="input success_n_fail">
								<div class="input_inner">
									<div class="success_radio_box">
										<div class="success_radio_box_inner">
											<label for="success" class="success_n_fail_label_1"><img src="${pageContext.request.contextPath}/images/theme/detail/review/success.png" alt="" /></label>
											<input type="radio" id="success" name="success_n_fail_update" value="성공" style="visibility: visible; margin-top: 0px;" />
											<span>&nbsp;성공&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
										</div>
									</div>

									<div class="success_radio_box">
										<div class="success_radio_box_inner">
											<label for="fail" class="success_n_fail_label_1"><img src="${pageContext.request.contextPath}/images/theme/detail/review/fail.png" alt="" /></label>
											<input type="radio" id="fail" name="success_n_fail_update" value="실패"  style="visibility: visible; margin-top: 0px;"/>
											<span>&nbsp;실패</span>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 5. 남은시간 -->
						<div class="input_row">
							<div class="tag">
								<span>남은시간</span>
							</div>

							<div class="input time_remaining">
								<div class="input_inner">
									<div class="input_text_wrap">
										<div class="input_text_time">
											<input type="text" name="rated_escape_time_minute_update" placeholder="00" onkeydown="onlyNumber(this)" onkeyup="noneSpace(this)" maxlength="2" />
											<span>분</span>
										</div>

										<div class="input_text_minute">
											<input type="number" name="rated_escape_time_second_update" placeholder="00" onkeydown="onlyNumber(this)" onkeyup="noneSpace(this)" maxlength="2" max='59' min='0' />
											<span>초</span>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 6. 힌트수 -->
						<div class="input_row">
							<div class="tag">
								<span>힌트수</span>
							</div>

							<div class="input numb_of_hints_used">
								<div class="input_inner">
									<div class="input_text_wrap">
										<div class="input_text_numb_of_hints_used">
											<!-- <input type="text" name="" placeholder="(선택사항)" /> -->
											<select name="rated_escape_item_update">
												<option value="0개">0개</option>
											    <option value="1개">1개</option>
											    <option value="2개">2개</option>
											    <option value="3개">3개</option>
											    <option value="4개">4개</option>
											    <option value="5개 이상">5개 이상</option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 7. 코멘트 -->
						<div class="input_row pop_up_review_content" style="width: 100%;">
							<div style="text-align: right !important;">
								 <span class="textCount">0자</span> <span class="textTotal">/200자</span>
							</div>
							<textarea class="reviewPopupFrm_content" id="reviewPopupFrm_content_update" placeholder="이 테마의 어떤점이 마음에 드셨나요?" style="resize: none;" maxlength="200"></textarea>  
						</div>
						
						
					</div>

					<!-- 후기 등록 버튼 -->
					<div class="reviewPopupFrm_btn_box">
	 						<input type="submit" id="reviewPopupFrm_submit_update" class="reviewPopupFrm_submit" value="후기 변경 완료" />
							<!-- <input type="submit" id="reviewPopupFrm_submit" class="reviewPopupFrm_submit"  value="후기 등록" disabled="disabled"/> -->
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 리뷰(변경) 팝업 끝 -->
	
	<script type="text/javascript">
	
	$('#reviewPopupFrm_content_update').keyup(function (e) {
		let content = $(this).val();
	    
	    // 글자수 세기
	    if (content.length == 0 || content == '') {
	    	$('.textCount').text('0자');
	    } else {
	    	$('.textCount').text(content.length + '자');
	    }
	    
	    // 글자수 제한
	    if (content.length > 200) {
	    	// 200자 부터는 타이핑 되지 않도록
	        $(this).val($(this).val().substring(0, 200));
	        // 200자 넘으면 알림창 뜨도록
	        alert('글자수는 200자까지 입력 가능합니다.');
	    };
	});
	
	
	</script>

	<!-- 후기 등록 버튼 누르면 리뷰 팝업 보이게 show -->
	<script>
		function popupShow() {

			/* $.ajax({
				type: "get",
				url: "${pageContext.request.contextPath}/theme/review_add_try",
				dataType: "text",
				success: function (text) {
					
					if(text=="reviewexist") {
						alert("후기는 테마당 1번만 작성 가능합니다.");
					}
					
					if(text=="nologin") {
						alert("로그인 후 이용해주세요");
					}
					
					if(text=="success") {
						$("#review_form_pop_up_back_opacity").show();
						$("#review_form_pop_up_wrap").show();
					}
				}, 
				error: function(xhr) {
					alert("에러코드(ADD_TRY) = "+xhr.status);
				}
			}); */	
			
			$("#review_form_pop_up_back_opacity").show();
			$("#review_form_pop_up_wrap").show();
			
			
		}
		
		function noreview() {
			alert("이미 작성하신 후기가 있습니다.\n후기는 테마당 1번만 작성 가능합니다.");
		}

		function popupShow_update() {
			$("#review_form_pop_up_back_opacity_update").show();
			$("#review_form_pop_up_wrap_update").show();
		}
		
		$("#close_btn_box_update").click(function() {
			$("#review_form_pop_up_back_opacity_update").hide();
			$("#review_form_pop_up_wrap_update").hide();
		});
		
		function getToday(){
		    var date = new Date();
		    var year = date.getFullYear();
		    var month = ("0" + (1 + date.getMonth())).slice(-2);
		    var day = ("0" + date.getDate()).slice(-2);

		    return year + month + day;
		}
		
		var todaydate = getToday();
		console.log(todaydate);
		
		$('input[name=review_write_time]').attr('value', todaydate );
		$('input[name=todayDate_input]').attr('value', todaydate );
		//document.getElementById("todayDate").innerHTML=todaydate;
	</script>


	<script src="${pageContext.request.contextPath}/js/theme.review.input.form.js?ver=171755"></script>
	<script>
		function onlyNumber(obj) {
            $(obj).keyup(function(){
                $(this).val($(this).val().replace(/[^0-9]/g,""));
            }); 
        }

        function noneSpace(obj) {
            $(obj).keyup(function(){
                    $(this).val($(this).val().replace(/\s/g,""));
            }); 
        }

		function isEmpty(value) { 
            if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
                return true 
            } else { 
                return false 
            } 
        }
	</script>

	<!-- 플레이날짜 - 달력으로 선택하는거 -->
	<script>
		$(function() {
			$("#review_write_time").datepicker(
					{
						firstDay : 1,
						dateFormat : "yymmdd",
						prevText : '이전 달',
						nextText : '다음 달',
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
						showMonthAfterYear : true,
						yearSuffix : '년',
						
						maxDate: new Date()
					});
		});

		$(function() {
			$("#review_write_time_update").datepicker(
					{
						firstDay : 1,
						dateFormat : "yymmdd",
						prevText : '이전 달',
						nextText : '다음 달',
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
						showMonthAfterYear : true,
						yearSuffix : '년',
						
						maxDate: new Date()
					});
		});
		 
	</script>
	
	
	
	<script>
		$("#reviewPopupFrm").submit(function(e) {
			e.preventDefault();

			if(isEmpty($("#review_write_time").val()) === true) {
				alert("작성날짜가 없습니다.");
				return false;
			}

			if(isEmpty($("input[name='rated_star'][type='hidden']").val()) === true) {
				if(isEmpty($("#rated_star_inputed")) !== false) {
					alert("평점을 입력해주세요.");
					return false;
				} else {
					if($("#rated_star_inputed").val() === true || $("#rated_star_inputed").val() == "ture") {
						alert("평점을 입력해주세요.");
						return false;
					}
				}
			}

			/* 내가 만든거.. */
			if(isEmpty($("input[type='radio'][name='rating']:checked").val()) === true) {
				alert("테마의 별점을 선택해주세요.");
				return false;
			}

			if(isEmpty($("input[type='radio'][name='difficulty']:checked").val()) === true) {
				alert("테마의 난이도를 평가해주세요.");
				return false;
			}

			if($("input[type='radio'][name='success_n_fail']").is(":checked") === false) {
				alert("테마의 탈출여부를 입력해주세요.");
				return false;
			}

			if((isEmpty($("input[type=text][name='rated_escape_time_minute']").val()) === true) 
			&& (isEmpty($("input[type=number][name='rated_escape_time_second']").val()) === true)) {
				alert("테마의 남은 시간을 입력해주세요.");
				return false;
			}
		
			if(isEmpty($("input[type=text][name='rated_escape_time_minute']").val()) === true) {
				alert("테마의 남은 시간을 입력해주세요. (분)");
				return false;
			}

			if(isEmpty($("input[type=number][name='rated_escape_time_second']").val()) === true) {
				alert("테마의 남은 시간을 입력해주세요. (초)");
				return false;
			}
			
			/* if((isEmpty($("input[type=text][name='rated_escape_time_minute']").val() ) === true) 
			&& (isEmpty($("input[type=text][name='rated_escape_time_second']").val()) === true)) {
				$("input[type=text][name='rated_escape_time_minute']").val("");
				$("input[type=text][name='rated_escape_time_second']").val("");
			}

			if((isEmpty($("input[type=text][name='rated_escape_time_minute']").val()) === true) 
			&& (isEmpty($("input[type=text][name='rated_escape_time_second']").val()) !== true)) {
				$("input[type=text][name='rated_escape_time_minute']").val("00");
			}

			if((isEmpty($("input[type=text][name='rated_escape_time_minute']").val()) !== true) 
			&& (isEmpty($("input[type=text][name='rated_escape_time_second']").val()) === true)) {
				$("input[type=text][name='rated_escape_time_second']").val("00");
			} */

			if(isEmpty($("select[name='rated_escape_item']").val()) === true) {
				alert("힌트수를 선택해주세요.");
				return false;
			}

			if(isEmpty($("#reviewPopupFrm_content").val()) === true) {
				alert("테마 리뷰 내용을 입력해주세요.");
				return false;
			}

			var rated_escape_time_minute = $("input[type=text][name='rated_escape_time_minute']").val();
				if(rated_escape_time_minute.length == 1) {
					rated_escape_time_minute = '0' + rated_escape_time_minute
				}
			var rated_escape_time_second = $("input[type=number][name='rated_escape_time_second']").val();
			if(rated_escape_time_second.length == 1) {
				rated_escape_time_second = '0' + rated_escape_time_second
			}
			
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/theme/review_add",
				data: JSON.stringify({
					"reviewTno": ${theme.themeNo},
					"reviewPlaydate" : $("#review_write_time").val(),
					"reviewContent" : $("#reviewPopupFrm_content").val(),
					"reviewClear" : $("input[type='radio'][name='success_n_fail']:checked").val(),
					"reviewRating" : $("#rated_star").val(),
					"reviewHint" : $("select[name='rated_escape_item']").val(),
					"reviewTime" : rated_escape_time_minute+"분 "+rated_escape_time_second+"초",
					"reviewDifficult" : $("input[name='difficulty']:checked").val()
				}),
				contentType : "application/json",
				dataType: "text",
				success: function(text) {
					
					if(text=="success") {
						
						alert("리뷰가 등록되었습니다");
						location.reload();
					}
					
					
				}, 
				error: function(xhr) {
					alert("에러코드(INSERT) = "+xhr.status);
				}
			});
		});
	</script>
	
	<div class="container">
		
			<div class="container_inner section_detail section_detail_def_info"  style="height: 656px !important;">
				<div class="ratio_box def_info_ratio_box">
					<div class="def_info_ratio_box_inner">
						<div class="content">
							<div class="back" style="background-image:url(${pageContext.request.contextPath}/images/theme/detail/theme_img/${theme.themeImageLoc});"></div>
							<div class="back_effect"></div>
							
							<!-- 맨 위에 부분 전체 -->
							<div class="def_info_box" style="height: 656px !important; margin-top: 0px; margin-bottom: 0px;">
							
								<!-- 왼쪽 설명 부분 -->
								<div class="def_info_text_box">
									<div class="def_info_text_box_inner">
									
										<!-- 업체 정보, 테마 이름, 별점 출력 -->
										<div class="def_info_text_box_inner_1">
											<div class="def_info_text_row def_info_theme_loc">
												<p><span>${theme.themeCname }</span></p>
											</div>

											<div class="def_info_text_row def_info_theme_name">
												<p><span>${theme.themeName }</span></p>
											</div>

											<div class="def_info_text_row def_info_theme_rank">
												<p>
													<span>
														<c:if test="${0 <=themeRating and  themeRating < 0.5  }">
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/0star.png" alt="0" />
														</c:if>
														
														<c:if test="${0.5 <=themeRating and  themeRating < 1  }">
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/0.5star.png" alt="0.5" />
														</c:if>
														
														<c:if test="${1 <=themeRating and  themeRating < 1.5  }">
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/1star.png" alt="1" />
														</c:if>
														
														<c:if test="${1.5 <=themeRating and  themeRating < 2  }">
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/1.5star.png" alt="1.5" />
														</c:if>
														
														<c:if test="${2 <=themeRating and  themeRating < 2.5  }">
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/2star.png" alt="2" />
														</c:if>
														
														<c:if test="${2.5 <=themeRating and  themeRating < 3  }">	
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/2.5star.png" alt="2.5" />
														</c:if>
															
														<c:if test="${3 <=themeRating and  themeRating < 3.5  }">	
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/3star.png" alt="3" />
														</c:if>
														
														<c:if test="${3.5 <=themeRating and  themeRating < 4  }">	
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/3.5star.png" alt="3.5" />
														</c:if>
														
														<c:if test="${4 <=themeRating and  themeRating < 4.5  }">	
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/4star.png" alt="4" />
														</c:if>
														
														<c:if test="${4.5 <=themeRating and  themeRating < 5  }">	
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/4.5star.png" alt="4.5" />
														</c:if>
														
														<c:if test="${5 <=themeRating  }">	
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/5star.png" alt="5" />
														</c:if>
													
													</span>

													<span class="text">
														<c:if test="${themeRatingDouble eq null  }">
															등록된 리뷰가 없습니다
														</c:if>
														
														<c:if test="${themeRatingDouble ne null  }">
															${themeRating }
														</c:if>
													</span>
												</p>
											</div>
										</div>

										<!-- 제한시간, 장르, 난이도, 활동성, 추천인원 출력 -->
										<div class="def_info_text_box_inner_2">
											<div class="def_info_text_row def_info_theme_time">
												<p>
													<span class="tag">제한시간</span>
													<span class="value">${theme.themeLimit }</span>
												</p>
											</div>
											
											<div class="def_info_text_row def_info_theme_genre">
												<div class="def_info_text_cell def_info_theme_genre_inner">
													<p>
														<span class="tag">
															장르
														</span>

														<span class="value">
															${theme.themeGenre }
														</span>
													</p>
												</div>
											</div>
											
											<div class="def_info_text_row def_info_theme_difficulty_n_device">
												<div class="def_info_text_cell def_info_theme_difficulty">
													<p>
														<span class="tag">
															난이도
														</span>

														<span>
															<c:if test="${theme.themeDifficult eq '1'}">
																<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/1_difficulty_white4ef1.png" alt="2" />
															</c:if>
															
															<c:if test="${theme.themeDifficult eq '2'}">
																<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/2_difficulty_white4ef1.png" alt="2" />
															</c:if>

															<c:if test="${theme.themeDifficult eq '3'}">
																<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/3_difficulty_white4ef1.png" alt="3" />
															</c:if>

															<c:if test="${theme.themeDifficult eq '4'}">
																<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/4_difficulty_white4ef1.png" alt="4" />
															</c:if>

															<c:if test="${theme.themeDifficult eq '5'}">
																<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/5_difficulty_white4ef1.png" alt="5" />
															</c:if>
																
														</span>
													</p>
												</div>

											</div>

											<div class="def_info_text_row def_info_theme_activity">
												<p>
													<span class="tag">활동성</span>
													<span>
														
														<!-- 활동성 높음이면 -->
														<c:if test="${theme.themeActivity eq '높음'}"> 
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/many_on.png" alt="" />
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/normal_off.png" alt="" />
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/low_off.png" alt="" />
														</c:if>
														
														<!-- 활동성 보통이면 -->
														<c:if test="${theme.themeActivity eq '보통'}"> 
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/many_off.png" alt="" />
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/normal_on.png" alt="" />
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/low_off.png" alt="" />
														</c:if>
														
														<!-- 활동성 낮음이면 -->
														<c:if test="${theme.themeActivity eq '낮음'}"> 
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/many_off.png" alt="" />
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/normal_off.png" alt="" />
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/low_on.png" alt="" />
														</c:if>
													</span>
												</p>
											</div>

											<div class="def_info_text_row def_info_theme_allow_user">
												<p>
													<span class="tag">추천인원</span>
													<span>
														
														<c:if test="${themeRecommendfirst <=2 and  2 <= themeRecommendlast  }">
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/2_user.jpg" alt="2인" />
														</c:if>
														
														<c:if test="${themeRecommendfirst <=3 and  3 <= themeRecommendlast  }">
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/3_user.jpg" alt="3인" />
														</c:if>
														
														<c:if test="${themeRecommendfirst <=4 and  4 <= themeRecommendlast  }">
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/4_user.jpg" alt="4인" />
														</c:if>
														
														<c:if test="${ 5<= themeRecommendfirst or 5<= themeRecommendlast }">
															<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/5_user.jpg" alt="5인 이상" />
														</c:if>
														
													</span>
												</p>
											</div>	
										</div>

										<!-- 예약하기 버튼, 카페 정보 버튼, 찜하기 버튼 출력 -->
										<div class="def_info_text_box_inner_3">
											<button type="button" id="no_alliance_reserve" onclick="location.href='${pageContext.request.contextPath}/reserve';">예약하기</button>

											<span class="pipe" style="color:gray;">|</span>

											<a>
												<button type="button" id="cafe_info" style="color:white;" onclick="window.open('${cafe.cafeDomain}');">카페 정보</button>
												<!-- <span style="font-size: 14px;">카페 정보</span> -->
											</a>

										</div>
									</div>
								</div>

								<!-- 오른쪽 테마 표지 부분 (그림 출력) -->
								<div class="def_info_pic_box">
									<div class="def_info_pic_box_ratio">
										<div class="def_info_pic_box_ratio_inner">
											<div class="def_info_pic" style="background-image:url(${pageContext.request.contextPath}/images/theme/detail/theme_img/${theme.themeImageLoc});">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<script>
				if(window.innerWidth > 830) {

					var $defInfoPicWid = $('#def_info_pic').width();

					$("#def_info_pic_box_inner").css("width",$defInfoPicWid);
					$("#def_info_pic_gradient").css("width",$defInfoPicWid);
				}

				if(window.innerWidth <= 830) {
					var $defInfoPicWid = $('#def_info_pic').width();

					$("#def_info_inner").css("width",$defInfoPicWid);
					$("#def_info_inner").css("margin-left","auto");
					$("#def_info_inner").css("margin-right","auto");
				}

				$(window).resize(function() {

					if(window.innerWidth > 830) {

						var $defInfoPicWid = $('#def_info_pic').width();

						$("#def_info_pic_box_inner").css("width",$defInfoPicWid);
						$("#def_info_pic_gradient").css("width",$defInfoPicWid);
					}

					if(window.innerWidth < 830) {

						var $defInfoPicWid = $('#def_info_pic').width();

						$("#def_info_inner").css("width",$defInfoPicWid);
						$("#def_info_inner").css("margin-left","auto");
						$("#def_info_inner").css("margin-right","auto");
					}
				});
			</script>

			<!-- 소개 아래 부분 -->
			<div class="container_inner section_detail section_detail_more_info">
				<div class="fixing_wid fixing_wid_960">
				
					<!-- 왼쪽(소개랑 리뷰 부분) -->
					<div class="more_info_left">
					
						<!-- 소개 -->
						<div class="intro_in_more_info">
							<div class="intro_in_more_info_category">
								<div class="preface">
									<h2>소개</h2>
								</div>
								
								<!-- 소개 내용 적는 칸 -->
								<div class="desc">
									<p>
										<span>${theme.themeIntro }</span>
									</p>
								</div>
								
							</div>
						</div>

						<!-- 리뷰 -->
						<div id="review" class="review_in_more_info">
							<div class="preface">
								<h2>리뷰</h2>
							</div>

							<!-- 평점 + 후기 등록 칸 -->
							<div class="review_input_box">
								
								<!-- 사용자가 준 리뷰 평점 + 공지 -->
								<div class="review_input_box_caption">
									<div class="total_star">
										<p>
											<span>
												<!-- 사용자가 준 리뷰 평점 출력 -->
												<span class="text">
													<c:if test="${themeRatingDouble eq null  }">
														등록된 리뷰가 없습니다
													</c:if>
													
													<c:if test="${themeRatingDouble ne null  }">
														${themeRating }
													</c:if>
												</span>	
											</span>


											<span>
												<c:if test="${0 <=themeRating and  themeRating < 0.5  }">
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/0star.png" alt="0" />
												</c:if>
												
												<c:if test="${0.5 <=themeRating and  themeRating < 1  }">
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/0.5star.png" alt="0.5" />
												</c:if>
												
												<c:if test="${1 <=themeRating and  themeRating < 1.5  }">
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/1star.png" alt="1" />
												</c:if>
												
												<c:if test="${1.5 <=themeRating and  themeRating < 2  }">
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/1.5star.png" alt="1.5" />
												</c:if>
												
												<c:if test="${2 <=themeRating and  themeRating < 2.5  }">
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/2star.png" alt="2" />
												</c:if>
												
												<c:if test="${2.5 <=themeRating and  themeRating < 3  }">	
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/2.5star.png" alt="2.5" />
												</c:if>
													
												<c:if test="${3 <=themeRating and  themeRating < 3.5  }">	
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/3star.png" alt="3" />
												</c:if>
												
												<c:if test="${3.5 <=themeRating and  themeRating < 4  }">	
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/3.5star.png" alt="3.5" />
												</c:if>
												
												<c:if test="${4 <=themeRating and  themeRating < 4.5  }">	
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/4star.png" alt="4" />
												</c:if>
												
												<c:if test="${4.5 <=themeRating and  themeRating < 5  }">	
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/4.5star.png" alt="4.5" />
												</c:if>
												
												<c:if test="${5 <=themeRating  }">	
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/5star.png" alt="5" />
												</c:if>
											</span>
										</p>
									</div>

									<div class="notice">
										<p>
											<span class="icon">
												<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/megaphone.png" alt="" style="width: 20px;"/>
											</span>

											<span class="text">
												&nbsp;&nbsp;테마 스포일러나 근거없는 비방글은 삭제될 수 있습니다.
											</span>
										</p>
									</div>
								</div>
								
								<!-- 후기 등록 칸 -->
								<div class="reviewFrm_box">
									<form id="reviewFrm" class="reviewFrm" name="reviewFrm" method="post">

										<input type="hidden" name="star" value="" />
										
										<!-- 후기 등록 내부 칸 (후기 등록 버튼 제외) -->
										<div class="reviewFrm_inner">
											<div class="review_star_box" style="height: 30px;">
												<div class="review_info">
													<div class="writer">
														<img src="${pageContext.request.contextPath}/images/theme/detail/review/login_none.jpg" alt="" style="vertical-align: middle;"/>
														<span class="text">
															&nbsp;
															<c:if test="${member ne null }">
																${member.memberNick }
															</c:if>
															
															<c:if test="${member eq null }">
																로그인 후 이용해주세요
															</c:if>
														</span>
													</div>

													<!-- <div class="datetime" id="todayDate">
														오늘 날짜 출력
														<input type="text" id="todayDate_input" name="todayDate_input" value="" style="border: none;"/>
													</div> -->
												</div>

												<div class="rating_star login_layer_event" style="margin-right: 21px;">
													<img src="${pageContext.request.contextPath}/images/theme/detail/review/5star.png" alt="" />
												</div>
											</div>
												
											<c:if test="${member eq null  }">		
												<a class="m_login login_layer_open" href="javascript:void(0);" style="text-decoration: none !important;">			
												<textarea class="review_content login_layer_event" readonly="readonly" placeholder="이 테마의 리뷰를 남겨주세요 !" onclick="" style="width: 97%; margin-top: 5px;"></textarea>				
												</a>
											</c:if>	
															
											<c:if test="${member ne null  }">
												<c:if test="${myreview ne null  }">
													<textarea class="review_content login_layer_event" readonly="readonly" placeholder="이미 작성하신 리뷰가 있습니다. 테마당 한개의 리뷰만 작성 가능합니다" onclick="noreview()" style="width: 97%; margin-top: 5px;"></textarea>  
												</c:if>		
												
												<c:if test="${myreview eq null  }">		
													<textarea class="review_content login_layer_event" readonly="readonly" placeholder="이 테마의 리뷰를 남겨주세요 !" onclick="popupShow()" style="width: 97%; margin-top: 5px;"></textarea>  
												</c:if>
											</c:if>
										</div>

										<!-- 후기 등록 버튼 -->
							  			<div class="reviewFrm_btn_box" >
							  				<!-- 비로그인 회원이면 -->
							  				<c:if test="${member eq null  }">
							  					<a class="m_login login_layer_open" href="javascript:void(0);" style="text-decoration: none; color:black;">
							  					<button type="button" class="reviewFrm_submit login_layer_event" >후기 등록</button>
							  					</a>
							  				</c:if>	

							  				<c:if test="${member ne null  }">
							  					<c:if test="${myreview ne null  }">
													<button type="button" class="reviewFrm_submit login_layer_event" onclick="noreview()">후기 등록</button>
												</c:if>	
												
												<c:if test="${myreview eq null  }">
							  						<button type="button" class="reviewFrm_submit login_layer_event" onclick="popupShow()">후기 등록</button>
							  					</c:if>	
							  				</c:if>	
							  			
							  			</div>
									</form>
								</div>
							</div>

							<!-- 정렬 버튼 있는 칸 -->
							<div class="theme_review_sort">
								<!-- 최신순 정렬 -->
								<a href="detail6d2d.html?theme=3623&amp;sort=desc">
									<img src="${pageContext.request.contextPath}/images/theme/detail/review/desc_on.png" alt="" />
								</a>

								<!-- 평점순 정렬 -->								
								<a href="detail9dde.html?theme=3623&amp;sort=review">
									<img src="${pageContext.request.contextPath}/images/theme/detail/review/review_off.png" alt="" />
								</a>

							</div>

						
							<!-- 사용자 리뷰 보여지는 칸 -->
								<c:choose>
									<c:when test="${empty(reviewList) }">
										<div class="memb_review_box default" style="text-align: center;">
											<span>아직 등록된 리뷰가 없습니다. <br>리뷰를 등록해주세요 ! ^^ </span>
										</div>
									</c:when>
									
									<%-- 리뷰 뽑는 칸 --%>
									<c:otherwise>
									
									<%-- 나의 리뷰 뽑는 칸 --%>
									<c:if test="${member ne null && myreview eq null  }">
										<div class="memb_review_box default" style="text-align: center;">
											<span>이 테마에 대한 나의 리뷰가 존재하지 않습니다. <br>리뷰를 등록해주세요 ! ^^ </span>
										</div>
										<hr>
									</c:if>
									
									
									<c:if test="${member ne null && myreview ne null  }">
									<p style="font-weight: bold;"> [ 나의 리뷰 ]</p>
									<div class="memb_review_box default">
									
								<div class="memb_reivew">
									<%-- 리뷰 - 위에 정보 부분 --%>
									<div class="review_top">
										<%-- 닉네임, 난이도, 성공여부 --%>
										<div class="review_writer_or_star">
											<div class="writer">
												<span class="name text">
													<a href="#mypage#">${myreview.reviewNick  }</a>
												</span>

												<span class="level img">
													<c:if test="${myreview.reviewDifficult eq 'veryEasy' }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/review/difficulty_very_easy4ef1.png?ver=171755" alt="" />
													</c:if>
													
													<c:if test="${myreview.reviewDifficult eq 'easy' }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/review/difficulty_easy4ef1.png?ver=171755" alt="" />
													</c:if>
													
													<c:if test="${myreview.reviewDifficult eq 'normal' }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/review/difficulty_normal4ef1.png?ver=171755" alt="" />
													</c:if>
													
													<c:if test="${myreview.reviewDifficult eq 'hard' }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/review/difficulty_hard4ef1.png?ver=171755" alt="" />
													</c:if>
													
													<c:if test="${myreview.reviewDifficult eq 'veryHard' }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/review/difficulty_very_hard4ef1.png?ver=171755" alt="" />
													</c:if>

												</span>

												<span class="experi img">
													<c:if test="${myreview.reviewClear eq '성공' }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/review/experi_1.png" alt="" />
													</c:if>

													<c:if test="${myreview.reviewClear eq '실패' }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/review/experi_2.png" alt="" />
													</c:if>
													<span>${myreview.reviewClear  }</span>
												</span>
											</div>
										</div>

										<%-- 별점 부분 --%>
										<div class="star" style="margin-right: 20px;">
											<span class="pic">
											
												<c:if test="${myreview.reviewRating eq '0' }">
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/0star.png" alt="0" />
												</c:if>
												
												<c:if test="${myreview.reviewRating eq '0.5'  }">
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/0.5star.png" alt="0.5" />
												</c:if>
												
												<c:if test="${myreview.reviewRating eq '1.0'  }">
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/1star.png" alt="1" />
												</c:if>
												
												<c:if test="${myreview.reviewRating eq '1.5'  }">
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/1.5star.png" alt="1.5" />
												</c:if>
												
												<c:if test="${myreview.reviewRating eq '2.0'  }">
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/2star.png" alt="2" />
												</c:if>
												
												<c:if test="${myreview.reviewRating eq '2.5'  }">	
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/2.5star.png" alt="2.5" />
												</c:if>
													
												<c:if test="${myreview.reviewRating eq '3.0'  }">	
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/3star.png" alt="3" />
												</c:if>
												
												<c:if test="${myreview.reviewRating eq '3.5'  }">
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/3.5star.png" alt="3.5" />
												</c:if>
												
												<c:if test="${myreview.reviewRating eq '4.0'  }">	
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/4star.png" alt="4" />
												</c:if>
												
												<c:if test="${myreview.reviewRating eq '4.5'  }">	
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/4.5star.png" alt="4.5" />
												</c:if>
												
												<c:if test="${myreview.reviewRating eq '5.0'  }">
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/5star.png" alt="5" />
												</c:if>
											
											
											</span>
											<span class="text">${myreview.reviewRating }</span>
											<span class="tag">점</span>
										</div>

										<%-- 플레이날짜, 남은시간, 힌트사용 --%>
										<div class="review_write_datetime">
											<span class="datetime text">플레이날짜 : ${myreview.reviewPlaydate }</span>
											
											<span class="pipe">| 남은시간 : </span>
											<span class="result_time text">${myreview.reviewTime  }</span>

											<span class="pipe">| 힌트사용 : </span>
											<span class="result_time text">${myreview.reviewHint  }</span>

											<span class="pipe">| 리뷰 작성일 : </span>
											<span class="result_time text">
												<c:set var="reviewDate" value="${myreview.reviewDate}" />
												${fn:substring(reviewDate,0,4)}${fn:substring(reviewDate,5,7)}${fn:substring(reviewDate,8,10)}
											</span>
										</div>
									</div>
									

									<%-- -- 리뷰 내용 출력되는 칸 --> --%>
									<div class="review_bottom">
										<p>
											<span>
												${myreview.reviewContent  }
											</span>
										</p>
									</div>
								</div>

								<div class="reivew_agent" style="margin-top: 0px !important;">
									<c:if test="${member.memberNick eq myreview.reviewNick }">
										<button type="button" class="review_modify" id="review_modify" onclick='modify(${myreview.reviewNo });'>수정</button>
										<button type="button" class="review_delete" id="review_delete" onclick='remove(${myreview.reviewNo });'>삭제</button>
									</c:if>
								</div>
							</div>
									
									<hr>
									
									</c:if>
									
									
									<!-- 전체 리뷰 뽑는 칸 -->
									<img src="${pageContext.request.contextPath}/images/theme/detail/review/review_logo.png" style="width: 170px;" alt="" />
										<c:forEach var="review" items="${reviewList }">
							<div class="memb_review_box default">
									
								<div class="memb_reivew">
									<!-- 리뷰 - 위에 정보 부분 -->
									<div class="review_top">
										<!-- 닉네임, 난이도, 성공여부 -->
										<div class="review_writer_or_star">
											<div class="writer">
												<span class="name text">
													<a href="#mypage#">${review.reviewNick  }</a>
												</span>

												<span class="level img">
													<c:if test="${review.reviewDifficult eq 'veryEasy' }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/review/difficulty_very_easy4ef1.png?ver=171755" alt="" />
													</c:if>
													
													<c:if test="${review.reviewDifficult eq 'easy' }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/review/difficulty_easy4ef1.png?ver=171755" alt="" />
													</c:if>
													
													<c:if test="${review.reviewDifficult eq 'normal' }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/review/difficulty_normal4ef1.png?ver=171755" alt="" />
													</c:if>
													
													<c:if test="${review.reviewDifficult eq 'hard' }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/review/difficulty_hard4ef1.png?ver=171755" alt="" />
													</c:if>
													
													<c:if test="${review.reviewDifficult eq 'veryHard' }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/review/difficulty_very_hard4ef1.png?ver=171755" alt="" />
													</c:if>

												</span>

												<span class="experi img">
													<c:if test="${review.reviewClear eq '성공' }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/review/experi_1.png" alt="" />
													</c:if>

													<c:if test="${review.reviewClear eq '실패' }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/review/experi_2.png" alt="" />
													</c:if>
													<span>${review.reviewClear  }</span>
												</span>
											</div>
										</div>

										<!-- 별점 부분 -->
										<div class="star" style="margin-right: 20px;">
											<span class="pic">
											
												<c:if test="${review.reviewRating eq '0' }">
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/0star.png" alt="0" />
												</c:if>
												
												<c:if test="${review.reviewRating eq '0.5'  }">
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/0.5star.png" alt="0.5" />
												</c:if>
												
												<c:if test="${review.reviewRating eq '1.0'  }">
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/1star.png" alt="1" />
												</c:if>
												
												<c:if test="${review.reviewRating eq '1.5'  }">
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/1.5star.png" alt="1.5" />
												</c:if>
												
												<c:if test="${review.reviewRating eq '2.0'  }">
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/2star.png" alt="2" />
												</c:if>
												
												<c:if test="${review.reviewRating eq '2.5'  }">	
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/2.5star.png" alt="2.5" />
												</c:if>
													
												<c:if test="${review.reviewRating eq '3.0'  }">	
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/3star.png" alt="3" />
												</c:if>
												
												<c:if test="${review.reviewRating eq '3.5'  }">
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/3.5star.png" alt="3.5" />
												</c:if>
												
												<c:if test="${review.reviewRating eq '4.0'  }">	
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/4star.png" alt="4" />
												</c:if>
												
												<c:if test="${review.reviewRating eq '4.5'  }">	
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/4.5star.png" alt="4.5" />
												</c:if>
												
												<c:if test="${review.reviewRating eq '5.0'  }">
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/5star.png" alt="5" />
												</c:if>
											
											
											</span>
											<span class="text">${review.reviewRating }</span>
											<span class="tag">점</span>
										</div>

										<!-- 플레이날짜, 남은시간, 힌트사용 -->
										<div class="review_write_datetime">
											<span class="datetime text">플레이날짜 : ${review.reviewPlaydate }</span>
											
											<span class="pipe">| 남은시간 : </span>
											<span class="result_time text">${review.reviewTime  }</span>

											<span class="pipe">| 힌트사용 : </span>
											<span class="result_time text">${review.reviewHint  }</span>

											<span class="pipe">| 리뷰 작성일 : </span>
											<span class="result_time text">
												<c:set var="reviewDate" value="${review.reviewDate}" />
												${fn:substring(reviewDate,0,4)}${fn:substring(reviewDate,5,7)}${fn:substring(reviewDate,8,10)}
											</span>
										</div>
									</div>

									<!-- 리뷰 내용 출력되는 칸 -->
									<div class="review_bottom">
										<p>
											<span>
												${review.reviewContent  }
											</span>
										</p>
									</div>
								</div>

								<div class="reivew_agent" style="margin-top: 0px !important;">
									<c:if test="${member.memberNick eq review.reviewNick }">
										<button type="button" class="review_modify" id="review_modify" onclick='modify(${review.reviewNo });'>수정</button>
										<button type="button" class="review_delete" id="review_delete" onclick='remove(${review.reviewNo });'>삭제</button>
									</c:if>
								</div>
							</div>
								
										</c:forEach>
									</c:otherwise>
								</c:choose>
							<!--
								<div class="reivew_agent" style="margin-top: 0px;">
									<div class="review_modify_btn">
										<button type="button" class="review_modify">
											<span class="value">수정</span>
										</button>
									</div> 

									<div class="review_delete_btn">
										<button type="button" class="review_delete">
											<span class="value">삭제</span>
										</button>
									</div>
									
								</div>
								
								-->
							<!-- </div> -->



						</div>
					</div>
					

<script type="text/javascript">
	$("#review_modify").click(function() {
		
	});

	
	function remove(reviewNo) {
		//alert(reviewNo);
		
		if(confirm("후기를 정말로 삭제하시겠습니까?")) {
			
			
			$.ajax({
				type: "delete",
				url: "${pageContext.request.contextPath}/theme/review_remove/"+reviewNo,
				dataType: "text",
				success: function (text) {
					if(text=="success") {
						alert("작성하신 후기가 삭제되었습니다.");
						location.reload();
					}
				}, 
				error: function(xhr) {
					alert("에러코드(DELETE) = "+xhr.status);
				}
			});			
			
		}
		
	}

	
	function modify(reviewNo) {
		//alert(reviewNo);
		
		popupShow_update();
		
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath}/theme/review_modify_view/"+reviewNo,
			dataType: "json",
			success: function(review) {
				
				$("#updateNum").val(review.reviewNo);
				//alert("업데이트 테스트" + reviewNo );
				
				// 원래 썼던 리뷰값으로 value 바꿔주기
				$("#review_write_time_update").val(review.reviewPlaydate);
				$("#review_write_nickname").val(review.reviewNick);
				$("#reviewPopupFrm_content_update").val(review.reviewContent);
				
				//$("input[type='radio'][name='success_n_fail_update']:checked").val(review.reviewClear);
				
				//$("#rated_star_update").val(review.reviewRating);
				
				$("select[name='rated_escape_item_update']").val(review.reviewHint);
				$("input[type=text][name='rated_escape_time_minute_update']").val(review.reviewTime.substring(0,2));
				$("input[type=number][name='rated_escape_time_second_update']").val(review.reviewTime.substring(4,6));
				
				//$("input[name='difficulty_update']:checked").val(review.reviewDifficult);
			
				$(":radio[name='success_n_fail_update'][value='" + review.reviewClear + "']").attr('checked', true);
				$(":radio[name='difficulty_update'][value='" + review.reviewDifficult + "']").attr('checked', true);
				$(":radio[name='rating_update'][value='" + review.reviewRating + "']").attr('checked', true);
				
				
			}, 
			error: function(xhr) {
				alert("에러코드(SELECT) = "+xhr.status);
			}
		});			
			
		
	}


	$("#reviewPopupFrm_update").submit(function(e) {
		e.preventDefault();

		if(isEmpty($("#review_write_time_update").val()) === true) {
			alert("작성날짜가 없습니다.");
			return false;
		}

		if(isEmpty($("input[name='rated_star'][type='hidden']").val()) === true) {
			if(isEmpty($("#rated_star_inputed")) !== false) {
				alert("평점을 입력해주세요.");
				return false;
			} else {
				if($("#rated_star_inputed").val() === true || $("#rated_star_inputed").val() == "ture") {
					alert("평점을 입력해주세요.");
					return false;
				}
			}
		}

		/* 내가 만든거.. */
		if(isEmpty($("input[type='radio'][name='rating_update']:checked").val()) === true) {
			//alert("테마의 별점을 선택해주세요.");
			//return false;
		}

		if(isEmpty($("input[type='radio'][name='difficulty_update']:checked").val()) === true) {
			alert("테마의 난이도를 평가해주세요.");
			return false;
		}

		if($("input[type='radio'][name='success_n_fail_update']").is(":checked") === false) {
			alert("테마의 탈출여부를 입력해주세요.");
			return false;
		}

		if((isEmpty($("input[type=text][name='rated_escape_time_minute_update']").val()) === true) 
		&& (isEmpty($("input[type=number][name='rated_escape_time_second_update']").val()) === true)) {
			alert("테마의 남은 시간을 입력해주세요.");
			return false;
		}
	
		if(isEmpty($("input[type=text][name='rated_escape_time_minute_update']").val()) === true) {
			alert("테마의 남은 시간을 입력해주세요. (분)");
			return false;
		}

		if(isEmpty($("input[type=number][name='rated_escape_time_second_update']").val()) === true) {
			alert("테마의 남은 시간을 입력해주세요. (초)");
			return false;
		}
		
		/* if((isEmpty($("input[type=text][name='rated_escape_time_minute']").val() ) === true) 
		&& (isEmpty($("input[type=text][name='rated_escape_time_second']").val()) === true)) {
			$("input[type=text][name='rated_escape_time_minute']").val("");
			$("input[type=text][name='rated_escape_time_second']").val("");
		}

		if((isEmpty($("input[type=text][name='rated_escape_time_minute']").val()) === true) 
		&& (isEmpty($("input[type=text][name='rated_escape_time_second']").val()) !== true)) {
			$("input[type=text][name='rated_escape_time_minute']").val("00");
		}

		if((isEmpty($("input[type=text][name='rated_escape_time_minute']").val()) !== true) 
		&& (isEmpty($("input[type=text][name='rated_escape_time_second']").val()) === true)) {
			$("input[type=text][name='rated_escape_time_second']").val("00");
		} */

		if(isEmpty($("select[name='rated_escape_item_update']").val()) === true) {
			alert("힌트수를 선택해주세요.");
			return false;
		}

		if(isEmpty($("#reviewPopupFrm_content_update").val()) === true) {
			alert("테마 리뷰 내용을 입력해주세요.");
			return false;
		}
		
		var rated_escape_time_minute_update = $("input[type=text][name='rated_escape_time_minute_update']").val();
			if(rated_escape_time_minute_update.length == 1) {
				rated_escape_time_minute_update = '0' + rated_escape_time_minute_update
			}
			
		var rated_escape_time_second_update = $("input[type=number][name='rated_escape_time_second_update']").val();
		if(rated_escape_time_second_update.length == 1) {
			rated_escape_time_second_update = '0' + rated_escape_time_second_update
		}
		
		$.ajax({
			type: "put",
			url: "${pageContext.request.contextPath}/theme/review_modify",
			data: JSON.stringify({
				"reviewNo" : $("#updateNum").val(),
				"reviewTno": ${theme.themeNo},
				"reviewPlaydate" : $("#review_write_time_update").val(),
				"reviewContent" : $("#reviewPopupFrm_content_update").val(),
				"reviewClear" : $("input[type='radio'][name='success_n_fail_update']:checked").val(),
				//"reviewRating" : $("#rated_star_update").val(),
				"reviewRating" : '4.5',
				"reviewHint" : $("select[name='rated_escape_item_update']").val(),
				"reviewTime" : $("input[type=text][name='rated_escape_time_minute_update']").val() +"분 "+$("input[type=number][name='rated_escape_time_second_update']").val()+"초",
				"reviewDifficult" : $("input[name='difficulty_update']:checked").val()
			}),
			contentType : "application/json",
			dataType: "text",
			success: function(text) {
				
				if(text=="success") {
					
					alert("리뷰가 변경되었습니다");
					location.reload();
				}
				
				
			}, 
			error: function(xhr) {
				alert("에러코드(UPDATE) = "+xhr.status);
			}
		});
	});
	
	
</script>





					<!-- 오른쪽 부분 (이 업체의 다른 테마) -->
					<div class="more_info_right">
						<div class="title">
							<h2>
								이 업체의 다른 테마
							</h2>
						</div>
						
						<%-- <!-- 이 업체의 다른 테마가 없을 경우, 같은 테마(상세페이지)를 한번 더 출력 -->
						<c:if test="${Othertheme1 eq null and Othertheme2 eq null  }">
							<div class="orther_theme_in_more_info">
								<div class="orther_theme_in_more_info_inner">
									<div class="content">
										<div class="pic" style="background-image:url(../../yologuys.com/Escape_img/theme/3623.jpg);"><a href="detail040d.html?theme=3623"></a></div>
	
										<div class="info">
											<p>
												<span class="text">
													<a href="detail040d.html?theme=3623">
														귀문기담
													</a>
												</span>
											</p>
	
											<p>
												<span class="text">
													공포
												</span>
	
												<span class="pipe">|</span>
	
												<span class="tag">평점</span>
	
												<span class="img">
													<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/3.5star.png" alt="1" />
												</span>
												<span class="star_text">
													3.9
												</span>
											</p>
										</div>
									</div>
								</div>
							</div>
						</c:if> --%>

						<c:if test="${Othertheme1 ne null  }">
							<div class="orther_theme_in_more_info">
								<div class="orther_theme_in_more_info_inner">
									<div class="content">
										<div class="pic" style="background-image:url(${pageContext.request.contextPath}/images/theme/detail/theme_img/${Othertheme1.themeImageLoc});"><a href="${Othertheme1.themeNo }"></a></div>
	
										<div class="info">
											<p>
												<span class="text">
													<a href="${Othertheme1.themeNo }">
														${Othertheme1.themeName }
													</a>
												</span>
											</p>
	
											<p>
												<span class="text">
													${Othertheme1.themeGenre }
												</span>
	
												<span class="pipe">|</span>
	
												<span class="tag">평점</span>
	
												<span class="img">
												
													<c:if test="${0 <=themeRating1 and  themeRating1 < 0.5  }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/0star.png" alt="0" />
													</c:if>
													
													<c:if test="${0.5 <=themeRating1 and  themeRating1 < 1  }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/0.5star.png" alt="0.5" />
													</c:if>
													
													<c:if test="${1 <=themeRating1 and  themeRating1 < 1.5  }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/1star.png" alt="1" />
													</c:if>
													
													<c:if test="${1.5 <=themeRating1 and  themeRating1 < 2  }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/1.5star.png" alt="1.5" />
													</c:if>
													
													<c:if test="${2 <=themeRating1 and  themeRating1 < 2.5  }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/2star.png" alt="2" />
													</c:if>
													
													<c:if test="${2.5 <=themeRating1 and  themeRating1 < 3  }">	
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/2.5star.png" alt="2.5" />
													</c:if>
														
													<c:if test="${3 <=themeRating1 and  themeRating1 < 3.5  }">	
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/3star.png" alt="3" />
													</c:if>
													
													<c:if test="${3.5 <=themeRating1 and  themeRating1 < 4  }">	
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/3.5star.png" alt="3.5" />
													</c:if>
													
													<c:if test="${4 <=themeRating1 and  themeRating1 < 4.5  }">	
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/4star.png" alt="4" />
													</c:if>
													
													<c:if test="${4.5 <=themeRating1 and  themeRating1 < 5  }">	
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/4.5star.png" alt="4.5" />
													</c:if>
													
													<c:if test="${5 <=themeRating1  }">	
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/5star.png" alt="5" />
													</c:if>
													
												</span>
												<span class="star_text">
													<c:if test="${themeRatingDouble1 eq null  }">
														(리뷰 없음)
													</c:if>
													
													<c:if test="${themeRatingDouble1 ne null  }">
														${themeRating1 }
													</c:if>
												</span>
											</p>
										</div>
									</div>
								</div>
							</div>
						</c:if>
						
						<c:if test="${Othertheme1 ne null and Othertheme2 ne null  }">
							<div class="orther_theme_in_more_info">
								<div class="orther_theme_in_more_info_inner">
									<div class="content">
										<div class="pic" style="background-image:url(${pageContext.request.contextPath}/images/theme/detail/theme_img/${Othertheme2.themeImageLoc});"><a href="${Othertheme2.themeNo }"></a></div>
	
										<div class="info">
											<p>
												<span class="text">
													<a href="${Othertheme2.themeNo }">
														${Othertheme2.themeName }
													</a>
												</span>
											</p>
	
											<p>
												<span class="text">
													${Othertheme2.themeGenre }
												</span>
	
												<span class="pipe">|</span>
	
												<span class="tag">평점</span>
	
												<span class="img">
												
													<c:if test="${0 <=themeRating2 and  themeRating2 < 0.5  }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/0star.png" alt="0" />
													</c:if>
													
													<c:if test="${0.5 <=themeRating2 and  themeRating2 < 1  }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/0.5star.png" alt="0.5" />
													</c:if>
													
													<c:if test="${1 <=themeRating2 and  themeRating2 < 1.5  }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/1star.png" alt="1" />
													</c:if>
													
													<c:if test="${1.5 <=themeRating2 and  themeRating2 < 2  }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/1.5star.png" alt="1.5" />
													</c:if>
													
													<c:if test="${2 <=themeRating2 and  themeRating2 < 2.5  }">
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/2star.png" alt="2" />
													</c:if>
													
													<c:if test="${2.5 <=themeRating2 and  themeRating2 < 3  }">	
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/2.5star.png" alt="2.5" />
													</c:if>
														
													<c:if test="${3 <=themeRating2 and  themeRating2 < 3.5  }">	
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/3star.png" alt="3" />
													</c:if>
													
													<c:if test="${3.5 <=themeRating2 and  themeRating2 < 4  }">	
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/3.5star.png" alt="3.5" />
													</c:if>
													
													<c:if test="${4 <=themeRating2 and  themeRating2 < 4.5  }">	
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/4star.png" alt="4" />
													</c:if>
													
													<c:if test="${4.5 <=themeRating2 and  themeRating2 < 5  }">	
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/4.5star.png" alt="4.5" />
													</c:if>
													
													<c:if test="${5 <=themeRating2  }">	
														<img src="${pageContext.request.contextPath}/images/theme/detail/def_info/5star.png" alt="5" />
													</c:if>
													
												</span>
												<span class="star_text">
													<c:if test="${themeRatingDouble2 eq null  }">
														(리뷰 없음)
													</c:if>
													
													<c:if test="${themeRatingDouble2 ne null  }">
														${themeRating2 }
													</c:if>
												</span>
											</p>
										</div>
									</div>
								</div>
							</div>
						</c:if>
						
					</div>
				</div>
			</div>

	</div>

	<script>
		var $fontFitDiv = $('.font_fit_div');

		$(document).ready(function() {

			var $heiFontFitDiv = $fontFitDiv.height();

			$fontFitDiv.css({
				'font-size' : ($heiFontFitDiv / 2) + 'px',
				'line-height' : $heiFontFitDiv + 'px'
			});
		});

		$(window).resize(function () {

			var $heiFontFitDiv = $fontFitDiv.height();

			$fontFitDiv.css({
				'font-size' : ($heiFontFitDiv / 2) + 'px',
				'line-height' : $heiFontFitDiv + 'px'
			});
		});
	</script>

	<script>
		function onlyNumber(obj) {
            $(obj).keyup(function(){
                $(this).val($(this).val().replace(/[^0-9]/g,""));
            }); 
        }

        function noneSpace(obj) {
            $(obj).keyup(function(){
                    $(this).val($(this).val().replace(/\s/g,""));
            }); 
        }

		function isEmpty(value) { 
            if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
                return true 
            } else { 
                return false 
            } 
        }

        function getParameterByName(name,url) {
		    if(!url) url = window.location.href;
		    name = name.replace(/[\[\]]/g,"\\$&");
		    var regex = new RegExp("[?&]"+name+"(=([^&#]*)|&|#|&)"),
		        results = regex.exec(url);

		    if(isEmpty(results) === true) {
		    	return null;
		    } else {
		    	return results[2];
			}
		}
	</script>

	
	<script src="${pageContext.request.contextPath}/js/review_popup.js?ver=171755"></script>


	<script>

		$("body").on("click","#popup_close",function() {

			$('body').css("overflow","auto");
			$("#popup_layer_back").css("display","none");
			$("#popup_layer").css("display","none");

			var agent = navigator.userAgent.toLowerCase();
			if((navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1)) {
				//ie
			    $("#popup_layer_back").removeClass("ie");
			} else {
			     //not ie
			     $(".container").removeClass("not_ie");
			     $("#popup_layer_back").removeClass("not_ie");
			}
		});

		$("body").on("click","#popup_layer_back",function() {
			$('body').css("overflow","auto");
			$("#popup_layer_back").css("display","none");
			$("#popup_layer").css("display","none");

			var agent = navigator.userAgent.toLowerCase();
			if((navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1)) {
				//ie
			    $("#popup_layer_back").removeClass("ie");
			} else {
			     //not ie
			     $(".container").removeClass("not_ie");
			     $("#popup_layer_back").removeClass("not_ie");
			}
		});
	</script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/roomescape.ajax.theme.rank.ui.js?ver=171755"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/roomescape.ajax.theme.review.recommend.js?ver=171755"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/roomescape.ajax.theme.review.report.js?ver=171755"></script>
</body>

</html>