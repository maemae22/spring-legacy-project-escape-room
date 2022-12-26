package open.sesame.dto;

import lombok.Data;
/*
 이름             널?       유형           
-------------- -------- ------------ 
MEMBER_NO      NOT NULL NUMBER       
MEMBER_EMAIL   NOT NULL VARCHAR2(50) 
MEMBER_NICK    NOT NULL VARCHAR2(30) 
MEMBER_PASSWD  NOT NULL VARCHAR2(30) 
MEMBER_PHONE   NOT NULL VARCHAR2(20) 
MEMBER_REGDATE NOT NULL DATE         
MEMBER_STATUS  NOT NULL NUMBER       
EMAIL_KEY      NOT NULL VARCHAR2(50) 
EMAIL_STATUS   NOT NULL NUMBER       

 */

@Data
public class Member {
	private int memberNo;
	private String memberEmail;
	private String memberNick;
	private String memberPasswd;
	private String memberPhone;
	private String memberRegdate;
	private int memberStatus;
	private String emailKey;
	private int emailStatus;
	
	
}
