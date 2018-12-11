<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btnOk").click(function(){
			var name = $("#name").val().trim();
			if(name==""){
				alert("성명을 입력하세요");
				$("#name").val("");
				$("#name").focus();
				return;
			}
			var jubun = $("#jubun").val().trim();
			var regExp = /^[0-9]+$/;
			var jubunbool = regExp.test(jubun);
			if(!(jubunbool && jubun.length==13)){
				alert("주민번호를 올바르게 입력하세요");
				$("#jubun").val("");
				$("#jubun").focus();
				return;
			}
			var frm = document.frmMember;
			frm.method="GET";
			frm.action="6UseBeanForm1Result.jsp";
			frm.submit();
		});
	});  
</script>
<title>개인정보 입력화면(부트스트랩을 이용한 폼 생성)</title>
</head>
<body>
<form name="frmMember" class="form-horizontal col-md-6 col-md-offset-3" style="margin-top:2%; border:0px solid">
<fieldset>
<!-- Form Name -->
<legend>개인정보 입력</legend>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">성명</label>  
  <div class="col-md-4">
  <input id="name" name="name" type="text" placeholder="홍길동" class="form-control input-md" required>
  <span class="help-block">성명을 입력하세요</span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">주민번호</label>  
  <div class="col-md-4">
  <input id="jubun" name="jubun" type="text" placeholder="'-'없이 입력하세요" class="form-control input-md" required>
  <span class="help-block">주민번호를 입력하세요</span>  
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <div class="col-md-4 col-md-offset-5">
    <button type="button" id="btnOk" name="button1id" class="btn btn-primary">확인</button>
    <button type="reset" id="btnCancel" name="button2id" class="btn btn-danger">취소</button>
  </div>
</div>

</fieldset>
</form>

</body>
</html>