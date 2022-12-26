
package open.sesame.chat;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;

import open.sesame.dto.Member;

@RequestMapping("/chat")
public class ChattingHandler extends TextWebSocketHandler {
	// 세션 리스트
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	public static int i;
	
	public int count() {
		return i;
	}
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		i++;
		sessionList.add(session);
	}

	@Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Map<String,Object> map= session.getAttributes();
		System.out.println(map);
		
		System.out.println("handler"+map.get("loginMember"));
		Member member = (Member) map.get("loginMember");
        for(WebSocketSession sess : sessionList){
            sess.sendMessage(new TextMessage(
            		member.getMemberNick()+":"+message.getPayload()));
        }
	}

	// 클라이언트 연결을 끊었을 때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		i--;
		sessionList.remove(session);
	}
}