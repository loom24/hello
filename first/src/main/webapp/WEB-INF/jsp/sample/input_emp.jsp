<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>first</title>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<style>
#bo1{
   border: none;

/*   border-color: white; */
}
#bo1 tr td{
   
   border-left: none;
   border-right: none;
   padding-top: 20px;
   padding-bottom: 20px;
   
}
#bo1 input{
   height: 25px;
}
#col input{
  border: none;
  outline: none;
  padding-left: 15px;
  padding-right: 15px;
  padding-bottom: 10px;
  padding-top: 5px;
  height: 30px;

}
#col2, #col3{
  border: none;
  outline:none;
  background-color: #5c5c5c;
  color: white;
  font-weight:bold;
  
}
#go{
  background-color: #da2226;
  color: white;
  font-weight:bold;
}
#war{
  border: none;
  color: red;

}
#up{
  border-top: none;

}
</style>
<script language = "javascript">
 
      // 아이디 중복 여부를 판단
      function openConfirmid(frm)
      {
            // 아이디를 입력했는지 검사
            if(frm.ip_mid.value == "")
            {
                  alert("아이디를 입력하세요");
                  return;
            }
   
            // url과 사용자 입력 아이디를 조합합니다.
            url = "confirmId.jsp?ip_mid=" + frm.ip_mid.value;
  
            // 새로운 윈도우를 엽니다.
            open(url, "confirm", 
                  "toolbar = no, location = no, status = no," + 
                  "menubar = no, scrollbars = no, resizable = no," +
                  "width = 300, height = 200");
      }
 
      function zipCheck()
      {
            url = "zipCheck.jsp?check=y";

            open(url, "post",
                  "toolbar = no, status = yes, menubar = no," + 
                  "scrollbars = yes, directories = no," +
                  "width = 500, height = 300");
      }

</script>
<script language="Javascript">

function checkemailaddy(){
        if (frm.EMAIL_SELECT.value == '1') {
            frm.CNC_DOMAIN.readonly = false;
            frm.CNC_DOMAIN.value = '';
            frm.CNC_DOMAIN.focus();
        }
        else {
            frm.CNC_DOMAIN.readonly = true;
            frm.CNC_DOMAIN.value = frm.EMAIL_SELECT.value;
        }
    }
</script>
<script>

function inputchk(){
	
	 var right = 0;
	 var chk1 = /\d/;
	 var chk2 = /[a-z]/i;
	 var ip_mid = document.frm.IP_MID.value;
	 var ip_pwd = document.frm.IP_PWD.value;
	 var ip_pwdchk = document.frm.CNC_PWDCHK.value;
	 var ip_email = document.frm.CNC_EMAIL.value;
	 
	 if(ip_mid.length<5 || ip_mid==null){
		  alert("아이디를 입력하십시오(5~12글자)");
		  return false;
     }
	 
	 if(ip_pwd.length<6 || ip_pwd==null){
	  alert("비밀번호를 입력하십시오(6글자이상)");
	  return false;
	 }
	 
	 if (chk1.test(ip_pwd) && chk2.test(ip_pwd)){
	 }else{
	  alert("비밀번호는 영어, 숫자 조합입니다.");
	  return false;
	 }
	 
	 if(ip_pwd != ip_pwdchk || ip_pwd==""){
	  alert("비밀번호가 동일한지 확인하시오");
	  return false;
	 }
	 
	 var num_regx = /^[0-9]*$/;
	 var ip_phone = document.frm.ip_phone.value;
	 if(ip_phone.length==0 || ip_phone==null){
	  alert("핸드폰번호를 입력하십시오");
	  return false;
	 }
	 
	 if (!num_regx.test(ip_phone)){
	  alert("핸드폰번호는 숫자만 입력가능합니다");
	  return false;
	 }
	 
	 var ip_irum = document.frm.ip_irum.value;
	 if(ip_irum.length==0 || ip_irum==null){
	  alert("이름을 입력하십시오");
	  return false;
	 }
	 
	 
	 
	 var ip_email = document.frm.ip_email.value;
	 var ip_domain = document.frm.ip_domain.value;
	 var regx = /^[a-zA-Z0-9._-]/;

	 
	 if(ip_email.length==0 || ip_email==null){
	  alert("이메일을 입력하십시오");
	  return false;
	 }
	 if (!regx.test(ip_email)){
	  alert("이메일은 영어, 숫자만 입력가능합니다.");
	  document.frm.ip_email.focus();
	  return false;
	 }
	 
	 var ip_code = document.frm.ip_code.value;
	 if(ip_code.length==0 || ip_code==null){
		  alert("우편번호를 입력하십시오");
		  return false;
		 }
	 
	 var ip_address = document.frm.ip_address.value;
	 if(ip_address.length==0 || ip_address==null){
	  alert("주소를 입력하십시오");
	  return false;
	 }
	 document.frm.submit();
	}
	
	function pwdchk(){
	 var cnc_pwd = document.frm.CNC_PWD.value;
	 var cnc_pwdchk = document.frm.CNC_PWDCHK.value;
	 if (cnc_pwdchk.length == 0 || cnc_pwdchk == null) {
	  document.frm.chk.value = "비밀번호를 입력하세요";
	  right = 0;
	 } else if (cnc_pwd != cnc_pwdchk) {
	  document.frm.chk.value = "비밀번호가 다름니다.";
	  right = 0;
	 } else {   
	  document.frm.chk.value = "비밀번호가 동일합니다.";
	  right = 1;
	 }
	 return;
	}


</script>
</head>
<body>


<form action="index.jsp?sub=login/input_result_person.jsp" name="frm" id="frm" method="post" onSubmit = "return inputchk()">
<table id="bo1" width = "800" border = "1" cellspacing = "0" cellpadding = "3" align = "center">
<tr>
      <td id="up" colspan = "2" height = "39">
      <font size = "+1"><h2><b>회원가입</b></h2></font></td>
</tr>

<tr>
      <td width = "200">사용자 ID</td>
      <td width = "600">
            <input type = "text" id="CNC_ID" name = "CNC_ID" size = "15" maxlength = "12" placeholder="5~12글자">
            <input id="col3" type = "button" name = "confirm_id" value = "ID중복확인" id="confirmid" style="cursor:pointer">
      </td>
</tr>
<tr>
      <td width = "200">비밀번호</td>
      <td width = "600">
            <input type = "password" name = "CNC_PWD" size = "15" maxlength = "12" placeholder="영문+숫자 6자이상">
      </td>
</tr>
<tr>
      <td width = "200">비밀번호 확인</td>
      <td width = "600">
            <input type = "password" name = "CNC_PWDCHK" size = "15" maxlength = "12" onblur = "pwdchk()">
            <input type="text" name="chk" value="동일한 비밀번호를 입력하세요" size = "30" readonly="readonly" id="war">
      </td>
</tr>

<tr>
      <td width = "200" >부서</td>
      <td width = "600">
            <select name="CNC_DEP">
             <option value="SI">SI</option>
             <option value="Solution">Solution</option>
             <option value="GroupWare">GroupWare</option>
             <option value="R&D">R&D</option>      
            </select>
      </td>
</tr>


<tr>
      <td width = "200">사용자 이름</td>
      <td width = "600">
            <input type = "text" name = "CNC_IRUM" size = "15" maxlength = "10">
      </td>
</tr>

<tr>
      <td width = "200">성별</td>
      <td width = "600">
            <label><input type="radio" value="남자" name="CNC_GEN">　남자</label>　
            <label><input type="radio" value="여자" name="CNC_GEN">　여자</label>
            
      </td>
</tr>

<tr>
      <td width = "200">생년월일</td>
      <td width = "600">
            <input type="date" name="CNC_DATE">
      </td>
</tr>

<tr>
      <td width = "200">연락처</td>
      <td width = "600">
            <input type = "text" name = "CNC_PHONE" size = "15" maxlength = "11">
      </td>
</tr>

      <td width = "200">E-Mail</td>
      <td width = "600">
            <input id="CNC_EMAIL" name="CNC_EMAIL" type = "text" size = "15" maxlength = "30">@<input id="CNC_DOMAIN" name="CNC_DOMAIN" type="text">
             <select id="EMAIL_SELECT" name="EMAIL_SELECT" onchange="checkemailaddy();" style="height: 32px;">도메인선택
              <option value="nate.com">nate.com</option>
              <option value="naver.com">naver.com</option>
              <option value="hanmail.com">hanmail.com</option>
              <option value="gmail.com">gmail.com</option>
              <option value="1">직접입력</option>
             </select>
      </td>
</tr>


<tr>
      <td id="col" colspan = "2" align = "center">
      		<a href="#this" class="btn" id="write">가입하기</a>
<!--             <input id="go" type = "submit" name = "confirm" value = "가입하기" style="cursor:pointer"> -->

            <input type = "reset" name = "reset" value = "다시입력" style="cursor:pointer">
            <input type = "button" value = "취소" onclick="btnBack()" style="cursor:pointer">
      </td>
</tr>
</table>
</form>
<script>
function btnBack(){
	history.back();
}

</script>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#write").on("click", function(e){ //작성하기 버튼
				e.preventDefault();
				fn_insertBoard();
			});
		});
		
		function fn_insertBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/sample/wait.do' />");
			comSubmit.submit();
		}
	</script>
	
		<script type="text/javascript">
		$(document).ready(function(){

			$("#conid").on("click", function(e){ // 아이디 중복 확인 버튼
				e.preventDefault();
				fn_confirm();
			});
		});
		
		function fn_confirm(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/sample/idconfirm.do' />");
			comSubmit.submit();
		}
	</script>
	
	<script type="text/javascript">
	
	$("#col3").bind("click",function(){
		
		
		if($("#CNC_ID").val()==null || $("#CNC_ID").val()==""){
			alert("값을입력하세요");
			return false;
			
		} 
		
	    $.ajax({
	        url : "${pageContext.request.contextPath}/sample/idconfirm.do",
	        type: "get",
	        data : { "CONFIRM_ID" : $("#CNC_ID").val() },
	        success : function(responseData){
	            $("#ajax").remove();
	            var data = JSON.parse(responseData);
	            if(data.id == "N"){
	                alert("존재하지 않는 ID입니다");
	                return false;
	            }else if(data.id == "Y"){
	            	alert("존재하는 ID입니다");
	            	
	            }
	        }
	    });
	});
	
	
	
	</script>
	</body>
</html>