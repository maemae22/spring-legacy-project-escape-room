package open.sesame.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import open.sesame.dao.BoardDAO;
import open.sesame.dto.Board;


@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	private final BoardDAO boardDAO;
	
	@Transactional
	@Override
	public void addBoard(Board board) {
		boardDAO.insertBoard(board);
		
	}

	@Transactional
	@Override
	public void modifyBoard(Board board) {
		boardDAO.updateBoard(board);
	}

	@Transactional
	@Override
	public void removeBoard(int boardNo) {
		boardDAO.deleteBoard(boardNo);
	}

	@Transactional
	@Override
	public List<Board> getSearchBoardList(String keyword) {
		return boardDAO.searchBoardList(keyword);
	}

	@Transactional
	@Override
	public int getBoardCount() {
		return boardDAO.selectBoardCount();
	}

	@Transactional
	@Override
	public List<Board> getBoardList(Map<String, Object> map) {
		return boardDAO.selectBoardList(map);
	}

	@Override
	public Board getSelectBoardNo(int boardNo) {
		return boardDAO.selectBoardNo(boardNo);
	}

}
