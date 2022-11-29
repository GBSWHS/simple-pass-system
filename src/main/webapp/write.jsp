<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ include file="layout/head.jsp" %>
<%@ include file="layout/navbar.jsp" %>

<form class="container py-3 d-flex flex-column gap-3" action="write_action.jsp" method="POST">
	<h3>외출증 작성</h3>
	<div class="alert alert-info" role="alert">
		외출증은 중앙에서 모두 수집하므로 따로 출력하시거나 캡쳐하실 필요가 없습니다.
	</div>
	
	<label>대표학생</label>
	<input required type="text" name="student_1" class="form-control" placeholder="ex) 김ㅇㅇ">
	
	<label>외출사유</label>
	<input required list="reason_list" name="reason" placeholder="ex) 병원 진료" class="form-control">
	<datalist id="reason_list">
	  <option value="생필품 구매">
	  <option value="버스표 구매">
	  <option value="병원 진료">
	</datalist>
	
	<label>동행자 (선택)</label>
	<input type="text" name="student_2" class="form-control" placeholder="쉼표로 구분합니다. ex) 박ㅇㅇ, 윤ㅇㅇ">
	
	<label>허가 기간 (24시 형식)</label>
	<div>
		오늘
		<input required type="number" max="24" min="0" name="start_h" class="form-control d-inline-block w-25" placeholder="00">시
		<input required type="number" max="60" min="0" name="start_m" class="form-control d-inline-block w-25" placeholder="00">분 부터
		<input required type="number" max="24" min="0" name="end_h" class="form-control d-inline-block w-25" placeholder="00">시
		<input required type="number" max="60" min="0" name="end_m" class="form-control d-inline-block w-25" placeholder="00">분 까지
	</div>
	
	
	<label>담당교사</label>
	<input id="a" required type="text" name="teacher" class="form-control" placeholder="ex) 진ㅇㅇ">
	
	
	<button type="submit" class="btn btn-primary btn-lg">작성완료</button>
	<a href="index.jsp" class="btn btn-secondary btn-lg">돌아가기</a>
</form>

<script>
	const a = document.getElementById('a')
	
	a.onchange = function () {
		window.localStorage.setItem('name', a.value)
	}
	
	const b = window.localStorage.getItem('name')
	a.value = b || ''
</script>

<%@ include file="layout/footer.jsp" %>