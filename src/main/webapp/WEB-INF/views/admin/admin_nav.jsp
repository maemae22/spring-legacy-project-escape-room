<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
     <title>열려라참깨 관리자</title>
</head>
 
<!-- submit 사용시 -->
<div style='position:absolute'>
<iframe src='' name='ifr_ok'  width=0 height=0></iframe>
</div>

<body class="no-skin">


<!-- #section:basics/navbar.layout -->
<div id="navbar" class="navbar navbar-default">
	<script type="text/javascript">
		try{ace.settings.check('navbar' , 'fixed')}catch(e){ ace.settings.check('navbar' , 'fixed') }
	</script>

	<div class="navbar-container" id="navbar-container">
		<!-- #section:basics/sidebar.mobile.toggle -->
		<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
			<span class="sr-only">Toggle sidebar</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>

		<!-- /section:basics/sidebar.mobile.toggle -->
		<div class="navbar-header pull-left">
			<!-- #section:basics/navbar.layout.brand -->
			<p style='color:#ffffff; font-size:20px; margin-top:13px;'>
				&nbsp; 열려라참깨</p>
		</div>

		<!-- #section:basics/navbar.dropdown -->
		<div class="navbar-buttons navbar-header pull-right" role="navigation">
			<ul class="nav ace-nav">

	
				<li class="purple">
					<a href="#" target=_blank title='homepage view '>
						<i class="ace-icon fa fa-home"></i>
					</a>
				</li>
				<!-- #section:basics/navbar.user_menu -->
				<li class="light-blue">
					<a data-toggle="dropdown" href="#" class="dropdown-toggle">

						<span class="user-info">
							<small style='color:#ffff00;'>마스터</small>
							관리자						</span>
						<i class="ace-icon fa fa-caret-down"></i>
					</a>
					<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
						<li><a href=javascript:fun_logout()><i class="ace-icon fa fa-power-off"></i> 로그아웃</a></li>
					</ul>
				</li>

				<!-- /section:basics/navbar.user_menu -->
			</ul>
		</div>

		<!-- /section:basics/navbar.dropdown -->
	</div><!-- /.navbar-container -->
</div>



<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container"></div>
	<script type="text/javascript">
		try{ace.settings.check('main-container' , 'fixed')}catch(e){}
	</script>

	<!-- #section:basics/sidebar -->
	<div id="sidebar" class="sidebar responsive">
		<script type="text/javascript">
			try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
		</script>

		<div class="sidebar-shortcuts" id="sidebar-shortcuts">
			<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
				<button class="btn btn-success" onclick="location.href='#'" title="예약목록">
					<i class="ace-icon fa fa-list"></i>
				</button>
				<button class="btn btn-info" onclick="#" title="예약등록">
					<i class="ace-icon fa fa-globe"></i>
				</button>
				<button class="btn btn-warning" onclick="location.href='#'" title="게시판">
					<i class="ace-icon fa fa-comments"></i>
				</button>
				<button class="btn btn-danger" onclick="location.href='#'" title="접속통계">
					<i class="ace-icon fa fa-bar-chart-o"></i>
				</button>
			</div>

			<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
				<span class="btn btn-success"></span>
				<span class="btn btn-info"></span>
				<span class="btn btn-warning"></span>
				<span class="btn btn-danger"></span>
			</div>
		</div><!-- /.sidebar-shortcuts -->


		<ul class="nav nav-list">
			<li class='active open'>
				<a href="#">
					<i class="menu-icon fa fa-tachometer"></i>
					<span class="menu-text"> 메인화면 </span>
				</a>
				<b class="arrow"></b>
			</li>
			<li >
				<a href="#" class="dropdown-toggle">
					<i class="menu-icon fa fa-tag"></i><span class="menu-text"> 회원관리 </span> <b class="arrow fa fa-angle-down"></b>
				</a>
				<b class="arrow"></b>
				<ul class="submenu">
					<li><a href=#>회원목록</a></li>
					<li><a href=#>메인이미지</a></li>
					<li><a href=#>아이피차단</a></li> <%-- 아이피차단하는거 스프링 인터셉터쓰셈 --%>
				</ul>
			</li>
			<li >
				<a href="#" class="dropdown-toggle">
					<i class="menu-icon fa fa-globe"></i><span class="menu-text"> 예약관리 </span> <b class="arrow fa fa-angle-down"></b>
				</a>
				<b class="arrow"></b>
				<ul class="submenu">
					<li><a href=#>예약목록</a></li>
					<li><a href=#>제휴문의</a></li>
				</ul>
			</li>
			<li >
				<a href="#" class="dropdown-toggle">
					<i class="menu-icon fa fa-cogs"></i><span class="menu-text"> 테마관리 </span> <b class="arrow fa fa-angle-down"></b>
				</a>
				<b class="arrow"></b>
				<ul class="submenu">
					<li><a href=#>테마</a></li>
				</ul>
			</li>
			
			<li >
				<a href="#" class="dropdown-toggle">
					<i class="menu-icon fa fa-bar-chart-o"></i><span class="menu-text"> 접속통계 </span> <b class="arrow fa fa-angle-down"></b>
				</a>
				<b class="arrow"></b>
				<ul class="submenu">
					<li><a href=#>방문자현황</a></li>
				</ul>
			</li>
		</ul><!-- /.nav-list -->

		<!-- #section:basics/sidebar.layout.minimize -->
		<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
			<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
		</div>

		<!-- /section:basics/sidebar.layout.minimize -->
		<script type="text/javascript">
			try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
		</script>
	</div>
	<!-- /section:basics/sidebar -->
	
	<!-- basic scripts -->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='<c:url value="admin/bootstrap/assets/js/jquery.mobile.custom.js"/>'>"+"<"+"/script>");
		</script>
		<script src="<c:url value="admin/bootstrap/assets/js/bootstrap.js"/>"></script>
		<script src="<c:url value="admin/bootstrap/assets/js/ace/ace.js"/>"></script>
		<script src="<c:url value="admin/bootstrap/assets/js/ace/ace.sidebar.js"/>"></script>
	
</body>
</html>

<!-- 상단 메뉴 고정 -->
<script>
	ace.settings.navbar_fixed(null, true);//@ ace-extra.js
</script>
