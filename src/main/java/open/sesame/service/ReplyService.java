package open.sesame.service;

import java.util.List;
import java.util.Map;

import open.sesame.dto.Reply;

public interface ReplyService {
	
	void addReply(Reply reply);
	void modifyReply(Reply reply);
	void removeReply(int replyNo);
	void removeReplyNum(int replyNum);
	List<Reply> getReplyList(int replyBno);
	void addRereply(Reply reply);
	void modifyReplyDept(Reply reply);

}
