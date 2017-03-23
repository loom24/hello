<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<form action="./" id="frm" method="get">
		<table width="700" border="1" cellspacing="0" cellpadding="3" align="center">
			<input type="hidden" name="CNC_IDX" value="4">
			<tr>
				<td width="700" colspan="6">사원 정보 등록</td>
			</tr>

			<tr>
				<td width="100">이름</td>
				<td width="100">
				<input name="CNC_NAME" type="text"></td>
				
				<td width="50">성별</td>
				<td width="200">
				
				<label><input name="CNC_GEN" type="checkbox" value="남">남</label>
				<label><input name="CNC_GEN" type="checkbox" value="여">여</label></td>
				
				<td width="50">종교</td>
				<td width="200">
				<select name="CNC_TYPE">
				  <option value="천주교">천주교</option>
				  <option value="기독교">기독교</option>
				  <option value="불교">불교</option>
				  </select>
				  </td>
			</tr>

			<tr>
				<td width="100">학력</td>
				<td width="300">
				<label><input name="CNC_GRADE" type="checkbox" value="고졸">고졸</label>
				<label><input name="CNC_GRADE" type="checkbox" value="전문대졸">전문대졸</label>
				<label><input name="CNC_GRADE" type="checkbox" value="일반대졸">일반대졸</label></td>
				
				<td width="50">기술</td>
				<td width="250" colspan="3">
						<label><input name="CNC_SKILL" type="checkbox" value="Java">Java</label>
						<label><input name="CNC_SKILL" type="checkbox" value="JSP">JSP</label>
						<label><input name="CNC_SKILL" type="checkbox" value="ASP">ASP</label>
						<label><input name="CNC_SKILL" type="checkbox" value="PHP">PHP</label>
						<label><input name="CNC_SKILL" type="checkbox" value="Delphi">Delphi</label></td>
			</tr>

			<tr>
				<td width="100">졸업일</td>
				<td width="650" colspan="2">
				<input name="CNC_DATE" type="date"></td>
		
			
				<td width="100">주민번호</td>
				<td width="650" colspan="2">
				<input name="CNC_JOMIN1" type="text" size="6"> -
				<input name="CNC_JOMIN2" type="password" size="6"></td>
			</tr>
		</table>
		<input type="button" value="뒤로가기" onclick="back()"> 
		<input type="submit" value="등록" id="into">

	</form>
</body>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">
  function back() {
	  history.back();
}
  $(document).ready(function(){
	  $("#into").on("click", function(e){
		  
		  e.preventDefault();
		  fn_into();
	  });
  });
  
  function fn_into(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/staff/staff_into.do'/>");
		comSubmit.submit();
  }

</script>
</html>