package open.sesame.dto;

import lombok.Data;

/*
이름              널?       유형            
--------------- -------- ------------- 
RESERVE_NO      NOT NULL NUMBER        
RESERVE_EMAIL   NOT NULL VARCHAR2(50)  
RESERVE_DATE    NOT NULL DATE          
RESERVE_LOC     NOT NULL VARCHAR2(20)  
RESERVE_CAFE    NOT NULL VARCHAR2(50)  
RESERVE_THEME   NOT NULL VARCHAR2(50)  
RESERVE_TIME    NOT NULL VARCHAR2(20)  
RESERVE_PLAYER  NOT NULL NUMBER        
RESERVE_MONEY   NOT NULL NUMBER        
RESERVE_COMMENT          VARCHAR2(100) 
RESERVE_PAYMENT          VARCHAR2(20)  
RESERVE_NOWDATE          DATE        
*/  

@Data
public class Reserve {
	private int reserveNo;
	private String reserveEmail;
	private String reserveDate;
	private String reserveLoc;
	private String reserveCafe;
	private String reserveTheme;
	private String reserveTime;
	private int reservePlayer;
	private int reserveMoney;
	private String reserveComment;
	private String reservePayment;
	private String reserveNowdate;
}
