package open.sesame.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import open.sesame.dao.ReplyDAO;
import open.sesame.dto.Reply;

@Service
@RequiredArgsConstructor
public class ReplyServiceImpl implements ReplyService {
	
	public final ReplyDAO replyDAO;
	
	@Override
	public void addReply(Reply reply) {
		replyDAO.insertReply(reply);
		
	}

	@Override
	public void modifyReply(Reply reply) {
		replyDAO.updateReply(reply);
		
	}

	@Override
	public void removeReply(int replyNo) {
		replyDAO.deleteReply(replyNo);
		
	}

	@Override
	public void removeReplyNum(int replyNum) {
		replyDAO.deleteReplyNum(replyNum);
		
	}

	@Override
	public List<Reply> getReplyList(int replyBno) {
		return replyDAO.selectReplyList(replyBno);
	}

	@Override
	public void addRereply(Reply reply) {
		replyDAO.insertRereply(reply);
		
	}

	@Override
	public void modifyReplyDept(Reply reply) {
		replyDAO.updateReplyDept(reply);
		
	}

}
