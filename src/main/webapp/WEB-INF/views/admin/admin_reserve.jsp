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
		<h1 class="mt-4">예약 목록</h1>
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
				<i class="fas fa-table me-1"></i>예약
			</div>
				<%-- 게시글 목록을 출력하는 영역 --%>
			<div id="reserveListDiv"></div>

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
	if(confirm("예약을 정말로 삭제하시겠습니까?")) {
		var checkArr = new Array();
		var list = $("input[name='checkreserveNo']");
		for(var i=0; i<list.length; i++){
			if(list[i].checked){
				checkArr.push(list[i].value);
			}
		}
		console.log(checkArr);
		
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/admin/reserve_delete",
			data: {
				reserveNo : checkArr
			},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success: function(data) {
				if(data === "fail"){
					alert("선택예약 삭제 실패!");
				} else {
					reserveListDisplay(page);
				}
				
			}
		});
	}
});




var page=1;//현재 요청 페이지의 번호를 저장하기 위한 전역변수

//회원 목록을 출력하는 함수 호출
reserveListDisplay(page);

//AJAX 기능으로 요청하여 응답결과를 이용하여 게시글 목록을 출력하는 함수 - 페이징 처리
function reserveListDisplay(pageNum) {
	page=pageNum;
	$.ajax({
		type: "get",
		url: "${pageContext.request.contextPath}/admin/reserve_list?pageNum="+pageNum,
		dataType: "json",
		success: function(json) {
			console.log(json);
			if(json.reserveList.length==0) {
				var html="<table>";
				html+="<tr>";
				html+="<th width='800' colspan='7'>검색된 예약이 하나도 없습니다.</th>";	
				html+="</tr>";
				html+="</table>";
				$("#reserveListDiv").html(html);
				return;
			}
			
			var html="<table>";
			html+="<tr>";
			html+="<th><input type='checkbox' id='allCheck'></th>";				
			html+="<th>번호</th>";				
			html+="<th>이메일</th>";				
			html+="<th>카페</th>";				
			html+="<th>테마</th>";				
			html+="<th>시간</th>";				
			html+="<th>예약 날</th>";				
			html+="<th>인원</th>";				
			html+="<th>메모</th>";				
			html+="<th>날짜</th>";				
			html+="<th>결제방식</th>";				
			html+="</tr>";
			console.log()
			$(json.reserveList).each(function(index) {
				
				html+="<tr>";
				html+="<td class='reserve_check'>";
				html+="<input type='checkbox' name='checkreserveNo' value="+this.reserveNo+" class='check'>";
				html+="<td>"+(index+1)+"</td>";
				html+="<td>"+this.reserveEmail+"</td>";
				html+="<td>"+this.reserveCafe+"</td>";
				html+="<td>"+this.reserveTheme+"</td>";
				html+="<td>"+this.reserveTime+"</td>";
				html+="<td>"+(this.reserveDate).substr(0,10)+"</td>";
				html+="<td>"+this.reservePlayer+"</td>";
				html+="<td>"+this.reserveComment+"</td>";
				html+="<td>"+this.reserveNowdate+"</td>";
				html+="<td>"+this.reservePayment+"</td>";
				html+="</tr>";

			});
			html+="</table>";
			html+="<p id='allDetete'><button type='button' id='removeBtn'>선택삭제</button></p>";
			html+="<div id='message' style='color: red;'></div>";
			
			
			$("#reserveListDiv").html(html);
			
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
		html+="<a href='javascript:reserveListDisplay(1);'>[처음]</a>";
		html+="<a href='javascript:reserveListDisplay("+pager.prevPage+");'>[이전]</a>";
	} else {
		html+="[처음][이전]";
	}
	
	for(i=pager.startPage;i<=pager.endPage;i++) {
		if(pager.pageNum!=i) {
			html+="<a href='javascript:reserveListDisplay("+i+");'>["+i+"]</a>";
		} else {
			html+="["+i+"]";
		}
	}
	
	if(pager.endPage!=pager.totalPage) {
		html+="<a href='javascript:reserveListDisplay("+pager.nextPage+");'>[다음]</a>";
		html+="<a href='javascript:reserveListDisplay("+pager.totalPage+");'>[마지막]</a>";
	} else {
		html+="[다음][마지막]";
	}
	
	$("#pageNumDiv").html(html);
}

</script>
