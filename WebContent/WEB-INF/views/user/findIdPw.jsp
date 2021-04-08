<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캣댕댕</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<link rel="stylesheet" href="/cdd/resource/css/bootstrap.css">
<script src="/cdd/resource/js/bootstrap.js"></script>
<script>
		$("#btn").click(function(){
			$.ajax({
				type : "post",
				url : "/cdd/user/findIdPro.cdd",
				data : {email : $("#user_email").val()},
				success : function(result){
					console.log(result);
					$("#reId").val(result);
				}
			});
		});
</script>
<body>
	<div class="card align-middle">
		<div class="card-title">
			<br/><br/>
			<img src="/cdd/resource/img/logoFont.png" width="200px" />
		</div>
		<div class="card-body" align="center">
			<div class="container">
				<div align="center">
				<ul class="nav nav-tabs" >
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#findId">아이디 찾기</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#findPw">비밀번호 찾기</a>
					</li>
				</ul>
				<br/>
				</div>
				<div class="tab-content" >
					<div class="tab-pane fade show active" id="findId">
						<form action="" method="post">
						  <div class="form-group">
						    <input type="email" class="form-control" name="email" id="user_email" placeholder="이메일" style="width: 200px;">
						    <br/>
							<input type="text" id="reId" placeholder="아이디" disabled="disabled" class="form-control" style="width: 200px;"/>
						  </div>
						  <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
						  <button type="button" id="btn" class="btn btn-primary" name="findIdBtn" >찾기</button>
						</form>
					</div>
					<div class="tab-pane fade" id="findPw">
						<form action="/cdd/user/findPwPro.cdd" method="post">
						  <div class="form-group">
						    <input type="text" value="${user_id }" class="form-control" name="id" style="width: 200px;">
						  </div>
						  <div class="form-group">
						    <input type="email" class="form-control" placeholder="이메일" name="email" style="width: 200px;">
						  </div>
						  <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
						  <button type="submit" class="btn btn-primary">비밀번호 변경</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>