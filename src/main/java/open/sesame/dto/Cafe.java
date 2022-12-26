package open.sesame.dto;

import lombok.Data;

/*
이름           널?       유형            
------------ -------- ------------- 
CAFE_NO      NOT NULL NUMBER        
CAFE_NAME    NOT NULL VARCHAR2(50)  
CAFE_TEL     NOT NULL VARCHAR2(20)  
CAFE_BHOURS  NOT NULL VARCHAR2(20)  
CAFE_ADDRESS NOT NULL VARCHAR2(200) 
CAFE_DOMAIN  NOT NULL VARCHAR2(100) 
CAFE_LOC     NOT NULL VARCHAR2(20)  
*/

@Data
public class Cafe {

	private int cafeNo ;
	private String cafeName, cafeTel, cafeBhours, cafeAddress, cafeDomain, cafeLoc ;
	
}
