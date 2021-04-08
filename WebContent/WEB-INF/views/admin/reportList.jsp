<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<link rel="stylesheet" href="/cdd/resource/css/bootstrap.css">
<script src="/cdd/resource/js/bootstrap.bundle.min.js"></script>
<script src="/cdd/resource/js/bootstrap.bundle.js"></script>
<script src="/cdd/resource/js/bootstrap.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script>
	$(document).ready(function(){
		$(".cddHeader").load("/cdd/header.cdd");
	});
</script>
</head>
<body class="all">
<div class="cddHeader"> 
</div>
<br/><br/><br/><br/>
<div class="container" align="center">
	<h4>신고 접수 목록</h4>
	<br/>
	<div class="test" style="height: 500px; overflow: auto;">
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col" width="50px">번호</th>
		      <th scope="col" width="120px">카테고리</th>
		      <th scope="col" width="120px">신고자</th>
		      <th scope="col" width="120px">피신고자</th>
		      <th scope="col" width="350px">신고내용</th>
		      <th scope="col" width="50px">관리</th>
		    </tr>
		  </thead>
		  <tbody class="reportLoadView">
		  <c:if test="${reportList == '[]' }">
		  	<tr align="center">
		  		<td colspan="6" style="font-size: 20pt; font-weight: bold; color: gray;">접수된 신고가 없습니다.</td>
		  	</tr>
		  </c:if>
		  <c:if test="${reportList != '[]' }">
			<c:forEach var="list" items="${reportList }" varStatus="status">
		    <tr>
		    	<td>${status.count }</td>
				<td>${list.reportCate }</td>
				<td>${list.reporterId}</td>
				<td>${list.repotedId}</td>
				<td>${list.reportContent}</td>
				<td>
					<div class="listview${status.count }" >
						<c:if test="${list.reportState == 0 }">
							<a role="button" onclick="statusUpdate(${list.report_num}, ${list.reportState}, ${status.count})">
								<i class="fas fa-check" style="color: gray;"></i>
							</a>
						</c:if>
						<c:if test="${list.reportState == 1 }">
							<a role="button" onclick="statusUpdate(${list.report_num}, ${list.reportState}, ${status.count})">
								<i class="fas fa-check" style="color: red;"></i>
							</a>
						</c:if>
					</div>
				</td>
		    </tr>
			</c:forEach>
			</c:if>
		  </tbody>
		</table>
<script>
$(document).ready(function(){
	var startNum=1;
	var endNum=10;
	
	$(".test").scroll(function(){
		var scrollTop = $(this).scrollTop();
		var innerHeight = $(this).innerHeight();
		var scrollHeight = $(this).prop('scrollHeight');
	    if(scrollTop + innerHeight >= scrollHeight-0.5){
	    	startNum = Number(startNum);
	    	endNum = Number(endNum);
	    	startNum+=10;
	    	endNum+=10;
	    	startNum = String(startNum);
	    	endNum = String(endNum);
	    	
	    	var ajaxJson = new Object;
	    	ajaxJson.startNum = startNum;
	    	ajaxJson.endNum = endNum;
	    	var sendData = JSON.stringify(ajaxJson);
	    	$.ajax({
	    		url : "/cdd/admin/ajaxLoadReports.cdd",
	    		contentType: 'application/json;charset=UTF-8',
	    		method: "POST",
	    		data : sendData,
	    		success: function(res){
	    			var reportList = JSON.parse(res);
	    			startNum = Number(startNum);
	    			appendList(reportList, startNum);
	    		}
	    	});
	    }
	});
	
	function appendList(reportList, startNum){
		var html="";
		var j = startNum;
		for(var i=0; i<reportList.length; i++){
			html += "<tr>";
			html += "<td>"+j+"</td>";
			html += "<td>"+reportList[i].reportCate+"</td>";
			html += "<td>"+reportList[i].reporterId+"</td>";
			html += "<td>"+reportList[i].repotedId+"</td>";
			html += "<td>"+reportList[i].reportContent+"</td>";
			html += "<td>";
			html += "<div class='listview"+j+"'>";
			if(reportList[i].reportState == 0){
				html += "<a role='button' onclick='statusUpdate("+reportList[i].report_num+", "+reportList[i].reportState+", "+j+")'>";
				html += "<i class='fas fa-check' style='color: gray;'></i></a>";
			}
			if(reportList[i].reportState == 1){
				html += "<a role='button' onclick='statusUpdate("+reportList[i].report_num+", "+reportList[i].reportState+", "+j+")'>";
				html += "<i class='fas fa-check' style='color: red;'></i></a>";
			}
			html += "</div>";
			html += "</td>";
			html += "</tr>";
			j++;
		}
		$(".reportLoadView").append(html);
	}
	
});
	function statusUpdate(reportNum, status, divNum){
		var ajaxJson = new Object();
		ajaxJson.reportNum = reportNum;
		ajaxJson.status = status;
		var sendData = JSON.stringify(ajaxJson);
		$.ajax({
    		url : "/cdd/admin/ajaxUpdateStatus.cdd",
    		contentType: 'application/json;charset=UTF-8',
    		method: "POST",
    		data : sendData,
    		success: function(res){
    			var status = JSON.parse(res);
    			var html = "";
    			if(status.state == 0){
    				html += "<a role='button' onclick='statusUpdate("+status.reportNum+", "+status.state+", "+divNum+")'>";
    				html += "<i class='fas fa-check' style='color: gray;'></i></a>";
    			}
    			if(status.state == 1){
    				html += "<a role='button' onclick='statusUpdate("+status.reportNum+", "+status.state+", "+divNum+")'>";
    				html += "<i class='fas fa-check' style='color: red;'></i></a>";
    			}
    			$(".listview"+divNum).empty();
    			$(".listview"+divNum).append(html);
    		}
    	});
		
	}
</script>
	</div>
</div>
</body>
</html>