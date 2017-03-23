<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<h1>가입을환영합니다</h1>
</body>
<form action="" id="frm">
      		<a href="#this" class="btn" id="move">가입하기</a>
      		</form>
      		
<script>
function btnBack(){
	history.back();
}

</script>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
			
			$("#move").on("click", function(e){ //작성하기 버튼
				e.preventDefault();
				fn_moveBoard();
			});

		
		function fn_moveBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/sample/login.do' />");
			comSubmit.submit();
		}
</script>
</html>