<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script>
	$(function(){
       $('.input-group.date').datepicker({
           calendarWeeks: false,	/* 왼쪽에 일년에 몇주차인지 설정 여부 */
           todayHighlight: true,	/* true면 날짜를 강조 표시 */
           autoclose: true,			/* 날짜 선택시 날짜창 즉시 닫을지 여부 */
           format: "yyyy/mm/dd",	/* 출력 방식 */ 
           language: "kr"			/* 달력언어 설정 */
       	});
   	});
</script>
<body>
	<div class="modal-header" style="background: yellow;">
     		<h5 class="modal-title" id="exampleModalLabel" style="font-size: 30px"> Pet 일지 등록 </h5>
     		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
       			<span aria-hidden="true">&times;</span>
     		</button>
   		</div>
	<div class="modal-body">
    	<form action="noteWritePro.cdd?view=userProfile" method="post" id="insertNotesForm">
    		<!-- 펫 종류가 있는지 확인 하는 작업 -->
			    	
			<table>
			<thead>
				<tr>
					<th>날짜 선택</th>
				</tr>
			</thead>
			<tbody>	
				<tr>
					<td>
						<div class="input-group date"> <!-- 달력 출력 -->
        					<input type="text" class="form-control" name="note_date"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
   						</div> 
					</td>
				</tr>
			</tbody>
			</table>
			<table>
			<thead>
			    <tr>
			      <th>몸무게</th>
			      <th>건식</th>
			      <th>습식</th>
			      <th>음수</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <td>이미지</td>
			      <td>이미지</td>
			      <td>이미지</td>
			      <td>이미지</td>
			    </tr>
			    <tr>
			      <td><input type="text" name="note_weight"> kg</td>
			      <td><input type="text" name="note_dry"> g</td>
			      <td><input type="text" name="note_wet"> g</td>
			      <td><input type="text" name="note_water"> ml</td>
			    </tr>
			  </tbody>
			</table>
			<table>
			<thead>
				<tr>
					<th colspan="2">이상증상</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>구토<input type="checkbox" name="note_disorder1"></td>
					<td>설사<input type="checkbox" name="note_disorder2"></td>
				</tr>
				<tr>
					<td colspan="2">기타</td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="2" cols="30" name="note_disorder3"></textarea></td>
				</tr>
			</tbody>
			</table>
			<table>
			<thead>
				<tr>
					<th>산책</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>아침 <input type="text" name="note_stroll1" />분</td>
				</tr>
				<tr>
					<td>점심 <input type="text" name="note_stroll2" />분</td>
				</tr>
				<tr>
					<td>저녁 <input type="text" name="note_stroll3" />분</td>
				</tr>
			</tbody>
			</table>
			<table>
			<thead>
				<tr>
					<th>목욕</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div class="container">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-secondary">
									<input type="radio" autocomplete="off" style="background: white; color: black;" name="note_bath" value="0"> 목욕함
								</label>
								<label class="btn btn-secondary">
									<input type="radio" autocomplete="off" style="background: black; color: white;" name="note_bath" value="1"> 목욕안함
								</label>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
			</table>
			<table>
			<thead>
				<tr>
					<th>기분</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>신남</td>
					<td>화남</td>
					<td>우울</td>
					<td>슬픔</td>
					<td>아픔</td>
					<td>보통</td>
				</tr>
				<tr>
					<td><input type="radio" name="note_emotion" value="1"/></td>
					<td><input type="radio" name="note_emotion" value="2"/></td>
					<td><input type="radio" name="note_emotion" value="3"/></td>
					<td><input type="radio" name="note_emotion" value="4"/></td>
					<td><input type="radio" name="note_emotion" value="5"/></td>
					<td><input type="radio" name="note_emotion" value="6"/></td>
				</tr>
			</tbody>
			</table>
			<table>
			<thead>
				<tr>
					<th>기타</th>
				</tr>
			</thead>		
			<tbody>
				<tr>
					<td colspan="2"><textarea rows="2" cols="30" name="note_other"></textarea></td>
				</tr>
				<tr>
					<td>
						<select name="note_secret">
							<option value="1">전체공개</option>
							<option value="2">팔로우</option>
						</select>
					</td>
				</tr>
			</tbody>					
			</table>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal"> 취소 </button>
	   		<button type= "submit" class="btn btn-primary"> 등록 </button>
		</div>	
	</form>
</div>

</body>
</html>