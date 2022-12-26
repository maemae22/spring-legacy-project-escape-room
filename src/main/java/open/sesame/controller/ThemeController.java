package open.sesame.controller;

import java.util.Collections;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import lombok.RequiredArgsConstructor;
import open.sesame.dto.Cafe;
import open.sesame.dto.Member;
import open.sesame.dto.Review;
import open.sesame.dto.Theme;
import open.sesame.service.CafeService;
import open.sesame.service.MemberService;
import open.sesame.service.ReviewService;
import open.sesame.service.ThemeService;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/theme")
public class ThemeController {

	public final ThemeService themeService;
	public final CafeService cafeService;
	public final ReviewService reviewService;
	public final MemberService memberService;
	
	@RequestMapping
	public String theme(Model model) {
		model.addAttribute("themeList",themeService.getOtherThemeList("마스터키프라임 신촌점"));
		return "theme/themeList";
		
	}
	
	
	@RequestMapping(value = "/theme_detail/{themeNo}")
	public String themeDetail(@PathVariable int themeNo, Model model, HttpSession session) {
		Theme theme = themeService.getThemeList(themeNo);
		Cafe cafe=cafeService.getCafeByName(theme.getThemeCname());
		List<Theme> otherThemeList = themeService.getOtherThemeList(theme.getThemeCname()) ;
		
		
		// 추천인원 출력 위한 변수들
		String themeRecommend = theme.getThemeRecommend();
		int themeRecommendfirst = Integer.parseInt(themeRecommend.charAt(0)+"");
		int themeRecommendlast =  Integer.parseInt(themeRecommend.charAt(themeRecommend.length() - 1)+"");
		
		// 평점 출력 위한 변수들
		//double themeRating = 3.78;
		Double themeRatingDouble = reviewService.getReviewRatingByTno(themeNo);		
		double themeRating;
		if(themeRatingDouble==null) {
			themeRating = 0;
		} else {
			themeRating = themeRatingDouble ;
		}
		
		
		// 이 업체의 다른 테마 검색
		Collections.shuffle(otherThemeList);
		
		Theme Othertheme1;
		Theme Othertheme2;
		
		if(otherThemeList.size() <= 2) {
			if(otherThemeList.size() <= 1) { // otherThemeList 길이가 1일 때 (다른 테마가 없을 때)
				Othertheme1=theme;
				Othertheme2=null;
			} else { // otherThemeList 길이가 2일 때
				Othertheme1=otherThemeList.get(0);
				if (otherThemeList.get(0).equals(theme)) {
					Othertheme1 = otherThemeList.get(1);
				}
				Othertheme2=null;				
			}
		}  else { // otherThemeList 길이가 3 이상일 때
			if (otherThemeList.get(0).equals(theme)) {
				Othertheme1 = otherThemeList.get(1);
				Othertheme2 = otherThemeList.get(2);
			} else if (otherThemeList.get(1).equals(theme)) {
				Othertheme1 = otherThemeList.get(0);
				Othertheme2 = otherThemeList.get(2);
			} else {
				Othertheme1 = otherThemeList.get(0);
				Othertheme2 = otherThemeList.get(1);
			} 
		}
		
		
		// 다른테마1의 평점 출력 변수
		Double themeRatingDouble1 = reviewService.getReviewRatingByTno(Othertheme1.getThemeNo());		
		double themeRating1;		
		if(themeRatingDouble1==null) {
			themeRating1 = 0;
		} else {
			themeRating1 = themeRatingDouble1 ;
		}
		
		Double themeRatingDouble2;
		double themeRating2;
		
		if(Othertheme2!=null) {
			// 다른테마2의 평점 출력 변수
			themeRatingDouble2 = reviewService.getReviewRatingByTno(Othertheme2.getThemeNo());		
			if(themeRatingDouble2==null) {
				themeRating2 = 0;
			} else {
				themeRating2 = themeRatingDouble2 ;
			}
		} else {
			themeRatingDouble2 = null;
			themeRating2=0;
		}
		

		model.addAttribute("theme", theme);
		model.addAttribute("cafe", cafe);
		model.addAttribute("themeRecommendfirst", themeRecommendfirst);
		model.addAttribute("themeRecommendlast", themeRecommendlast);
		
		model.addAttribute("themeRating", themeRating);
		model.addAttribute("themeRatingDouble", themeRatingDouble);
		
		model.addAttribute("themeRating1", themeRating1);
		model.addAttribute("themeRatingDouble1", themeRatingDouble1);
		
		model.addAttribute("themeRating2", themeRating2);
		model.addAttribute("themeRatingDouble2", themeRatingDouble2);
		
		model.addAttribute("Othertheme1", Othertheme1);
		
		model.addAttribute("Othertheme2", Othertheme2);
		
		
		// 리뷰 출력 관련
		model.addAttribute("reviewList", reviewService.getReviewListDate(themeNo));
	
		Member member = (Member)session.getAttribute("loginMember");
		
		if(member !=null) { 
			Map<String, Object> myreviewMap=new HashMap<String, Object>();
			myreviewMap.put("reviewNick", member.getMemberNick());
			myreviewMap.put("reviewTno", themeNo );
			
			
			Review myreview = reviewService.getReviewByNickname(myreviewMap);
			model.addAttribute("myreview", myreview); 
		}
		
		model.addAttribute("member", session.getAttribute("loginMember"));
		
		return "theme/theme_detail";
		
	}	
	
	
	// 리뷰 등록 버튼 누르면
	@RequestMapping(value="/review_add", method = RequestMethod.POST)
	@ResponseBody
	public String reviewAdd (@RequestBody Review review, HttpSession session) {
		
		Member member = (Member)session.getAttribute("loginMember");
		
		//리뷰 등록 닉네임 임시로 설정(test)
		review.setReviewNick(member.getMemberNick());
		
		review.setReviewContent(HtmlUtils.htmlEscape(review.getReviewContent()));
		reviewService.addReview(review);
		
		return "success";
		
	}
	
	@RequestMapping(value = "/review_remove/{reviewNo}", method = RequestMethod.DELETE)
	@ResponseBody
	public String ReviewDelete (@PathVariable int reviewNo) {
		reviewService.removeReview(reviewNo);
		
			
		return "success";
	}

	
	@RequestMapping(value = "/review_modify", method ={RequestMethod.PUT, RequestMethod.PATCH})
	@ResponseBody 
	public String ReviewModify (@RequestBody Review review) {


		review.setReviewContent(HtmlUtils.htmlEscape(review.getReviewContent()));
		reviewService.modifyReview(review);

		return "success"; 
	}
	 
	
	// 수정 버튼 클릭 시 리뷰 수정 팝업 나타나게 하는거..
	// 적어놨던 리뷰 내용 반환해서 추력될 수 있게 함
	@RequestMapping(value = "/review_modify_view/{reviewNo}", method = RequestMethod.GET)
	@ResponseBody
	public Review  ReviewView_update (@PathVariable int reviewNo) {
		return reviewService.getReview(reviewNo);
	}

	
	@RequestMapping(value = "/themeCateSearch",  method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> themeCateSearch(@RequestBody Map<String, Object> map) {
		
		Map<String, Object> returnMap=new HashMap<String, Object>();
		returnMap.put("themeCateList", themeService.getThemeCateList(map));
		return returnMap;
		
	}
	
	
}
