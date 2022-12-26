package open.sesame.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import open.sesame.dto.Review;
import open.sesame.mapper.ReviewMapper;

@Repository
@RequiredArgsConstructor
public class ReviewDAOImpl implements ReviewDAO {

	private final SqlSession sqlSession;
	
	@Override
	public int insertReview(Review review) {
		return sqlSession.getMapper(ReviewMapper.class).insertReview(review);
	}

	@Override
	public int updateReview(Review review) {
		return sqlSession.getMapper(ReviewMapper.class).updateReview(review);
	}

	@Override
	public int deleteReview(int reviewNo) {
		return sqlSession.getMapper(ReviewMapper.class).deleteReview(reviewNo);
	}

	@Override
	public Review selectReview(int reviewNo) {
		return sqlSession.getMapper(ReviewMapper.class).selectReview(reviewNo);
	}

	@Override
	public Double selectReviewRatingByTno(int reviewTno) {
		return sqlSession.getMapper(ReviewMapper.class).selectReviewRatingByTno(reviewTno);
	}

	@Override
	public List<Review> selectReviewListReview(int reviewTno) {
		return sqlSession.getMapper(ReviewMapper.class).selectReviewListReview(reviewTno);
	}

	@Override
	public List<Review> selectReviewListDate(int reviewTno) {
		return sqlSession.getMapper(ReviewMapper.class).selectReviewListDate(reviewTno);
	}


	@Override
	public Review selectReviewByNickname(Map<String, Object> map) {
		return sqlSession.getMapper(ReviewMapper.class).selectReviewByNickname(map);
	}

	@Override
	public List<Map<String, Object>> selectMyReviewList(Map<String, Object> map) {
		return sqlSession.getMapper(ReviewMapper.class).selectMyReviewList(map);
	}

	@Override
	public int reviewCount() {
		return sqlSession.getMapper(ReviewMapper.class).reviewCount();	
	}

	@Override
	public int myReviewCount(String memberNick) {
		return sqlSession.getMapper(ReviewMapper.class).myReviewCount(memberNick);	
	}

	

}
