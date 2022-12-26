package open.sesame.dao;

import java.util.List;
import java.util.Map;

import open.sesame.dto.Board;

public interface BoardDAO {
	
	int insertBoard(Board board);
	int updateBoard(Board board);
	int deleteBoard(int boardNo);
	int selectBoardCount();
	List<Board> selectBoardList(Map<String, Object> map);
	List<Board> searchBoardList(String keyword);
	Board selectBoardNo(int boardNo);

}
