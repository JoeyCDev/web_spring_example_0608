<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 추가</title>
<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <%-- AJAX를 사용하려면 더 많은 함수가 있는 js를 포함해야 한다. --%>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>

	<div class="container">
		<h1>회원 정보 추가</h1>
		
		<!--  <form method="post" action="/lesson06/add_user" id="userForm"> -->
			<label>이름</label> 
			<div class="d-flex">
				<input type="text" name="name" class="form-control" id="nameInput">
				<button type="button" class="btn btn-primary" id="nameCheckBtn">중복체크</button>
			</div>
			<div class="text-danger d-none" id="duplicateDiv"><small>중복된 이름입니다.</small></div>
			<div class="text-success d-none" id="nonDuplicateDiv"><small>사용가능한 이름입니다.</small></div>
			<label>생년월일</label> <input type="text" name="yyyymmdd" class="form-control" id="yyyymmddInput">
			<label>이메일</label> <input type="text" name="email" class="form-control" id="emailInput">
			<label>자기소개</label>
			<textarea rows="8" class="form-control" name="introduce" id="introduceInput"></textarea>
			<br>
			<button type="button" class="btn btn-success" id="addBtn">추가</button>
		<!--  </form> -->
	</div>
	
	<script>
		$(document).ready(function(){
					
			// 중복체크 여부 확인 변수
			var isChecked = false;
			// 중복이 되었는지 안되었는지 확인
			var isDuplicate = true;
		
			
			//$("#userForm").on("submit",function(e)){
			$("#addBtn").on("click",function(e){
				
				e.preventDefault();
				
				var name = $("#nameInput").val();
				var yyyymmdd = $("#yyyymmddInput").val();
				var email = $("#emailInput").val();
				var introduce = $("#introduceInput").val().trim();
			
			if(name==null || name=="") {
				alert("이름을 입력하세요");
				return;
			}
			
			if(yyyymmdd==null || yyyymmdd==""){
				alert("생년월일을 입력하세요");
				return;
			}
			
			if(email==null || email==""){
				alert("이메일을 입력하세요");
				return;
			}
			if(introduce==null || introduce==""){
				alert("자기소개를 입력하세요");
				return;
			}
			
			// 중복 체크 여부 유효성 검사
			if(isChecked==false){
				alert("중복체크를 진행해 주세요!");
				return;
			}
				
			// 이름이 중복된 경우
			if(isDuplicate == true){
				alert("중복된 이름은 등록 할 수 없습니다!");
				return;
			}
			
			
			$.ajax({
				type:"post",
				url:"/lesson06/add_user",
				data:{"name":name, "yyyymmdd":yyyymmdd, "email":email, "introduce":introduce},
				success:function(data){
					//result: success or fail
					
					if(data.result == "success"){
						alert("추가성공");
					} else {
						alert("추가 실패");
					}
					
				},
				error:function(e){
					alert("error");
				}
				
			});
			
			});
			
			$("#nameCheckBtn").on("click",function(){
				var name = $("#nameInput").val();
				
				if(name==null || name ==""){
					alert("이름을 입력하세요");
					return;
				}
				
				$.ajax({
					type:"get",
					url:"/lesson06/is_duplication",
					data:{"name":name},
					success:function(data){
						// data {"isDuplication":true}
						// {"isDuplication":false}
						isChecked=true;
						if(data.isDuplicate){
							isDuplicate=true;
							$("#duplicateDiv").removeClass("d-none");
							$("#nonDuplicateDiv").addClass("d-none");
						}else{
							isDuplicate=false;
							$("#nonDuplicateDiv").removeClass("d-none");
							$("#duplicateDiv").addClass("d-none");
						}
						
				
						},
					error:function(e){
						alert("error");
					}
					
					
				
					});
				
			});
			
			
		});
	</script>

</body>
</html>