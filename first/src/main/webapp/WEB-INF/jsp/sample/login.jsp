<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<body>
	<form action="" id="frm">
		<a href="#this" class="btn" id="log">로그인</a>
		<!--  <input id="log" type="submit" value="로그인" style="cursor:pointer"> -->
		<div id='h_modi'>아이디:</div>
		<input id="CNC_ID" type="text" name="CNC_ID" placeholder="ID"><br />
		<br />
		<div id='h_modi'>비밀번호:</div>
		<input id="CNC_PWD" type="password" name="CNC_PWD"
			placeholder="PASSWORD">
	</form>
</body>
</script>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">
	$("#log").on("click", function(e) { //로그인 버튼

		if ($("#CNC_ID").val() == null || $("#CNC_ID").val() == "") {
			alert("아이디 입력하세요");
			return false;

		}
		if ($("#CNC_PWD").val() == null || $("#CNC_PWD").val() == "") {
			alert("패스워드 입력하세요");
			return false;

		}
		$.ajax({
			url : "${pageContext.request.contextPath}/sample/idAgree.do",
			type : "get",
			data : {
				"CONFIRM_FLAG" : $("#CNC_ID").val()
			},
			success : function(responseData) {
				$("#ajax").remove();
				var data = JSON.parse(responseData);
				if (data.ag == "N") {
					alert("승인하지 않는 ID입니다");
					return false;
				} else if (data.ag == "Y") {
					e.preventDefault();
					fn_loginBoard();

				}
			}
		});

	});

	function fn_loginBoard() {
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/sample/login_result.do' />");
		comSubmit.submit();
	}
</script>
</html>