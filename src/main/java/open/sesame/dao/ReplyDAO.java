package open.sesame.dao;

import java.util.List;

import open.sesame.dto.Reply;

public interface ReplyDAO {
	
	int insertReply(Reply reply);
	int updateReply(Reply reply);
	int deleteReplyNum(int replyNum);
	int deleteReply(int replyNo);
	List<Reply> selectReplyList(int replyBno);
	int insertRereply(Reply reply);
	int updateReplyDept(Reply reply);

}
