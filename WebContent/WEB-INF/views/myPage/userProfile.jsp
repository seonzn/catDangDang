<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CDD</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/cdd/resource/js/bootstrap.bundle.min.js"></script>
<script src="/cdd/resource/js/bootstrap.bundle.js"></script>
<script src="/cdd/resource/js/bootstrap.js"></script>
<link rel="stylesheet" href="/cdd/resource/css/bootstrap.css">

<!-- 달력 사용 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<!-- 달력인코딩 -->
<script src="/cdd/resource/calendar/encodingKo.js"></script>
<!-- UserProfile JavaScript -->
<script src="/cdd/resource/userProfile.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script>
	$(document).ready(function(){
		$(".cddHeader").load("/cdd/header.cdd");
	});
</script>
</head>
<body style="background-color: #f4f4f4;">
<c:if test="${profileIdInfo.userInfo.blocked == 1 }">
	<script>
		alert("정지된 계정입니다.");
		history.go(-1);
	</script>
</c:if>
<div class="cddHeader">
</div>
<br/><br/><br/><br/>
	<!-- 나중에 색 지우기 -->
	<div class="container" style="width: 900px;">
		<div class="row">
			<div class="col-md-3" style="height: 200px;">
				<%-- <h5 style="text-align: center;">${sessionScope.memId}</h5> --%>
				<img src="/cdd/save/${profileIdInfo.userInfo.user_profile}" style="width: 170px; height: 170px; border-radius: 70%; overflow: hidden;"/>
			</div>
			<div class="col-md-7">
				<div class="row" >
					<div class="col" style="height: 50px;">
					<c:if test="${sessionScope.memId eq profileIdInfo.userInfo.user_id}">
						<p style="display: inline; font-size: 20pt;">${profileIdInfo.userInfo.user_id}</p>&nbsp;&nbsp;&nbsp;
						<a data-toggle="modal" data-target="#modifyProfileModal" role="button" onclick="modifyProfileModalView()">
							<img src="/cdd/resource/img/editProfile.png" width="90px" />
						</a>
					</c:if>
					<c:if test="${sessionScope.memId ne profileIdInfo.userInfo.user_id}">
						<p style="display: inline; font-size: 20pt;">${profileIdInfo.userInfo.user_id}</p>&nbsp;&nbsp;&nbsp;
						<a role="button" data-toggle="modal" data-target="#sendDmForm" 
							onclick="sendValue('${profileIdInfo.userInfo.user_id}')">
							메세지 보내기
						</a>&nbsp;&nbsp;&nbsp;
						<c:if test="${profileIdInfo.flwCh == 1 }">
							<a id="flwChBtn" onclick=""><i class="fas fa-user-check"></i></a>
						</c:if>
						<c:if test="${profileIdInfo.flwCh == 0}">
							<a id="flwChBtn" onclick=""><i class="fas fa-user-plus"></i></a>
						</c:if>
					</c:if>
					</div>
				</div>
				<div class="row">
					<div class="col" style="height: 50px; padding-top: 7px;">
						<p style="display: inline;">
							게시물 <span style="font-weight: bolder;">${profileIdInfo.feedCnt}</span>
						</p>&nbsp;&nbsp;&nbsp;
						
						<a role="button" style="font-size: 12pt;" data-toggle="modal" data-target="#followView" 
							onclick="followView('${profileIdInfo.userInfo.user_id}')">
							팔로우 <span style="font-weight: bolder;">${profileIdInfo.flwCnt}</span>
						</a>&nbsp;&nbsp;&nbsp;
						
						<a role="button" style="font-size: 12pt;" data-toggle="modal" data-target="#followerView" 
							onclick="followerView('${profileIdInfo.userInfo.user_id}')">
							팔로워 <span style="font-weight: bolder;">${profileIdInfo.flwerCnt}</span>
						</a>&nbsp;&nbsp;&nbsp;
					</div>
				</div>
				<div class="row">
					<div class="col" style="height: 100px;">
					<p style="font-size: 12pt; font-weight: bolder;">${profileIdInfo.userInfo.user_name}</p>
					<h6>${profileIdInfo.userInfo.user_bio }</h6>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-md-offset-2" ></div>
			<!--  offset 양옆 길이 줄이기 -->
		</div>
		<div class="row" style="padding-bottom: 40px">
			<div class="col-md-10" style="height: 50px;">
				<!-- 펫 추가 영역 -->
				<!-- 펫있을경우 사진 부터  -->
				<c:if test="${ count > 0 }">
					<c:forEach var="pet_infoDTO" items="${petInfoList}">
						<c:if test="${pet_infoDTO.pet_profile eq 'defaultimg.png'}">
							<a role="button" class="pet_nameInfo" onclick="pet_Name('${pet_infoDTO.pet_name}',${pet_infoDTO.pet_number})"><img
								src="../resource/img/${pet_infoDTO.pet_profile}" width="50px"
								height="100%">${pet_infoDTO.pet_name}
							</a>
						</c:if>
						<c:if test="${!(pet_infoDTO.pet_profile eq 'defaultimg.png')}">
							<a role="button" class="pet_nameInfo " onclick="pet_Name('${pet_infoDTO.pet_name}',${pet_infoDTO.pet_number})"><img
								src="/cdd/save/${pet_infoDTO.pet_profile}" width="50px"
								height="100%">${pet_infoDTO.pet_name}
							</a>
						</c:if>
					</c:forEach>
				</c:if>
<!-- ########### 유저일경우만 보일수 있게 분기처리 해야함 -->
				<a id="petInfobtn" data-target="#staticBackdrop2" data-toggle="modal"
					role="button"><img class="meterial-icons"
					src="/cdd/resource/img/floatingBtn.png" style="width: 50px; height: 100%;">
				</a>
			</div>
		</div>
		<!-- 펫 정보 보기 수정 영역 -->
		<c:if test="${count > 0}">
			<div class="row" style="padding-bottom: 20px;">
				<div class="col-md-5 col-md-offset-5"></div>
				<div class="col-md-4">
					<a id="petViewbtn" data-target="#staticBackdrop3" data-toggle="modal"
						role="button">
					</a>
				</div>
				<div class="col-md-3 col-md-offset-4"></div>
			</div>
		</c:if>
		<!-- 달력 / 일지영역 -->
		<div class="row" style="padding-bottom: 30px">
			<div class="col-md-6" style="background: lime; height: 400px;">
				<div class="row" style="background: maroon; height: 300px;">
					달력 작업 영역
				</div>
				<div class="row" style="background: orange; height: 100px;">
					<div class="col-md-9" style="background: black; height: 100px;">
						<div class="row" style="background: white; height: 70px;">
							내용
						</div>
						<div class="row" style="background: pink; height: 30px;">
							등록버튼
						</div>
					</div>
					<div class="col-md-3">수정 삭제 영역</div>
				</div>
			</div>
			<div class="col-md-6" style="background: aqua; height: 400px">
				<div class="row" style="background: activeborder; height: 40px;">
					일지 버튼 작업영역</div>
				<div class="row" style="background: black; height: 360px">일지
					내용 작업 영역</div>
			</div>
		</div>

		<!-- 게시글 이미지 작업내역 -->
		<div class="row" style="background: fuchsia;">
			<div class="col-md-3">이미지</div>
			<div class="col-md-3">이미지</div>
			<div class="col-md-3">이미지</div>
			<div class="col-md-3">이미지</div>
			<div class="col-md-3">이미지</div>
			<div class="col-md-3">이미지</div>
			<div class="col-md-3">이미지</div>
			<div class="col-md-3">이미지</div>
			<div class="col-md-3">이미지</div>
			<div class="col-md-3">이미지</div>
			<div class="col-md-3">이미지</div>
			<div class="col-md-3">이미지</div>
			<div class="col-md-3">이미지</div>
			<div class="col-md-3">이미지</div>
			<div class="col-md-3">이미지</div>
		</div>
		<div class="row" style="padding-top: 80px"></div>
	</div>
	<!-- 컨테이너 안에 작업 -->

	<!-- floating button -->
	<div class="btn-group dropup"
		style="position: fixed; bottom: 50px; right: 200px;">
		<a class="btn dropdown-toggle" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> <img
			src="/cdd/resource/img/floatingBtn.png" width="40px" />
		</a>
		<div class="dropdown-menu">
			<a class="dropdown-item" href="#">피드작성</a> 
			<a class="dropdown-item" id="noteWriteForm" data-target="#staticBackdrop" data-toggle="modal" role="button">일지작성</a>
			<a class="dropdown-item" id="scheAddForm" data-target="#staticBackdrop4" data-toggle="modal" role="button">일정추가</a>
			<!-- Dropdown menu links -->
		</div>
	</div>

	<!-- 작성 noteWriteform  -->
	<div id="staticBackdrop" class="modal fade" data-backdrop="static" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content noteWriteForm"></div>
		</div>
	</div>
	
	<!-- 펫 작성폼 -->
	<div id="staticBackdrop2" class="modal fade" data-backdrop="static"
		tabindex="-1" role="dialog">
		<div class="modal-dialog modal-mg">
			<div class="modal-content petInfobtn"></div>
		</div>
	</div>
	
	<!-- 펫 정보 폼 -->
	<div id="staticBackdrop3" class="modal fade" data-backdrop="static"
		tabindex="-1" role="dialog">
		<div class="modal-dialog modal-mg">
			<div class="modal-content petViewbtn"></div>
		</div>
	</div>
	
	<!-- 일정 추가 -->
	<div id="staticBackdrop4" class="modal fade" data-backdrop="static"
		tabindex="-1" role="dialog">
		<div class="modal-dialog modal-xl">
			<div class="modal-content scheAddForm"></div>
		</div>
	</div>
	
	<!-- 사용자 정보 수정 : 사용자 비밀번호 확인 -->
	<div id="modifyProfileModal" class="modal fade" data-backdrop="static" tabindex="-1" role="dialog" >
		<div class="modal-dialog modal-dialog-centered" >
			<div class="modal-content modifyProfile">
			</div>
		</div>
		<script>
			function modifyProfileModalView(){
				$(".modifyProfile").load("/cdd/user/userPwCh.cdd");
			}
		</script>
	</div>
	<div class="modal fade" id="followerView" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-dialog-centered" style="width: 300px;">
	    <div class="modal-content followerView">
	    </div>
	  </div>
	  <script>
		function followerView(userId){
			console.log(userId);
			$(".followerView").load("/cdd/myPage/myPageFollowerList.cdd", { 'userId' : userId});
		}
	  </script>
	</div>
	<div class="modal fade" id="followView" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-dialog-centered" style="width: 300px;">
	    <div class="modal-content followView">
	    </div>
	  </div>
	  <script>
		function followView(userId){
			console.log(userId);
			$(".followView").load("/cdd/myPage/myPageFollowList.cdd", { 'userId' : userId});
		}
	  </script>
	</div>
	<div id="sendDmForm" class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" >
		<div class="modal-dialog modal-dialog-centered" style="z-index: 1000;  width: 500px;">
			<div class="modal-content" style="height: 150px;" >
				<div class="modal-header">
			        <h5 class="modal-title">To.&nbsp;&nbsp;</h5><h5 class="modal-title" id="chatIdFromFollow"></h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
				</div>
				<div class="modal-body">
					<form action="/cdd/myPage/sendDm.cdd" method="post" name="dmForm" onsubmit="return sendDmCh()">
						<input type="hidden" value="" id="receiver" name="receiver"/>
						<input type="hidden" value="${sessionScope.memId }" name="sender">
						<input type="text" class="form-control" id="sendContentFromForm" name="content"
							style='width:80%; height:30px; display:inline; margin-right: 10px;'/>
						<button type="submit" class='btn btn-outline-secondary' style='font-size: 10pt; height:30px;'>보내기</button>
					</form>
				</div>
			</div>
		</div>
	<script>
		function sendValue(toId){
			$("#chatIdFromFollow").text(toId);
			$("#receiver").val(toId);
		}
		function sendDmCh(){
			var dmContent = document.dmForm.content.value;
			if(dmContent == ""){
				alert("메세지를 입력해주세요");
				return false;
			}
		}
	</script>
	</div>
</body>
</html>





