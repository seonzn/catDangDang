<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<link rel="stylesheet" href="/cdd/resource/css/bootstrap.css">
<script src="/cdd/resource/js/bootstrap.bundle.min.js"></script>
<script src="/cdd/resource/js/bootstrap.bundle.js"></script>
<script src="/cdd/resource/js/bootstrap.js"></script>
</head>
<script>
	$(document).ready(function(){
		$(".cddHeader").load("/cdd/header.cdd");
	});
</script>
<body class="all">
<div class="cddHeader"> 
</div>
<br/><br/><br/>
<div class="container" align="center" style="width:800px;">
	<h2 style="color: gray; font-weight: bolder;">저장됨</h2><br/>
	<c:if test="${collections == '[]' }">
		<div align="center">
			<h3 style="color: gray;">아직 저장된 피드가 없습니다.</h3>
		</div>
	</c:if>
	<c:if test="${collections != '[]' }">
		<div class="row">
			<c:forEach var="list" items="${collections }">
				<div class="col-md-4" style="height: 250px; padding-top: 10px; padding-bottom: 10px;">
					<img src="/cdd/save/${list.photo_dir }" style="width: 220px; height: 220px;"/>
				</div>
			</c:forEach>
		</div>
	</c:if>
</div>
</body>
</html>