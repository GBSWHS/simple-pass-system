<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="DBPKG.*" import="java.sql.*" import="java.util.Date" import="java.text.SimpleDateFormat" %>
    
<%@ include file="layout/head.jsp" %>
<%@ include file="layout/navbar.jsp" %>

<%
	Connection con = DBPKG.Connect.getConnection();

	String sql = "DELETE FROM passes WHERE idx = ?";
	PreparedStatement psmt = con.prepareStatement(sql);

	psmt.setString(1, request.getParameter("idx"));
	psmt.execute();
%>

<div class="container py-3 d-flex flex-column gap-3">
	<h3>삭제되었습니다.</h3>
	<a href="index.jsp" class="btn btn-secondary btn-lg">돌아가기</a>
</div>

<%@ include file="layout/footer.jsp" %>