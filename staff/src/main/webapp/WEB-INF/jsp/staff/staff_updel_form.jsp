<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<script type="text/javascript">

window.onload = function(){
//     var input = document.getElementsByTagName('input');
    var CNC_YAU = document.getElementById('CNC_YAU');
    var CNC_NAM = document.getElementById('CNC_NAM');
    
    var CNC_GO = document.getElementById('CNC_GO');
 	var CNC_GEN = document.getElementById('CNC_GEN');
 	var CNC_ILL = document.getElementById('CNC_ILL');
 	
	 var Java = document.getElementById('Java');
	 var JSP = document.getElementById('JSP');
	 var ASP = document.getElementById('ASP');
	 var PHP = document.getElementById('PHP');
	 var Delphi = document.getElementById('Delphi');
	 
	 
        if (CNC_YAU.value=='여') {
        	CNC_YAU.checked = true;	
        }else if (CNC_NAM.value=='남'){
        	CNC_NAM.checked = true;
        }if (CNC_GO.value=='고졸'){
        	CNC_GO.checked = true;
        }else if(CNC_GEN.value=='전문대졸'){
       	 CNC_GEN.checked = true;	
        }else if(CNC_ILL.value=='일반대졸'){
       	 CNC_ILL.checked = true;
       	 
         }if (Java.value=='Java') {
	    	 Java.checked = true;	
	     }if(JSP.value=='JSP'){a
	    	 JSP.checked = true;	
	     }if(ASP.value=='ASP'){
	    	 ASP.checked = true;
	     }if(PHP.value=='PHP'){
	    	 PHP.checked = true;
	     }if(Delphi.value=='Delphi'){
	    	 Delphi.checked = true;
    }
};

</script>
<body>
	<form id="frm" method="post">
		<table width="700" border="1" cellspacing="0" cellpadding="3" align="center">
			<input type="hidden" name="CNC_IDX" value="3">
<!-- 			키값인(시퀀스를)넘겨야 수정삭제가능 -->
			<input type="hidden" name="CNC_SEQ" value="${dto.CNC_SEQ}">
			<tr>
				<td width="700" colspan="6">사원 정보 수정/삭제</td>
			</tr>

			<tr>
				<td width="100">이름</td>
				<td width="100">
				<input name="CNC_NAME" type="text" value="${dto.CNC_NAME}"></td>
				
				<td width="50">성별</td>
				<td width="200">
				
				<label><input id="CNC_NAM" name="CNC_GEN" type="checkbox" value="${dto.CNC_GEN}">남</label>
				<label><input id="CNC_YAU" name="CNC_GEN" type="checkbox" value="${dto.CNC_GEN}">여</label></td>
				
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
					<label><input id="CNC_GO" name="CNC_GRADE" type="checkbox" value="${dto.CNC_GRADE}">고졸</label>
					<label><input id="CNC_GEN" name="CNC_GRADE" type="checkbox" value="${dto.CNC_GRADE}">전문대졸</label>
					<label><input id="CNC_ILL" name="CNC_GRADE" type="checkbox" value="${dto.CNC_GRADE}">일반대졸</label></td>
				
				<td width="50">기술</td>
				<td width="250" colspan="3">
					<label><input id="Java" name="CNC_SKILL" type="checkbox" value="${dto.CNC_SKILL}">Java</label>
					<label><input id="JSP" name="CNC_SKILL" type="checkbox" value="${dto.CNC_SKILL}">JSP</label>
					<label><input id="ASP" name="CNC_SKILL" type="checkbox" value="${dto.CNC_SKILL}">ASP</label>
					<label><input id="PHP" name="CNC_SKILL" type="checkbox" value="${dto.CNC_SKILL}">PHP</label>
					<label><input id="Delphi" name="CNC_SKILL" type="checkbox" value="${dto.CNC_SKILL}">Delphi</label></td>
			</tr>

			<tr>
				<td width="100">졸업일</td>
				<td width="650" colspan="2">
				<input name="CNC_DATE" type="date" value="${dto.CNC_DATE}"></td>
				
				<td width="100">주민번호</td>
				<td width="650" colspan="2">
				<input name="CNC_JOMIN1" type="text" size="6" value="${dto.CNC_JOMIN1}"> -
				<input name="CNC_JOMIN2" type="password" size="6" value="${dto.CNC_JOMIN2}"></td>
			</tr>
		</table>
		<input type="button" value="뒤로가기" onclick="back()">
		<input type="submit" value="수정" id="into">
		<input type="submit" value="삭제" id="del">

	</form>
</body>

<script type="text/javascript">
  $(document).ready(function(){
	  $("#into").on("click", function(e){
		  
		  e.preventDefault();
		  fn_into();
	  });
  });
  
  function fn_into(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/staff_update_form.do'/>");
		comSubmit.submit();
  }

</script>

<script type="text/javascript">

  $(document).ready(function(){
	  $("#del").on("click", function(e){
		  e.preventDefault();
		  fn_delon();
	  });
  });
  
  function fn_delon(){
		var comSubmit = new ComSubmit("frm");
		if(confirm("정말삭제하시겠습니까?")==true){
			
		comSubmit.setUrl("<c:url value='/staff_del_form.do'/>");
		comSubmit.submit();
		}else{
	     return;
		}
  }

</script>

<script type="text/javascript">
  function back() {
	  history.back();
	
}
</script>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
</html>