<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
table {
	clear: both;
	width: 100%;
	padding: 0px;
	border-collapse: collapse;
	border-left: 1px solid #EAEDF1;
	border-top: 1px solid #D6E1EA;
}

table th {
	margin: 0;
	padding: 8px 0px 8px 0px;
	line-height: 13px;
	text-align: center;
	border-bottom: 1px solid #D6E1EA;
	border-right: 1px solid #D6E1EA;
	background-color: #F7F7F7;
	color: #000000;
}

table td {
	word-break: break-all;
	margin: 0;
	padding: 8px 0px 8px 0px;
	line-height: 14px;
	text-align: center;
	border-bottom: 1px solid #EAEDF1;
	border-right: 1px solid #EAEDF1;
	color: #000000;
}
</style>

<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">회원 목록</h1>
		<!--  
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
			<li class="breadcrumb-item active">Tables</li>
		</ol>
		<div class="card mb-4">
			<div class="card-body">
				DataTables is a third party plugin that is used to generate the demo
				table below. For more information about DataTables, please visit the
				<a target="_blank" href="https://datatables.net/">official
					DataTables documentation</a> .
			</div>
		</div>
		-->

		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i>유저
			</div>
				<%-- 게시글 목록을 출력하는 영역 --%>
			<div id="memberListDiv"></div>

			<%-- 페이지 번호를 출력하는 영역 --%>
			<div id="pageNumDiv"></div>
			

						
		</div>
	</div>
</main>

<script type="text/javascript">
$(document).on('change',"#allCheck",function() {
	if($(this).is(":checked")) {
		$(".check").prop("checked",true);
	} else {
		$(".check").prop("checked",false);
	}
});

$(document).on('click','#removeBtn',function() {
	if($(".check").filter(":checked").length==0) {
		$("#message").text("선택된 회원이 하나도 없습니다.");
		return;
	}
	
	if(confirm("회원을 정말로 삭제하시겠습니까?")) {
	
		var checkArr = new Array();
		var list = $("input[name='checkEmail']");
		for(var i=0; i<list.length; i++){
			if(list[i].checked){
				checkArr.push(list[i].value);
			}
		}
		console.log(checkArr);
	
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/admin/member_delete",
			data: {
				memberEmail : checkArr
			},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success: function(data) {
				if(data === "fail"){
					alert("선택회원 삭제 실패!");
				} else {
					memberListDisplay(page);
				}
			
			}
		});
	}
});

$(document).on('change','.status',function() {
	//이벤트가 발생된 입력태그의 태그 속성값을 반환받아 저장
	var email=$(this).attr("name");//상태를 변경하고자 하는 회원의 아이디를 반환받아 저장 - 식별자
	//이벤트가 발생된 입력태그의 입력값을 반환받아 저장
	var status=$(this).val();//변경할 회원상태를 반환받아 저장 - 변경값
	//alert(id+" = "+status);
	console.log(email);
	console.log(status);
	
	$.ajax({
		type: "POST",
		url: "${pageContext.request.contextPath}/admin/member_update",
		data: JSON.stringify({
			"memberEmail" : email,
			"memberStatus" : status
		}),
		contentType: "application/json",
		success: function(data) {
			console.log(data)
			if(data=="fail"){
				alert("회원 권한 변경 실패!");
			
			} else {
				memberListDisplay(page);
			}
		}
	});
});




var page=1;//현재 요청 페이지의 번호를 저장하기 위한 전역변수

//회원 목록을 출력하는 함수 호출
memberListDisplay(page);

//AJAX 기능으로 요청하여 응답결과를 이용하여 게시글 목록을 출력하는 함수 - 페이징 처리
function memberListDisplay(pageNum) {
	page=pageNum;
	$.ajax({
		type: "get",
		url: "${pageContext.request.contextPath}/admin/member_list?pageNum="+pageNum,
		dataType: "json",
		success: function(json) {
			console.log(json);
			if(json.memberList.length==0) {
				var html="<table>";
				html+="<tr>";
				html+="<th width='800' colspan='7'>검색된 게시글이 하나도 없습니다.</th>";	
				html+="</tr>";
				html+="</table>";
				$("#memberListDiv").html(html);
				return;
			}
			
			var html="<table>";
			html+="<tr>";
			html+="<th><input type='checkbox' id='allCheck'></th>";				
			html+="<th>번호</th>";				
			html+="<th>이메일</th>";				
			html+="<th>닉네임</th>";				
			html+="<th>연락처</th>";				
			html+="<th>가입일</th>";				
			html+="<th>상태</th>";				
			html+="</tr>";
			console.log()
			$(json.memberList).each(function(index) {
				
				html+="<tr>";
				html+="<td class='member_check'>";
				if(this.memberStatus==9){
					html+="관리자";
				} else {
					html+="<input type='checkbox' name='checkEmail' value="+this.memberEmail+" class='check'>";
				}
				html+="<td>"+(index+1)+"</td>";
				html+="<td>"+this.memberEmail+"</td>";
				html+="<td>"+this.memberNick+"</td>";
				html+="<td>"+this.memberPhone+"</td>";
				html+="<td>"+this.memberRegdate+"</td>";
				html+="<td class='member_status'><select class='status' name="+this.memberEmail+">";
					html+="<option value='1'";
					if(this.memberStatus==1) {html+="selected='selected'";}
					html+=">일반회원</option>";
					html+="<option value='9'";
					if(this.memberStatus==9) {html+="selected='selected'";}
					html+=">관리자</option>";
				
				html+="</select></td>";
				html+="</tr>";

			});
			html+="</table>";
			html+="<p id='allDetete'><button type='button' id='removeBtn'>선택삭제</button></p>";
			html+="<div id='message' style='color: red;'></div>";
			
			
			$("#memberListDiv").html(html);
			
			//페이지 번호를 출력하는 함수 호출
			pageNumDisplay(json.pager);
		},
		error: function(xhr) {
			alert("에러코드(SELECT) = "+xhr.status);
		}
	});
}

//페이지 번호를 출력하는 함수
function pageNumDisplay(pager) {
	var html="";
	
	if(pager.startPage>pager.blockSize) {
		html+="<a href='javascript:memberListDisplay(1);'>[처음]</a>";
		html+="<a href='javascript:memberListDisplay("+pager.prevPage+");'>[이전]</a>";
	} else {
		html+="[처음][이전]";
	}
	
	for(i=pager.startPage;i<=pager.endPage;i++) {
		if(pager.pageNum!=i) {
			html+="<a href='javascript:memberListDisplay("+i+");'>["+i+"]</a>";
		} else {
			html+="["+i+"]";
		}
	}
	
	if(pager.endPage!=pager.totalPage) {
		html+="<a href='javascript:memberListDisplay("+pager.nextPage+");'>[다음]</a>";
		html+="<a href='javascript:memberListDisplay("+pager.totalPage+");'>[마지막]</a>";
	} else {
		html+="[다음][마지막]";
	}
	
	$("#pageNumDiv").html(html);
}

</script>
