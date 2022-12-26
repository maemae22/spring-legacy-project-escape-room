$(".review_report").click(function() {

	$.ajax({
		async: false,
		type: "POST",
		url: $home_url+"/bbs/theme/ajax.review.report.modal.get.php",
		data: {
			"theme_review_id" : $(this).data("review-id"),
			"theme_review_user" : $(this).data("reivew-user")
		},
		dataType: "json",
		error: function(request,status,error) {
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        },
		success: function(data) {

			var $result = eval(data);

			console.log($result);

			if($result.ajax_result !== false) {
				$("body").append($result.ajax_result);

				$("html").css("overflow","hidden");
				var animation = new TimelineLite();
				$("html").css("overflow","hidden");
				animation.to('#m_main_menu', 0.2, {css:{className:'-=active',display:'none'},delay:0,ease:Linear.easeNone});

				$("body").css("overflow","hidden");
				$("#report_wrap_back").css("display","block");
				$("#report_wrap").css("display","block");
				
				var agent = navigator.userAgent.toLowerCase();
				if((navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1)) {
					//ie
				    $("#report_wrap_back").addClass("ie");
				} else {
				     //not ie
				    $(".container").addClass("not_ie");
				    $("#report_wrap_back").addClass("not_ie");
				}
			} else {
				if($result.msg.indexOf("로그인") !== -1) {
					$("body").css("overflow","hidden");
					$("#login_wrap_back").css("display","block");
					$("#login_wrap").css("display","block");
					
					var agent = navigator.userAgent.toLowerCase();
					if((navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1)) {
						//ie
					    $("#login_wrap_back").addClass("ie");
					} else {
					     //not ie
					    $(".container").addClass("not_ie");
					    $("#login_wrap_back").addClass("not_ie");
					}
				}
			}	
		}
	});
});

$("body").on("click","#report_layer_close",function() {

	$("html").css("overflow","auto");
	$('body').css("overflow","auto");

	var agent = navigator.userAgent.toLowerCase();
	if((navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1)) {
		//ie
	    $("#report_wrap_back").removeClass("ie");
	} else {
	     //not ie
	     $(".container").removeClass("not_ie");
	     $("#report_wrap_back").removeClass("not_ie");
	}

	$("#report_wrap").remove();
	$("#report_wrap_back").remove();
});

$("body").on("click","#report_wrap_back",function() {

	$("html").css("overflow","auto");
	$('body').css("overflow","auto");

	var agent = navigator.userAgent.toLowerCase();
	if((navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1)) {
		//ie
	    $("#report_wrap_back").removeClass("ie");
	} else {
	    //not ie
	    $(".container").removeClass("not_ie");
	    $("#report_wrap_back").removeClass("not_ie");
	}
	$("#report_wrap").remove();
	$(this).remove();
});

$("body").on("click","#review_reporting",function() {
	$thisReviewReportingBtn = $(this);

	if(isEmpty($(this).data("review-id")) !== false ) {
		alert("올바른 요청이 아닙니다.1");
		return false;
	}

	if(isEmpty($(this).data("review-user")) !== false) {
		alert("올바른 요청이 아닙니다.2");
		return false;
	}

	if(isEmpty($(this).data("review-id")) !== false) {
		alert("올바른 요청이 아닙니다.3");
		return false;
	}	

	if(isEmpty($("#report_content").val()) !== false) {
		alert("신고 사유를 작성해주세요.4");
		return false;
	}

	$.ajax({
		async: false,
		type: "POST",
		url: $home_url+"/bbs/theme/ajax.review.report.ok.php",
		data: {
			"theme_id" : getParameterByName("theme"),
			"theme_review_id" : $(this).data("review-id"),
			"theme_review_user" : $(this).data("review-user"),
			"report_content" : $("#report_content").val()
		},
		dataType: "json",
		error: function(request,status,error) {
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        },
		success: function(data) {

			var $result = eval(data);

			console.log($result);

			if($result.ajax_result !== false) {
				alert($result.msg);
			} else {
				alert($result.msg);
			}

			$("#report_wrap_back").remove();
			$("#report_wrap").remove();
			$("html").css("overflow","initial");
			$("body").css("overflow","initial");

			var agent = navigator.userAgent.toLowerCase();
			if((navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1)) {
				//ie
			    $(".container").removeClass("ie");
			} else {
			     //not ie
			    $(".container").removeClass("not_ie");
			}
		}
	});
});