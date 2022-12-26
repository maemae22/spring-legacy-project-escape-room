package open.sesame.mapper;

import java.util.List;
import java.util.Map;

import open.sesame.dto.Review;

public interface ReviewMapper {
	int insertReview(Review review);
	int updateReview(Review review);
	int deleteReview(int reviewNo);
	int reviewCount();
	int myReviewCount(String memberNick);
	Review selectReview(int reviewNo);
	Review selectReviewByNickname(Map<String, Object> map);
	List<Review> selectReviewListReview(int reviewTno);
	List<Review> selectReviewListDate(int reviewTno);
	List<Map<String, Object>> selectMyReviewList(Map<String, Object> map);
	Double selectReviewRatingByTno(int reviewTno);
}
