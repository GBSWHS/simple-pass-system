<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="DBPKG.*" import="java.sql.*" import="java.util.Date" import="java.text.SimpleDateFormat" %>
    
<%@ include file="layout/head.jsp" %>
<%@ include file="layout/navbar.jsp" %>

<%
	Connection con = DBPKG.Connect.getConnection();

	String sql = "INSERT INTO passes (student, start_time, end_time, pass_date, reason, teacher) VALUES (?, ?, ?, ?, ?, ?)";
	PreparedStatement psmt = con.prepareStatement(sql);
	
	Date date = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
	
	psmt.setString(1, request.getParameter("student_1") + "," + request.getParameter("student_2"));
	psmt.setString(2, request.getParameter("start_h") + ":" + request.getParameter("start_m"));
	psmt.setString(3, request.getParameter("end_h") + ":" + request.getParameter("end_m"));
	psmt.setString(4, formatter.format(date));
	psmt.setString(5, request.getParameter("reason"));
	psmt.setString(6, request.getParameter("teacher"));
	
	psmt.execute();
%>

<div class="container py-3 d-flex flex-column gap-3">
	<h3>추가되었습니다.</h3>
	<a href="index.jsp" class="btn btn-secondary btn-lg">돌아가기</a>
</div>

<%@ include file="layout/footer.jsp" %>