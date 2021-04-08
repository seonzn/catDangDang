<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>CDD</title>
	
	<!-- 일정 -->
	<link rel="stylesheet" href="/cdd/resource/calendar/calen/css/fullcalendar.min.css" />
	<link rel="stylesheet" href="/cdd/resource/css/bootstrap.min.css">
	<link rel="stylesheet" href='/cdd/resource/calendar/calen/css/select2.min.css' />
    <link rel="stylesheet" href='/cdd/resource/calendar/calen/css/bootstrap-datetimepicker.min.css' />
    <link rel="stylesheet" href="/cdd/resource/calendar/calen/css/main.css">
</head>
<body>
<div class="modal-header">
	<h5 class="modal-title" id="exampleModalLabel" > 일정 추가 </h5>
	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>
	<div class="modal-body">
    <div class="container">
    	<div class="row" style="height: 550px;">
    		<div class="col-md-7">
    			<div id="wrapper">
					<div id="loading"></div>
				    <div id="calendar"></div>
				</div>
    		</div>
    		<div class="col-md-5" style="background-color: navy; height: 550px;" >
    			<div class="row" style="background-color: blue; height: 120px;">
					펫 이름    				
    			</div>
    			<div class="row" style="background-color: fuchsia; height: 30px;">
    				<h4><label>제목</label></h4>
    			</div>
    			<div class="row" style="background-color: gray; height: 80px;">
    				<div class="input-group flex-nowrap">
					  <input type="text" class="form-control"  name="sche_subject" style="outline: none;">
					</div>
    			</div>
    			<div class="row" style="background-color: olive; height: 40px;">
    				<h4><label>내용</label></h4>
    			</div>
    			<div class="row" style="background-color: maroon; height: 150px;">
    				<div class="form-floating">
						<textarea class="form-control" placeholder="내용작성" id="floatingTextarea2" name="sche_content" style="height: 100%; width: 100%"></textarea>
					</div>
    			</div>
    			<div class="row" style="background-color: orange; height: 40px;">
    				<h4><label>날짜</label></h4>
    			</div>
    			<div class="row" style="height: 40px;">
    				<div>
    					날짜 선택되면 일로옴 
    				</div>
    			</div>
    			<div class="row" style="background-color: orange; height: 40px;">
    				<h4><label>시간</label></h4>
    			</div>
    			<div class="row" style="background-color: activecaption; height: 40px;">
    				<select class="form-select" aria-label="Default select example" name="sche_time">
						<option selected>시간을 선택하세요</option>
						<c:forEach var="i" begin="6" end="24" step="1">
							<option value="${i}:00">${i}:00</option>
						</c:forEach>
					</select>
    			</div>
    		</div>
    	</div>
    </div>    
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	<button type="button" class="btn btn-primary">저장</button>
</div>


	<!-- 일정 -->
    <script src="/cdd/resource/calendar/calen/js/moment.min.js"></script>
    <script src="/cdd/resource/calendar/calen/js/fullcalendar.min.js"></script>
    <script src="/cdd/resource/calendar/calen/js/ko.js"></script>
    <script src="/cdd/resource/calendar/calen/js/select2.min.js"></script>
    <script src="/cdd/resource/calendar/calen/js/bootstrap-datetimepicker.min.js"></script>
    <script src="/cdd/resource/calendar/calen/js/main.js"></script>

</body>
</html>