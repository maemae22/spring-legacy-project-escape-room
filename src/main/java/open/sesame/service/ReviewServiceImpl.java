package open.sesame.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import open.sesame.dao.ReviewDAO;
import open.sesame.dto.Review;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	private final ReviewDAO reviewDAO;
	
	@Transactional
	@Override
	public void addReview(Review review) {
		reviewDAO.insertReview(review);
	}

	@Transactional
	@Override
	public void modifyReview(Review review) {
		reviewDAO.updateReview(review);
	}

	@Transactional
	@Override
	public void removeReview(int reviewNo) {
		reviewDAO.deleteReview(reviewNo);
	}

	@Override
	public Review getReview(int reviewNo) {
		Review review = reviewDAO.selectReview(reviewNo);
		return review ;
	}

	@Override
	public Double getReviewRatingByTno(int reviewTno) {
		return reviewDAO.selectReviewRatingByTno(reviewTno);
	}

	@Override
	public List<Review> getReviewListReview(int reviewTno) {
		return reviewDAO.selectReviewListReview(reviewTno);
	}

	@Override
	public List<Review> getReviewListDate(int reviewTno) {
		return reviewDAO.selectReviewListDate(reviewTno);
	}


	@Override
	public Review getReviewByNickname(Map<String, Object> map) {
		Review review = reviewDAO.selectReviewByNickname(map);
		return review ;
	}

	@Override
	public List<Map<String, Object>> getMyReviewList(Map<String, Object> map) {
		return reviewDAO.selectMyReviewList(map);
	}

	@Override
	public int getReviewCount() {
		return reviewDAO.reviewCount();
	}

	@Override
	public int getMyReviewCount(String memberNick) {
		return reviewDAO.myReviewCount(memberNick);
	}

}
