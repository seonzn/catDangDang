// 펫 정보 클릭시 펫 고유번호 담을 변수
var pet_numberData;
// 펫 그림 누르면 이름 출력 ( pet 이름과 고유번호 받기 )
function pet_Name(pet_name,pet_number){
	pet_numberData = pet_number;
	$("#petViewbtn").empty();
	$("#petViewbtn").append("<h4> [ "+ pet_name +" ] Pet정보 </h4>");
};

$(document).ready(function(){
	/* 일지 작성 폼 연결 */ 
	$("#noteWriteForm").click(function() {
		$(".noteWriteForm").load("/cdd/myPage/noteWriteForm.cdd?view=userProfile"); /* 어디서 불렀는지 view 파라미터로 넘겨주기 */
	}); noteWriteForm 

	$("#petInfobtn").click(function() {
		$(".petInfobtn").load("/cdd/myPage/petInfoForm.cdd");
	});//petInfoForm
	
	$("#petViewbtn").click(function() {
		$(".petViewbtn").load("/cdd/myPage/petInfoView.cdd",{pet_number:pet_numberData}); //로드에서 Contoroller로 데이터 넘기는 방법
	});//petInfoForm
	
	$("#scheAddForm").click(function() {
		$(".scheAddForm").load("/cdd/myPage/scheAddForm.cdd?view=userProfile"); //로드에서 Contoroller로 데이터 넘기는 방법
	});//petInfoForm 
	
	
});
