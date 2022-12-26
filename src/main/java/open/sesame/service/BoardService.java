package open.sesame.service;

import java.util.List;
import java.util.Map;

import open.sesame.dto.Board;

public interface BoardService {
	
	void addBoard(Board board);
	void modifyBoard(Board board);
	void removeBoard(int boardNo);
	int getBoardCount();
	List<Board> getBoardList(Map<String, Object> map);
	List<Board> getSearchBoardList(String keyword);
	Board getSelectBoardNo(int boardNo);

}
