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
<script>
	$(document).ready(function(){
		$(".cddHeader").load("/cdd/header.cdd");
	});
</script>
</head>
<body class="all">
<c:if test="${search == '' }">
	<script>
		alert("아이 아무것도 없잖아!");
		history.go(-1);
	</script>
</c:if>
<c:if test="${search != '' }">
	<script>
		$(document).ready(function(){
			$("#tagsResultView").show();
			$("#feedsResultView").hide();
			$("#userResultView").hide();
			
			$("#searchTags").click(function(){
				$("#tagsResultView").show();
				$("#feedsResultView").hide();
				$("#userResultView").hide();
			});
			$("#searchFeeds").click(function(){
				$("#tagsResultView").hide();
				$("#feedsResultView").show();
				$("#userResultView").hide();
			});
			$("#searchUser").click(function(){
				$("#tagsResultView").hide();
				$("#feedsResultView").hide();
				$("#userResultView").show();
			});
		});
		
	</script>
	<div class="cddHeader">
	</div>
	<br/><br/><br/>
	<div class="container" align="center">
		<div style="position: fixed; margin-left: 28%; z-index: 1;">
			<div class="btn-group btn-group-toggle" data-toggle="buttons" style="background-color: #f4f4f4;">
			  <label class="btn btn-outline-secondary active" style="width: 80px;">
			    <input type="radio" name="options" id="searchTags" checked> #
			  </label>
			  <label class="btn btn-outline-secondary" style="width: 80px;">
			    <input type="radio" name="options" id="searchFeeds"> 피드
			  </label>
			  <label class="btn btn-outline-secondary" style="width: 80px;">
			    <input type="radio" name="options" id="searchUser"> 사용자
			  </label>
			</div>
		</div>
		<br/><br/><br/>
		<!-- search result -->
		<div align="center" style="width:80%;">
		<h3>${search} 검색 결과</h3>
			<div id="tagsResultView">
				<div class="row">
					<c:if test="${searchTags == '[]' }">
						<div class="col" align="center">
							<h5 style="color: gray;"> 해시태그 검색 결과가 없습니다.</h5>
						</div>
					</c:if>
					<c:if test="${searchTags != '[]' }">
						<c:forEach var="list" items="${searchTags }">
							<div class="col-md-3" style="height: 200px;">
								<a href="/cdd/feeds/feedContent.cdd?feed_num=${list.feed_num }">
									<img src="/cdd/save/${list.photo_dir }" style="width: 100%; height: 95%;"/>
								</a>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
			<div id="feedsResultView">
				<div class="row" align="center">
					<c:if test="${searchFeeds == '[]' }">
						<div class="col" align="center">
							<h5 style="color: gray;">피드 검색 결과가 없습니다.</h5>
						</div>
					</c:if>
					<c:if test="${searchFeeds != '[]' }">
						<c:forEach var="list" items="${searchFeeds }">
							<div class="col-md-3" style="height: 200px;">
								<img src="/cdd/save/${list.photo_dir }" style="width: 100%; height: 95%;"/>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
			<div id="userResultView">
				<c:if test="${searchUsers == '[]' }">
					<div class="row">
						<div class="col" align="center">
							<h5 style="color: gray;">사용자 검색 결과가 없습니다.</h5>
						</div>
					</div>
				</c:if>
				<c:if test="${searchUsers != '[]' }">
					<c:forEach var="list" items="${searchUsers }">
						<div class="row">
							<div class="col-md-3 col-md-offset-3">
							</div>
							<div class="col-md-1" style="height: 60px; ">
								<img src="/cdd/save/${list.user_profile }" style="width: 50px; height: 50px; border-radius: 70%; overflow: hidden;"/>
							</div>
							<div class="col-md-2" align="left">
								<h6 style="display: inline;">
									<a role="button" onclick="userProfileView('${list.user_id }')">${list.user_id }</a>
								</h6><br/>
								<h6 style="display: inline; font-weight: boler; color: gray;">${list.user_name }</h6>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
</c:if>
</body>
<script>
	function userProfileView(userId){
		location.href="/cdd/myPage/userProfile.cdd?profileId="+userId;
	}
</script>
</html>