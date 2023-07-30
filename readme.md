# <img src="https://github.com/maemae22/escape-room/assets/101652279/fb6c589d-242e-4373-8480-f1f40b0a3a85" style="width: 5%;">&nbsp; 열려라 참깨 : 방탈출카페 소개 및 리뷰 서비스 
<br>

개발 기간 : 2022.07 ~ 2022.08<br>
개발 인원 : 백엔드 5명 (팀 프로젝트)<br>
Code (Github) : https://github.com/maemae22/spring-legacy-project-escape-room<br><br>
담당 역할 : <br>
1. 카페 – 카페 목록 조회, 카페 검색<br>
2. 테마 – 테마 상세페이지, 테마 검색, 이 업체의 다른 테마 출력<br>
3. 리뷰 – 리뷰 CRUD (작성, 조회, 수정, 삭제)<br>
4. 카페, 테마, 리뷰 관련 페이지의 **프론트단** 개발<br>
<br>

## 개발 환경

언어 : Java 11, JavaScript, HTML, CSS<br>
프레임워크 : Spring Framework 5.3.22, MyBatis 3.5.10<br>
DB : Oracle 11g Enterprise<br>
IDE : Eclipse 4.23 (2022-03)<br>
Tools : **SVN**, Postman, Slack<br>

## DB ERD
![image](https://github.com/maemae22/spring-legacy-project-escape-room/assets/101652279/46c1bead-2b50-4d53-8346-cebadfaddf69)

## 주요 구현 기능
### 1. 리뷰 작성 유효성 검사 (javascript) 
\- 입력되지 않은 항목이 있을 경우, 리뷰 작성이 되지 않도록 설정했습니다.<br><br>
<img src="https://blog.kakaocdn.net/dn/bDt9nE/btspsFpLYVt/HDwPjaAQk5qZwDqrK58bLK/img.gif" style="width: 60%;">

### 2. 테마당 1번만 리뷰 작성 가능하도록 제한
\- 여러번 리뷰를 작성하여 리뷰 평점을 조작하는 것을 막기 위해, 한 아이디당 동일 테마에는 1건의 리뷰만 작성할 수 있도록 설정하였습니다.<br><br>
<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdkrB5k%2FbtspnjALqzW%2FLIVWHdoJYOphEkf8n8v0d0%2Fimg.png" style="width: 50%;">

### 3. 그 외의 구현 기능들은 아래 repository에서 확인해주시면 감사하겠습니다.
https://github.com/maemae22/escape-room ('열려라 참깨' 리팩토링 개인 프로젝트)
