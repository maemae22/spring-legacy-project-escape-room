package open.sesame.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import open.sesame.dto.Board;
import open.sesame.dto.Reply;
import open.sesame.service.BoardService;
import open.sesame.service.MemberService;
import open.sesame.service.ReplyService;
import open.sesame.util.Pager;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/board")
public class BoardController {
	
	public final BoardService boardService;
	public final MemberService memberService;
	public final ReplyService replyService;
	
	@RequestMapping
	public String board(Model model) {
		
		return "board/freeBoard";
		
	}
	
	@RequestMapping(value = "/freeBoard_list", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> freeBoardList(@RequestParam(defaultValue = "1") int pageNum) {
		

		int totalBoard=boardService.getBoardCount();
		int pageSize=10;
		int blockSize=5;
		

		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		
		Map<String, Object> pagerMap=new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("boardCate", 1);
		

		Map<String, Object> returnMap=new HashMap<String, Object>();
		returnMap.put("freeBoardList", boardService.getBoardList(pagerMap));
		returnMap.put("pager", pager);
		
		return returnMap;
	}
	
	@RequestMapping(value = "/freeBoard_write", method = RequestMethod.GET)
	public String freeBoard_write(Model model, HttpSession session){
		model.addAttribute("member",session.getAttribute("loginMember"));
		return "board/freeBoard_write";
	}
	
	@RequestMapping(value = "/board_add", method = {RequestMethod.POST,RequestMethod.GET})
	public String board(@ModelAttribute Board board) {
		
		boardService.addBoard(board);
		
		return "redirect:/board";
	}
	
	
	@RequestMapping(value = "/teamBoard", method = RequestMethod.GET)
	public String teamBoard(Model model) {
		
		return "board/teamBoard";
	}
	
	@RequestMapping(value = "/teamBoard_list", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> teamBoardList(@RequestParam(defaultValue = "1") int pageNum) {
		

		int totalBoard=boardService.getBoardCount();
		int pageSize=10;
		int blockSize=5;
		

		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		
		Map<String, Object> pagerMap=new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("boardCate", 2);

		Map<String, Object> returnMap=new HashMap<String, Object>();
		returnMap.put("teamBoardList", boardService.getBoardList(pagerMap));
		returnMap.put("pager", pager);
		
		return returnMap;
	}
	
	@RequestMapping(value = "/teamBoard_write", method = RequestMethod.GET)
	public String teamBoard_write(Model model, HttpSession session){
		model.addAttribute("member",session.getAttribute("loginMember"));
		return "board/teamBoard_write";
	}
	
	@RequestMapping(value = "/teamBoard_add", method = {RequestMethod.POST,RequestMethod.GET})
	public String teamBoard(@ModelAttribute Board board) {
		
		boardService.addBoard(board);
		
		return "redirect:/board/teamBoard";
	}
	
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(Model model) {
		
		return "board/notice";
	}
	
	@RequestMapping(value = "/notice_list", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> noticeList(@RequestParam(defaultValue = "1") int pageNum) {
		

		int totalBoard=boardService.getBoardCount();
		int pageSize=10;
		int blockSize=5;
		

		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		
		Map<String, Object> pagerMap=new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("boardCate", 3);
		

		Map<String, Object> returnMap=new HashMap<String, Object>();
		returnMap.put("noticeList", boardService.getBoardList(pagerMap));
		returnMap.put("pager", pager);
		
		return returnMap;
	}
	
	@RequestMapping(value = "/notice_write", method = RequestMethod.GET)
	public String notice_write(Model model, HttpSession session){
		model.addAttribute("member",session.getAttribute("loginMember"));
		return "board/notice_write";
	}
	
	@RequestMapping(value = "/notice_add", method = {RequestMethod.POST,RequestMethod.GET})
	public String notice(@ModelAttribute Board board) {
		
		boardService.addBoard(board);
		
		return "redirect:/board/notice";
	}
	
	@RequestMapping(value = "{boardNo}")
	public String board_detail(@PathVariable int boardNo, Model model, HttpSession session) {
		model.addAttribute("board",boardService.getSelectBoardNo(boardNo));
		model.addAttribute("member",session.getAttribute("loginMember"));
		model.addAttribute("reply",replyService.getReplyList(boardNo));
		return "/board/board_detail";
		
	}
	
	@RequestMapping(value = "/reply_add", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> replyAdd (@RequestBody Reply reply) {
		
		replyService.addReply(reply);
		
		Map<String,Object> replyMap = new HashMap<String, Object>();
		
		replyMap.put("replyList", replyService.getReplyList(reply.getReplyBno()));
		return replyMap;
		
	}
	
	@RequestMapping(value = "/reply_reAdd", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> replyreAdd (@RequestBody Reply reply) {
		
		replyService.modifyReplyDept(reply);
		replyService.addRereply(reply);
		
		Map<String,Object> replyMap = new HashMap<String, Object>();
		
		replyMap.put("replyList", replyService.getReplyList(reply.getReplyBno()));
		return replyMap;
		
	}

}
