<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<link rel="stylesheet" href="/cdd/resource/css/bootstrap.css">
<script src="/cdd/resource/js/bootstrap.js"></script>
<script>
	function check(){
		var inputs = document.pwEditForm;
		if(!inputs.user_pw.value){
			alert("패스워드를 입력하세요.");
			return false;
		}
		if(!inputs.pwCh.value){
			alert("패스워드 확인란을 입력하세요.");
			return false;
		}
		if(inputs.pwCh.value != inputs.user_paw.value){
			alert("패스워드가 일치하지 않습니다.");
			return false;
		}
	}
</script>
</head>
<body>
	<form action="/cdd/user/pwEditPro.cdd" method="post" name="pwEditForm" onsubmit="return check()">
		<input type="hidden" name="user_id" value="${user_id }">
	  <div class="form-group">
	    <input type="password" class="form-control" name="user_pw" placeholder="새 비밀번호" style="width: 200px;">
	  </div>
	  <div class="form-group">
	    <input type="password" class="form-control" name="pwCh" placeholder="재 입력" style="width: 200px;">
	  </div>
	  <button type="submit" class="btn btn-primary">비밀번호 변경</button>
	</form>
</body>
</html>