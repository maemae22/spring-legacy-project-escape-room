<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<div class="container-fluid px-4">
	<h1 class="mt-4">테마 등록</h1>

	<div class="card mb-4">
		<div class="card-header">

			<div id="writeBtn">
				테마 등록하기 <i class="fas fa-table me-1"></i>
			</div>
		</div>
		<%-- 테마 등록 폼 --%>
		<div id="themeListDiv"></div>
		<form method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<th>테마이름</th>
					<td><input type="text" id="themeName" name="themeName" /></td>
				</tr>

				<tr>
					<th>장르</th>
					<td><select class="genre" name="themeGenre">
							<option value="코믹" selected="selected">코믹</option>
							<option value="스릴러">스릴러</option>
							<option value="탈출">탈출</option>
							<option value="어드벤쳐">어드벤쳐</option>
							<option value="게임">게임</option>
							<option value="SF">SF</option>
							<option value="판타지">판타지</option>
							<option value="미스터리">미스터리</option>
							<option value="추리">추리</option>
							<option value="역사">역사</option>
							<option value="공포">공포</option>
							<option value="범죄">범죄</option>
							<option value="로맨스">로맨스</option>
							<option value="수사">수사</option>
							<option value="드라마">드라마</option>
							<option value="잡입">잡입</option>
							<option value="음악">음악</option>
							<option value="모험">모험</option>
							<option value="감성">감성</option>
							<option value="아케이드">아케이드</option>
							<option value="?">?</option>
							<option value="야외방탈출">야외방탈출</option>
							<option value="동화">동화</option>
							<option value="액션">액션</option>
					</select></td>
				</tr>
				<tr>
					<th>활동성</th>
					<td><select class="activity" name="themeActivity">
							<option value="낮음" selected="selected">낮음</option>
							<option value="보통">보통</option>
							<option value="높음">높음</option>
					</select></td>
				</tr>
				<tr>
					<th>플레이타임</th>
					<td><select class="playtime" name="themeLimit">
							<option value="60분" selected="selected">60분</option>
					</select></td>
				</tr>
				<tr>
					<th>난이도</th>
					<td><select class="difficult" name="themeDifficult">
							<option value="1" selected="selected">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select></td>
				</tr>
				<tr>
					<th>인원</th>
					<td><input type="text" id="recommend" name="themeRecommend" /></td>
				</tr>
				<tr>
					<th>테마의 카페이름</th>
					<td><input type="text" id="themeCname" name="themeCname" /></td>
				</tr>
				<tr>
					<th>테마 줄거리</th>
					<td><input type="text" id="themeIntro" name="themeIntro" /></td>
				</tr>
				<tr>
					<th>이미지</th>
					<td><input type="file" id="themeImage" name="file" /></td>
				</tr>
				<tr>
					<td colspan="8"><button type="submit">테마 등록</button></td>
				</tr>
			</table>
		</form>
		<%-- 페이지 번호를 출력하는 영역 --%>
	</div>
</div>



<script>
	
</script>
</html>