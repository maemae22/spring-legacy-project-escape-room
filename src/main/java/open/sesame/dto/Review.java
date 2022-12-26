package open.sesame.dto;

import lombok.Data;

/*
이름               널?       유형            
---------------- -------- ------------- 
REVIEW_NO        NOT NULL NUMBER        
REVIEW_TNO       NOT NULL NUMBER        
REVIEW_NICK      NOT NULL VARCHAR2(30)  
REVIEW_PLAYDATE  NOT NULL VARCHAR2(50)  
REVIEW_DIFFICULT NOT NULL VARCHAR2(5)   
REVIEW_CLEAR     NOT NULL VARCHAR2(1)   
REVIEW_TIME      NOT NULL VARCHAR2(20)  
REVIEW_HINT      NOT NULL VARCHAR2(5)   
REVIEW_CONTENT   NOT NULL VARCHAR2(300) 
REVIEW_DATE      NOT NULL DATE          
REVIEW_RATING    NOT NULL VARCHAR2(5)
*/

@Data
public class Review {
	
	private int reviewNo, reviewTno ;
	private String reviewNick, reviewPlaydate, reviewClear, reviewTime, reviewContent, reviewDate ;
	private String reviewDifficult, reviewHint, reviewRating ;
	
}
