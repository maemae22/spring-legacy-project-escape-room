package open.sesame.dto;

import lombok.Data;

/*
이름            널?       유형            
------------- -------- ------------- 
REPLY_NO      NOT NULL NUMBER        
REPLY_BNO     NOT NULL NUMBER        
REPLY_NICK    NOT NULL VARCHAR2(30)  
REPLY_DATE    NOT NULL DATE          
REPLY_CONTENT NOT NULL VARCHAR2(300) 
REPLY_DEPT    NOT NULL NUMBER        
REPLY_LEVEL   NOT NULL NUMBER        
REPLY_NUM     NOT NULL NUMBER        
*/

@Data
public class Reply {
	private int replyNo;
	private int replyBno;
	private String replyNick;
	private String replyDate;
	private String replyContent;
	private int replyDept;
	private int replyLevel;
	private int replyNum;

}
