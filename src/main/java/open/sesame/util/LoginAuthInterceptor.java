package open.sesame.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import open.sesame.dto.Member;

//로그인 사용자 관련 권한 처리를 위한 Interceptor 클래스
// => 요청 처리 메소드의 명령이 실행되기 전에 비로그인 사용자가 페이지를 요청한 경우 에러페이지로 
//이동하여 응답 처리
public class LoginAuthInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session=request.getSession();
		Member loginUserinfo=(Member)session.getAttribute("loginMember");
		if(loginUserinfo==null) {
			response.sendRedirect(request.getContextPath()+"/notLoginUser");
			
			throw new Exception("비정상적인 요청");
		}
		return true;
	}
}
