<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="DBPKG.*" import="java.sql.*" import="java.util.Date" import="java.text.SimpleDateFormat" %>
    
<%@ include file="layout/head.jsp" %>
<%@ include file="layout/navbar.jsp" %>

<%
	Connection con = DBPKG.Connect.getConnection();

	Date date = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
	
	String sql = "SELECT idx, student, start_time, end_time FROM passes WHERE pass_date = ? ORDER BY start_time DESC";
	PreparedStatement psmt = con.prepareStatement(sql);
	
	psmt.setString(1, formatter.format(date));
	
	ResultSet rs = psmt.executeQuery();
%>

<div class="container py-3 d-flex flex-column gap-3">
	<h3>외출증 목록</h3>
	<input class="form-control" id="searcher" type="text" placeholder="검색...">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>학생</th>
				<th>시간</th>
			</tr>
		</thead>
		<tbody>
			<% while (rs.next()) { %>
				<tr>
					<td><a href="detail.jsp?idx=<%= rs.getString(1) %>"><%= rs.getString(2) %></a></td>
					<td><%= rs.getString(3) %> ~ <%= rs.getString(4) %></td>
				</tr>
			<% } %>
		</tbody>
	</table>
</div>

<script>
	const searcher = document.getElementById("searcher")
	
	searcher.onblur = function () {
		window.find(searcher.value)
		searcher.value = ''
	}
	
	searcher.onkeydown = function (e) {
		if (e.key !== 'Enter') return
		
		setTimeout(function () {
			window.find(searcher.value)
			searcher.value = ''
		}, 100)
	}
</script>

<%@ include file="layout/footer.jsp" %>