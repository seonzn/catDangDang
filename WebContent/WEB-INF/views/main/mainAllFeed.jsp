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
<!-- 달력 사용 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<!-- 달력인코딩 -->
<script src="/cdd/resource/calendar/encodingKo.js"></script>
<!-- UserProfile JavaScript -->
<script src="/cdd/resource/userProfile.js"></script>
</head>
<script>
	$(document).ready(function(){
		$("#badook").hide();
		$(".cddHeader").load("/cdd/header.cdd");
		
	});
	function showList(){
		$("#list").show();
		$("#badook").hide();
		
	}
	function showBadook(){
		$("#list").hide();
		$("#badook").show();
	}
</script>
<body class="all">
<div class="cddHeader"> 
</div>
<br/><br/><br/>
<div class="container">
	<div style="position: fixed; margin-left: 500px;">
		<div class="btn-group btn-group-toggle" data-toggle="buttons" >
		  <label class="btn btn-outline-secondary active">
		    <input type="radio" name="options" id="option2" checked onclick="showList()"> <img src="/cdd/resource/img/list.png" width="30px" />
		  </label>
		  <label class="btn btn-outline-secondary">
		    <input type="radio" name="options" id="option1" onclick="showBadook()"> <img src="/cdd/resource/img/badook.png" width="30px" />
		  </label>
		</div>
	</div>
	<br/><br/><br/><br/>
	<!-- main content -->
	<div align="center">
		<div id="list" style="width: 800px; height: 800px; background-color: gray;" align="center">
			
		</div>
		<div id="badook" style="width: 800px; height: 800px; background-color: orange;" align="center">
			
		</div>
	</div>
	
	
	<!-- floating button -->
	<div class="btn-group dropup" style="position: fixed; bottom: 50px; right: 200px; ">
	  <a class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    <img src="/cdd/resource/img/floatingBtn.png" width="40px"/>
	  </a>
	  <div class="dropdown-menu">
	  	<a class="dropdown-item" href="#">피드작성</a>
        <a class="dropdown-item" id="noteWriteForm" data-target="#staticBackdrop" data-toggle="modal" role="button">일지작성</a>
		<a class="dropdown-item" id="scheAddForm" data-target="#staticBackdrop4" data-toggle="modal" role="button">일정추가</a>
	  </div>
	</div>
	
	<!-- 작성 noteWriteform  -->
	<div id="staticBackdrop" class="modal fade" data-backdrop="static" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content noteWriteForm"></div>
		</div>
	</div>
	
	<!-- 일정 추가 -->
	<div id="staticBackdrop4" class="modal fade" data-backdrop="static"
		tabindex="-1" role="dialog">
		<div class="modal-dialog modal-xl">
			<div class="modal-content scheAddForm"></div>
		</div>
	</div>
</div>
</body>
</html>