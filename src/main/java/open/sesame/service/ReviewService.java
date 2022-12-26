package open.sesame.service;

import java.util.List;
import java.util.Map;

import open.sesame.dto.Review;

public interface ReviewService {

	void addReview(Review review);
	void modifyReview(Review review);
	void removeReview(int reviewNo);
	int getReviewCount();
	int getMyReviewCount(String memberNick);
	Review getReview(int reviewNo);
	Review getReviewByNickname(Map<String, Object> map);
	List<Review> getReviewListReview(int reviewTno);
	List<Review> getReviewListDate(int reviewTno);
	List<Map<String, Object>> getMyReviewList(Map<String, Object> map);
	Double getReviewRatingByTno(int reviewTno);
	
}
