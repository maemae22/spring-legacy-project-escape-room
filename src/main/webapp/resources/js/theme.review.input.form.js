/* rating */
$("body").on("click","input[type='radio'][name='rating']",function() {
	if($(this).val() == "1") {
		$("#rated_star").val("0.5");
	}

	if($(this).val() == "2") {
		$("#rated_star").val("1.0");
	}

	if($(this).val() == "3") {
		$("#rated_star").val("1.5");
	}

	if($(this).val() == "4") {
		$("#rated_star").val("2.0");
	}

	if($(this).val() == "5") {
		$("#rated_star").val("2.5");
	}

	if($(this).val() == "6") {
		$("#rated_star").val("3.0");
	}

	if($(this).val() == "7") {
		$("#rated_star").val("3.5");
	}

	if($(this).val() == "8") {
		$("#rated_star").val("4.0");
	}

	if($(this).val() == "9") {
		$("#rated_star").val("4.5");
	}

	if($(this).val() == "10") {
		$("#rated_star").val("5.0");
	}
});


/* rating 변경 */
$("body").on("click","input[type='radio'][name='rating_update']",function() {
	if($(this).val() == "1") {
		$("#rated_star_update").val("0.5");
	}

	if($(this).val() == "2") {
		$("#rated_star_update").val("1.0");
	}

	if($(this).val() == "3") {
		$("#rated_star_update").val("1.5");
	}

	if($(this).val() == "4") {
		$("#rated_star_update").val("2.0");
	}

	if($(this).val() == "5") {
		$("#rated_star_update").val("2.5");
	}

	if($(this).val() == "6") {
		$("#rated_star_update").val("3.0");
	}

	if($(this).val() == "7") {
		$("#rated_star_update").val("3.5");
	}

	if($(this).val() == "8") {
		$("#rated_star_update").val("4.0");
	}

	if($(this).val() == "9") {
		$("#rated_star_update").val("4.5");
	}

	if($(this).val() == "10") {
		$("#rated_star_update").val("5.0");
	}
});

/* difficulty radio click event */
$(".difficulty_label").click(function() {
	$(this).next().children("input[name=difficulty]").attr("checked","true");
});

/* difficulty_label */
$(".difficulty_label").click(function() {
	$(".difficulty_radio_box label img").attr("src","https://www.roomescape.co.kr/_template/assets/img/theme/detail/review/radio_btn_off.jpg");
	$(this).next().children().children().attr("src","https://www.roomescape.co.kr/_template/assets/img/theme/detail/review/radio_btn_on.jpg");
	$(this).next().children().next().next().prop('checked',true);
});

$(".difficulty_radio_box label img").click(function() {
	$(".difficulty_radio_box label img").attr("src","https://www.roomescape.co.kr/_template/assets/img/theme/detail/review/radio_btn_off.jpg");
	$(this).attr("src","http://www.roomescape.co.kr/_template/assets/img/theme/detail/review/radio_btn_on.jpg");
	$(this).parent().next().next().prop('checked',true);
});

/* success_n_fail_label */
$(".success_n_fail_label_1").click(function() {
	$(".success_radio_box .success_n_fail_label_2 img").attr("src","https://www.roomescape.co.kr/_template/assets/img/theme/detail/review/radio_btn_off.jpg");
	$(this).next().children().attr("src","http://www.roomescape.co.kr/_template/assets/img/theme/detail/review/radio_btn_on.jpg");
	$(this).next().next().next().prop('checked', true);
});

$(".success_n_fail_label_2").click(function() {
	$(".success_radio_box .success_n_fail_label_2 img").attr("src","https://www.roomescape.co.kr/_template/assets/img/theme/detail/review/radio_btn_off.jpg");
	$(this).children().attr("src","http://www.roomescape.co.kr/_template/assets/img/theme/detail/review/radio_btn_on.jpg");
	$(this).next().next().prop('checked', true);
});
