<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
		<h1 class="mt-4">카페 목록</h1>
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
				<i class="fas fa-table me-1"></i>카페
			</div>
			<%-- 게시글 목록을 출력하는 영역 --%>
			<div id="cafeListDiv"></div>

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
		$("#message").text("선택된 카페가 하나도 없습니다.");
		return;
	}
	
	var checkArr = new Array();
	var list = $("input[name='checkCafe']");
	for(var i=0; i<list.length; i++){
		if(list[i].checked){
			checkArr.push(list[i].value);
		}
	}
	console.log(checkArr);
	
	$.ajax({
		type: "POST",
		url: "${pageContext.request.contextPath}/admin/cafe_delete",
		data: {
			cafeName : checkArr
		},
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			if(data === "fail"){
				alert("선택카페 삭제 실패!");
			} else {
				cafeListDisplay(page);
			}
			
		}
	});
});


$(document).on('change',"#allCheck",function() {
	if($(this).is(":checked")) {
		$(".check").prop("checked",true);
	} else {
		$(".check").prop("checked",false);
	}
});
var page=1;//현재 요청 페이지의 번호를 저장하기 위한 전역변수

//회원 목록을 출력하는 함수 호출
cafeListDisplay(page);

//AJAX 기능으로 요청하여 응답결과를 이용하여 게시글 목록을 출력하는 함수 - 페이징 처리
function cafeListDisplay(pageNum) {
	page=pageNum;
	$.ajax({
		type: "get",
		url: "${pageContext.request.contextPath}/admin/cafe_list?pageNum="+pageNum,
		dataType: "json",
		success: function(json) {
			console.log(json);
			if(json.cafeList.length==0) {
				var html="<table>";
				html+="<tr>";
				html+="<th width='800' colspan='7'>검색된 게시글이 하나도 없습니다.</th>";	
				html+="</tr>";
				html+="</table>";
				$("#cafeListDiv").html(html);
				return;
			}
			
			var html="<table>";
			html+="<tr>";
			html+="<th><input type='checkbox' id='allCheck'></th>";				
			html+="<th>카페 이름</th>";				
			html+="<th>카페 전화번호</th>";				
			html+="<th>카페 운영시간</th>";				
			html+="<th>카페 주소</th>";				
			html+="<th>카페 위치</th>";				
			html+="<th>카페 수정하기</th>";	
			html+="</tr>";
			console.log(json.cafeList)
			$(json.cafeList).each(function() {
				
				html+="<tr>";

				html+="<td class='cafe_check'>";
				html+="<input type='checkbox' name='checkCafe' value="+this.cafeName+" class='check'>";
				
				html+="<td>"+this.cafeName+"</td>";
				html+="<td>"+this.cafeTel+"</td>";
				html+="<td>"+this.cafeBhours+"</td>";
				html+="<td>"+this.cafeDomain+"</td>";
				html+="<td>"+this.cafeLoc+"</td>";
				html+="<td><button type='button' id='modifyBtn'>수정하기</button>";
				
				html+="</select></td>";
				html+="</tr>";
			});
			html+="</table>";
			html+="<p id='allDetete'><button type='button' id='removeBtn'>선택삭제</button></p>";
			html+="<div id='message' style='color: red;'></div>";
			
			
			$("#cafeListDiv").html(html);
			
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
		html+="<a href='javascript:cafeListDisplay(1);'>[처음]</a>";
		html+="<a href='javascript:cafeListDisplay("+pager.prevPage+");'>[이전]</a>";
	} else {
		html+="[처음][이전]";
	}
	
	for(i=pager.startPage;i<=pager.endPage;i++) {
		if(pager.pageNum!=i) {
			html+="<a href='javascript:cafeListDisplay("+i+");'>["+i+"]</a>";
		} else {
			html+="["+i+"]";
		}
	}
	
	if(pager.endPage!=pager.totalPage) {
		html+="<a href='javascript:cafeListDisplay("+pager.nextPage+");'>[다음]</a>";
		html+="<a href='javascript:cafeListDisplay("+pager.totalPage+");'>[마지막]</a>";
	} else {
		html+="[다음][마지막]";
	}
	
	$("#pageNumDiv").html(html);
}

</script>

