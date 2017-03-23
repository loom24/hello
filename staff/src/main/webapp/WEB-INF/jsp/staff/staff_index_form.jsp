<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>하하하</title>
<!-- 주석을 추가합니다 -->
<style type="text/css">
abbr[title]{color:green}


</style>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>

	<form id="frm" method="post" action="${paht}staff_search_form.do">
		<table width="700" border="1" cellspacing="0" cellpadding="3" align="center">
			<tr>
				<td width="700" colspan="6">사원 정보 검색</td>
			</tr>

			<tr>
				<td width="100">이름</td>
				<td width="100">
				<input id="CNC_NAME" name="CNC_NAME" type="text">
				</td>
				
				<td width="50">성별</td>
				<td width="200">
<!-- 				무조건 실행(채크됏을때 실행되어야함) -->
				<label><input type="checkbox" name="GEN1" id="CNC_GEN1" value="남">남</label>
				<label><input type="checkbox" name="GEN2" id="CNC_GEN2" value="여">여</label></td>
				
				<td width="50">종교</td>
				<td width="200">
				    <select id="CNC_TYPE">
				    <option>천주교</option>
					<option>기독교</option>
					<option>불교</option>
					</select>
					</td>
			</tr>

			<tr>
				<td width="100">학력</td>
				<td width="300">
				<label><input type="checkbox" value="고졸">고졸</label>
				<label><input type="checkbox" value="전문대졸">전문대졸</label>
				<label><input type="checkbox" value="일반대졸">일반대졸</label></td>
				<td width="50">기술</td>
				<td width="250" colspan="3"><label>
				<input type="checkbox" value="Java">Java</label>
				<label><input type="checkbox" value="JSP">JSP</label>
				<label><input type="checkbox" value="ASP">ASP</label>
				<label><input type="checkbox" value="PHP">PHP</label>
				<label><input type="checkbox" value="Delphi">Delphi</label>
				</td>
			</tr>

			<tr>
				<td width="100">졸업일</td>
				<td width="650" colspan="5"><input type="date">~
				<input type="date"></td>
			</tr>
		</table>

		<input type="submit" value="검색"> 
		<input type="button" value="전부검색" onclick="search()"> 
		<input type="reset" value="초기화"> 
		<input type="button" value="등록화면" onclick="insert()">
		
	</form>

	<table class="board_list">
		<colgroup>
			<col width="10%" />
			<col width="15%" />
			<col width="15%" />
			<col width="20%" />
			<col width="20%" />
			<col width="10%" />
			<col width="10%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">이름</th>
				<th scope="col">성별</th>
				<th scope="col">종교</th>
				<th scope="col">졸업일</th>
				<th scope="col">수정/삭제</th>
				<th scope="col">고유번호</th>
			</tr>

		</thead>
		<tbody>

</body>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">
var search = function() {
	
	location.href="staff_search_form.do";
	
}

// var key = function() {
	
// 	location.href="staff_search_form.do";
	
// }
$(document).ready(function(){
	  $("#key").on("click", function(e){
		  
		  e.preventDefault();
		  fn_into();
	  });
});

function fn_into(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/staff_index_form.do'/>");
		comSubmit.submit();
}

</script>
</html>