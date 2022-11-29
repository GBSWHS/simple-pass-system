<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="DBPKG.*" import="java.sql.*" import="java.util.Date" import="java.text.SimpleDateFormat" %>
    
<%@ include file="layout/head.jsp" %>
<%@ include file="layout/navbar.jsp" %>

<%
	Connection con = DBPKG.Connect.getConnection();

	String sql = "SELECT * FROM passes WHERE idx = ? LIMIT 1";
	PreparedStatement psmt = con.prepareStatement(sql);
	
	psmt.setString(1, request.getParameter("idx"));
	
	ResultSet rs = psmt.executeQuery();
%>

<div class="container py-3 d-flex flex-column gap-3">
	<h3>외출증 상세</h3>
	<table class="table table-bordered">
		<tbody>
			<% while (rs.next()) { %>
				<tr>
					<th>#</th>
					<td><%= rs.getString(1) %></td>
				</tr>
				<tr>
					<th>학생</th>
					<td><%= rs.getString(2) %></td>
				</tr>
				<tr>
					<th>허가 기간</th>
					<td><%= rs.getString(3) %> ~ <%= rs.getString(4) %></td>
				</tr>
				<tr>
					<th>발급일</th>
					<td><%= rs.getString(5) %></td>
				</tr>
				<tr>
					<th>외출 사유</th>
					<td><%= rs.getString(6) %></td>
				</tr>
				<tr>
					<th>담당 교사</th>
					<td><%= rs.getString(7) %> 선생님</td>
				</tr>
			<% } %>
		</tbody>
	</table>
	
	<button onclick="window.history.back()" class="btn btn-secondary btn-lg">돌아가기</button>
</div>

<%@ include file="layout/footer.jsp" %>