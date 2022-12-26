package open.sesame.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import open.sesame.dto.Member;

public class AdminAuthInterceptor implements HandlerInterceptor {
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			HttpSession session=request.getSession();
			
			Member loginMember=(Member)session.getAttribute("loginMember");
			
			if(loginMember==null || loginMember.getMemberStatus()!=9) {
				response.sendRedirect(request.getContextPath()+"/notAdminUser");
				throw new Exception("비정상적인 접근");
			}
			return true;
		}

}
