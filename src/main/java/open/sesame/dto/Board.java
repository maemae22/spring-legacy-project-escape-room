package open.sesame.dto;

import lombok.Data;

/*
이름            널?       유형            
------------- -------- ------------- 
BOARD_NO      NOT NULL NUMBER        
BOARD_NICK    NOT NULL VARCHAR2(30)  
BOARD_TITLE   NOT NULL VARCHAR2(100) 
BOARD_CONTENT NOT NULL VARCHAR2(500) 
BOARD_DATE    NOT NULL DATE          
BOARD_CLICK   NOT NULL NUMBER        
BOARD_CATE    NOT NULL NUMBER        
*/

@Data
public class Board {
	private int boardNo;
	private String boardNick;
	private String boardTitle;
	private String boardContent;
	private String boardDate;
	private int boardClick;
	private int boardCate;
}
