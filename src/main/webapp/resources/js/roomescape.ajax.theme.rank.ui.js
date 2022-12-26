$("#no_rating_input").click(function() {
	$(this).toggleClass("active");

	if($(this).hasClass("active") !== false) {
		$("#rated_star_inputed").val("false");
		$("#rating_ioput_row").empty();
	} else {
		$element = '';
		$element += '';
		$element += '<div class="tag">';
		$element += '<span>별점</span>';
		$element += '</div>';
		$element += '<div class="input">';
		$element += '<div class="rating_star">';
		$element += '<fieldset class="rate">';
		$element += '<input type="radio" id="rating10" name="rating" value="10"/><label for="rating10" title="5 stars"></label>';
		$element += '<input type="radio" id="rating9" name="rating" value="9" /><label class="half" for="rating9" title="4 1/2 stars"></label>';
		$element += '<input type="radio" id="rating8" name="rating" value="8" /><label for="rating8" title="4 stars"></label>';
		$element += '<input type="radio" id="rating7" name="rating" value="7" /><label class="half" for="rating7" title="3 1/2 stars"></label>';
		$element += '<input type="radio" id="rating6" name="rating" value="6" /><label for="rating6" title="3 stars"></label>';
		$element += '<input type="radio" id="rating5" name="rating" value="5" /><label class="half" for="rating5" title="2 1/2 stars"></label>';
		$element += '<input type="radio" id="rating4" name="rating" value="4" /><label for="rating4" title="2 stars"></label>';
		$element += '<input type="radio" id="rating3" name="rating" value="3" /><label class="half" for="rating3" title="1 1/2 stars"></label>';
		$element += '<input type="radio" id="rating2" name="rating" value="2" /><label for="rating2" title="1 star"></label>';
		$element += '<input type="radio" id="rating1" name="rating" value="1" /><label class="half" for="rating1" title="1/2 star"></label>';
		$element += '<input type="hidden" name="rated_star" id="rated_star"/>';
		$element += '</fieldset>';
		$element += '<span>이 테마의 솔직한 별점을 남겨주세요</span>';
		$element += '</div>';
		$element += '</div>';
		$("#rating_ioput_row").empty();
		$("#rating_ioput_row").append($element);
		$("#rated_star_inputed").val("true");
	}
});