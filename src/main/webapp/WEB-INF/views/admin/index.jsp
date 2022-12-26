<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/admin/test/css/styles.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>

<!-- 
<link rel="stylesheet" type="text/css" href="<c:url value="admin/bootstrap/assets/css/bootstrap.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="admin/css/common.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="admin/bootstrap/assets/css/ace.css"/>"/>

<link rel="stylesheet" type="text/css" href="<c:url value="admin/bootstrap/assets/css/font-awesome.css"/>" />

<script type="text/javascript" src="<c:url value="admin/bootstrap/assets/js/ace-extra.js"/>"></script>
<script type="text/javascript" src="<c:url value="admin/js/jquery-1.12.4.min.js"/>"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
 -->
</head>
<body class="sb-nav-fixed">

	<div id="admin_nav">
		<tiles:insertAttribute name="admin_nav" />
	</div>
	<div id="layoutSidenav">
		
			<div id="admin_sidebar">
				<tiles:insertAttribute name="admin_sidebar" />
			</div>
		<div id="layoutSidenav_content">
			<div id="admin_content">
				<tiles:insertAttribute name="admin_content" />
			</div>

			<div id="admin_footer">
				<tiles:insertAttribute name="admin_footer" />
			</div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/admin/test/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/admin/test/assets/demo/chart-area-demo.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin/test/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/admin/test/js/datatables-simple-demo.js"></script>
</body>
</html>