package open.sesame.mapper;

import java.util.List;
import java.util.Map;

import open.sesame.dto.Board;

public interface BoardMapper {
	
	int insertBoard(Board board);
	int updateBoard(Board board);
	int deleteBoard(int boardNo);
	int selectBoardCount();
	List<Board> selectBoardList(Map<String, Object> map);
	List<Board> searchBoardList(String keyword);
	Board selectBoardNo(int boardNo);

}
