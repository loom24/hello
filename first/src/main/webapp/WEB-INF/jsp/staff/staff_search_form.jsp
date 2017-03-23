<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<form id="frm" method="post">
		<table width="700" border="1" cellspacing="0" cellpadding="3"
			align="center">
			<tr>
				<td width="700" colspan="6">사원 정보 검색</td>
			</tr>

			<tr>
				<td width="100">이름</td>
				<td width="100">
				<input id="CNC_NAME" type="text">
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

<!-- 		<input type="text" id="sch_value" name="sch_value">  -->
		<input type="button" value="검색" onclick="selectone()"> 
		<input type="button" value="전부검색" onclick="search()"> 
		<input type="button" value="초기화" onclick="addClone()"> 
		<input type="button" value="등록화면" onclick="insert()">
		
	</form>

	<table class="board_list">
		<colgroup>
			<col width="10%" />
			<col width="15" />
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

		</tbody>
	</table>

	<table style="display: none;">
		<tbody class="clontbody">
			<tr>
				<td name="cnc_idx"></td>
				<td name="cnc_name"></td>
				<td name="cnc_gen"></td>
				<td name="cnc_type"></td>
				<td name="cnc_date"></td>
				<td name="cnc_btn">
				<input id="btnup" type="button" value="수정/삭제" onclick="location.href='${path}staff/staff_updel_form.do?CNC_SEQ=${CNC_SEQ}'"></td>
				<td id="CNC_SEQ" name="cnc_seq" style=""></td>
			</tr>
		</tbody>
	</table>
	
</body>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">
	/*
	 *$(".class") 
	 $("#id")
	 $("[name=name]")
	 */
	// jQuery.post( url [, data ] [, success ] [, dataType ] )
	var search = function() {
		
		$(".board_list tbody tr").remove();
		
			$.post("staff/staff_search.do", function(data) {
				for (var i = 0; i < data.length; i++) {
					addClone(data[i]);
				}
			});
		};
		
		var selectone = function() {
			
			$(".board_list tbody tr").remove();
			
			var name = jQuery("#frm #CNC_NAME").val();
			var gen;
			$("input[name=GEN1]").click(function(){
				var pas = $(this).attr('checked');
				if(pas){
					gen = jQuery("#frm #CNC_GEN2").val();
					alert("name:"+name+"gen:"+gen);
					
				}
			});
		

// 			if (name == '') {
// 				alert('검색어를 입력하세요');
// 			} else {
				
			    var searchData = {};
			    searchData.CNC_NAME = name;
			    searchData.CNC_GEN = gen;
			    
			    //url , object , callback
				$.post("staff/staff_search.do", searchData ,function(data) {
					console.log(data)
					for (var i = 0; i < data.length; i++) {

						console.log(data[i]);
						addClone(data[i]);
					
					}
				});
			};
	
	var addClone = function(data) {
		var cloneTr = $(".clontbody tr").clone();
		cloneTr.find("[name=cnc_idx]").html(data.CNC_IDX);
		cloneTr.find("[name=cnc_name]").html(data.CNC_NAME);
		cloneTr.find("[name=cnc_gen]").html(data.CNC_GEN);
		cloneTr.find("[name=cnc_type]").html(data.CNC_TYPE);
		cloneTr.find("[name=cnc_date]").html(data.CNC_DATE);
		cloneTr.find("[name=cnc_seq]").html(data.CNC_SEQ);
		$(".board_list tbody").append(cloneTr);
		
	}
	
	
	function insert(){
		
		location.href="staff/staff_insert_form.do";
	}
	
</script>
</html>