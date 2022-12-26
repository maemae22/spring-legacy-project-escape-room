package open.sesame.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

/*
이름              널?       유형            
--------------- -------- ------------- 
THEME_NO        NOT NULL NUMBER        
THEME_CNAME     NOT NULL VARCHAR2(50)  
THEME_NAME      NOT NULL VARCHAR2(50)  
THEME_RATING             NUMBER        
THEME_GENRE     NOT NULL VARCHAR2(20)  
THEME_ACTIVITY  NOT NULL NUMBER        
THEME_DIFFICULT NOT NULL NUMBER        
THEME_LIMIT     NOT NULL NUMBER        
THEME_RECOMMEND NOT NULL NUMBER        
THEME_INTRO     NOT NULL VARCHAR2(500) 
THEME_IMAGE_LOC NOT NULL VARCHAR2(300) 
*/

@Data
public class Theme {

	private int themeNo, themeRating;
	private String themeCname, themeName, themeGenre, themeActivity, themeDifficult,
					themeIntro, themeImageLoc, themeLimit, themeRecommend ;
	private MultipartFile file;
	
}
