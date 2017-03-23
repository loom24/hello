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
	<form id="frm" method="post" action="${paht}staff_index_form.do">
		<table width="700" border="1" cellspacing="0" cellpadding="3" align="center">
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
		
				<c:forEach  var="row" items="${list}">
			<tr>
				<td> ${row.ROWNUM} </td>
				<td> ${row.CNC_NAME}</td>
				<td> ${row.CNC_GEN} </td>
				<td> ${row.CNC_TYPE}</td>
				<td> ${row.CNC_DATE}</td>
				<td><input id="btnup" type="button" value="수정/삭제" onclick="location.href='${path}staff_updel_form.do?CNC_SEQ=${row.CNC_SEQ}'"></td>
			    <td> ${row.CNC_SEQ}</td>
			</tr></c:forEach>
<!-- 페이지 네비게이션 -->
            <tr>
              <td colspan="7">
<!--               시작페이지 -->
              <c:if test="${page.curPage>1 }">
              <a href="${path}staff_search_form.do?curPage=1">[처음]</a>
              </c:if>
              <!--               이전 -->
              <c:if test="${page.curBlock > 1}">
              <a href="${path}staff_search_form.do?curPage=${page.prevPage}">[이전]</a>
              </c:if>
              <c:forEach var="pageNum" begin="${page.blockStart}" end="${page.blockEnd}">
<!--               현재페이지는 하이퍼제거, 색상처리 -->
              <c:choose>
                <c:when test="${pageNum ==page.curPage}">
                  <span style="color: red">[${pageNum}]</span>
                </c:when>              
              <c:otherwise>
              <a href="${path}staff_search_form.do?curPage=${pageNum}">[${pageNum}]</a>&nbsp;
              </c:otherwise>
              </c:choose>
              </c:forEach>
<!--               다음 -->
              <c:if test="${page.curBlock < page.totBlock}">
              <a href="${path}staff_search_form.do?curPage=${page.nextPage}">[다음]</a>       
              </c:if>
<!--               마지막페이지 -->
              <c:if test="${page.curPage<page.totPage}">
              <a href="${path}staff_search_form.do?curPage=${page.totPage}">[맨끝]</a>       
              </c:if>
            </td>
            </tr>
		</tbody>
	</table>

<!-- 	<table style="display: none;"> -->
<!-- 		<tbody class="clontbody"> -->
<!-- 			<tr> -->
<!-- 				<th name="cnc_idx"></th> -->
<!-- 				<th name="cnc_name"></th> -->
<!-- 				<th name="cnc_gen"></th> -->
<!-- 				<th name="cnc_type"></th> -->
<!-- 				<th name="cnc_date"></th> -->
<!-- 				<th name="cnc_btn"> -->
<%-- 				<input id="btnup" type="button" value="수정/삭제" onclick="location.href='${path}staff/staff_updel_form.do?CNC_SEQ=${CNC_SEQ}'"></th> --%>
<!-- 				<th name="cnc_seq"></th> -->
<!-- 			</tr> -->
<!-- 		</tbody> -->
<!-- 	</table> -->
	
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
		
		location.href="staff_search_form.do";
		
	}
	function insert(){
		
		location.href="staff_insert_form.do";
	}
	
</script>
</html>