package open.sesame.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import open.sesame.dto.Reply;
import open.sesame.mapper.ReplyMapper;

@Repository
@RequiredArgsConstructor
public class ReplyDAOImpl implements ReplyDAO {
	
	private final SqlSession sqlSession;

	@Override
	public int insertReply(Reply reply) {
		return sqlSession.getMapper(ReplyMapper.class).insertReply(reply);
	}

	@Override
	public int updateReply(Reply reply) {
		return sqlSession.getMapper(ReplyMapper.class).updateReply(reply);
	}

	@Override
	public int deleteReplyNum(int replyNum) {
		return sqlSession.getMapper(ReplyMapper.class).deleteReplyNum(replyNum);
	}

	@Override
	public int deleteReply(int replyNo) {
		return sqlSession.getMapper(ReplyMapper.class).deleteReply(replyNo);
	}

	@Override
	public List<Reply> selectReplyList(int replyBno) {
		return sqlSession.getMapper(ReplyMapper.class).selectReplyList(replyBno);

	}

	@Override
	public int insertRereply(Reply reply) {
		return sqlSession.getMapper(ReplyMapper.class).insertRereply(reply);
	}

	@Override
	public int updateReplyDept(Reply reply) {
		return sqlSession.getMapper(ReplyMapper.class).updateReplyDept(reply);
	}
}
