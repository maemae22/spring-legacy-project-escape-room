$(".review_recommend").click(function() {
	
	$thisReiveRecommendBtn = $(this);

	if(isEmpty($(this).data("review-id")) !== false ) {
		alert("올바른 요청이 아닙니다.");
		return false;
	}

	if(isEmpty($(this).data("review-user")) !== false ) {
		alert("올바른 요청이 아닙니다.");
		return false;
	}

	if(isEmpty(getParameterByName("theme")) !== false) {
		alert("올바른 요청이 아닙니다.");
		return false;
	}

	if(isEmpty($(this).data("review-request")) !== false) {
		alert("올바른 요청이 아닙니다.");
		return false;
	}

	$.ajax({
		async: false,
		type: "POST",
		url: $home_url+"/bbs/theme/ajax.review.recommend.ok.php",
		data: {
			"theme_id" : getParameterByName("theme"),
			"theme_review_id" : $(this).data("review-id"),
			"theme_review_user" : $(this).data("review-user"),
			"request" : $(this).data("review-request")
		},
		dataType: "json",
		error: function(request,status,error) {
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        },
		success: function(data) {

			var $result = JSON.parse(JSON.stringify(data));

			console.log($result);

			if($result.ajax_result !== false) {
				if($result.request_data == "up") {
					$thisReiveRecommendBtn.data("review-request","down");
				} else if($result.request_data == "down") {
					$thisReiveRecommendBtn.data("review-request","up");	
				}
				$thisReiveRecommendBtn.find("img").attr("src",$result.image_src);

				location.reload();
			} else {
				alert($result.msg);
			}
		}
	});
});

