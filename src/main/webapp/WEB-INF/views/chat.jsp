<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page import="open.sesame.chat.ChattingHandler" %>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	background-color: black;
}

button {
	background-color: black;
}

.col {
	color: gray;
	font-style: italic;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="col-6">
			<label><b><img
					src="${pageContext.request.contextPath}/images/header/logo_version2.png	" /></b></label>
		</div>
		<div>
			<div id="msgArea" class="col"></div>
				<div class="col-6">
							
				<div class="input-group mb-3">
					<input type="text" id="msg" class="form-control"
						aria-label="Recipient's username" aria-describedby="button-addon2"
						size="40" style="padding: 9px">
									<%ChattingHandler a = new ChattingHandler(); %>
						<p style= "color : red">현재 접속자수는 [<%=a.count() %>]명 입니다.</p>
											<button class="btn btn-outline-secondary" type="button"
						id="button-send" style="float: right">
						<img src="${pageContext.request.contextPath}/images/post.png"
							width="55px" height="35px" />
					</button>

				</div>
			</div>
		</div>
		<div class="col-6"></div>
	</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">
	//전송 버튼 누르는 이벤트
	$("#button-send").on("click", function(e) {
		sendMessage();
		$('#msg').val('')
	});

	var count=0;
	var sock = new SockJS('http://itwill.xyz/team138/chatting');
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	sock.onopen = onOpen;

	function sendMessage() {
		console.log(window.location.origin);
		sock.send($("#msg").val());
	}
	//서버에서 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		console.log("data"+data);
		var sessionId =null; //데이터를 보낸 사람
		var message = null;
		var arr = data.split(":");
		for (var i = 0; i < arr.length; i++) {
			console.log('arr[' + i + ']: ' + arr[i]);
		}
		var cur_session = '${userid}'; //현재 세션에 로그인 한 사람
			
		console.log("cur_session : " + cur_session);
		sessionId = arr[0];
		message = arr[1];
		console.log("세션아이디 : "+sessionId);
		
		//로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
		if (sessionId == cur_session) {

			var str = "<div class='col-6'>";
			str += "<div class='alert alert-danger'>";
			str += "<b>" + sessionId + " : " + message + "</b>";
			str += "</div></div>";

			$("#msgArea").append(str);
		} else {

			var str = "<div class='col-6'>";
			str += "<div class='alert alert-warning'>";
			str += "<b>" + sessionId + " : " + message + "</b>";
			str += "</div></div>";

			$("#msgArea").append(str);
		}

	}
	//채팅창에서 나갔을 때
	function onClose(evt) {
		count=count-1;
		var user = '${loginMember.memberNick}';
		var str = user + " 님이 퇴장하셨습니다.";
		sock.send("님이 퇴장하셨습니다.");
		$("#msgArea").append(str);
	}
	//채팅창에 들어왔을 때
	function onOpen(evt) {
		count=count+1;
		var user = '${loginMember.memberNick}';
		var str = user + "님이 입장하셨습니다.";
		$("#msgArea").append(str);
		sock.send("님이 입장하셨습니다.");
	}

</script>
</html>