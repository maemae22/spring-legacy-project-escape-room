package open.sesame.mapper;

import java.util.List;

import open.sesame.dto.Reply;

public interface ReplyMapper {
	
	int insertReply(Reply reply);
	int updateReply(Reply reply);
	int deleteReplyNum(int replyNum);
	int deleteReply(int replyNo);
	List<Reply> selectReplyList(int replyBno);
	int insertRereply(Reply reply);
	int updateReplyDept(Reply reply);

}
