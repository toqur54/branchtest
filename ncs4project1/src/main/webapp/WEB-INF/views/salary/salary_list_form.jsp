<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/parsley.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

</head>
<body>
<form id="salary_list_form" name="salary_list_form" method="get" action="salary_list_form">
<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="input-group mb-3 col-md-4 ">
				<div class="input-group-prepend">
					<span
						style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						Salary list </span>
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
		
		<table id="examplesalaryroll" class="table table-striped table-bordered" style="width:100%;">
				<thead>
					<tr>
						<th scope="col" style="text-align: center;">처리년도</th>
						<th scope="col" style="text-align: center;">처리 월</th>
						<th scope="col" style="text-align: center;">사원번호</th>
						<th scope="col" style="text-align: center;">부서명</th>
						<th scope="col" style="text-align: center;">이름</th>
						<th scope="col" style="text-align: center;">pay12</th>
						<th scope="col" style="text-align: center;">근로소득공제</th>
						<th scope="col" style="text-align: center;">근로소득금액</th>
						<th scope="col" style="text-align: center;">인적공제</th>
						<th scope="col" style="text-align: center;">연금보험료공제</th>
						<th scope="col" style="text-align: center;">특별소득공제</th>
						<th scope="col" style="text-align: center;">과세표준</th>
						<th scope="col" style="text-align: center;">산출세액</th>
						<th scope="col" style="text-align: center;">근로소득세액공제</th>
						<th scope="col" style="text-align: center;">결정세액</th>
						<th scope="col" style="text-align: center;">간이세액</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="salaryrollList" items="${salaryrollList}" varStatus="status">
							<tr>
								<td style="text-align: center; vertical-align: middle;">${salaryrollList.yyyy}</td>
								<td style="text-align: center; vertical-align: middle;">${salaryrollList.mm}</td>
								<td style="text-align: center; vertical-align: middle;">${salaryrollList.empno}
<%-- 									<a href="salaryroll_update?empno=${salaryrollList.empno}">${salaryrollList.empno}</a> --%>
								</td>
								<td style="text-align: center; vertical-align: middle;">${salaryrollList.dept}</td>
								<td style="text-align: center; vertical-align: middle;">${salaryrollList.name}</td>
								<td style="text-align: center; vertical-align: middle;">${salaryrollList.pay12}</td>
								<td style="text-align: center; vertical-align: middle;">${salaryrollList.incomededuction}</td>
								<td style="text-align: center; vertical-align: middle;">${salaryrollList.incomeamount}</td>
								<td style="text-align: center; vertical-align: middle;">${salaryrollList.personaldeduction}</td>
								<td style="text-align: center; vertical-align: middle;">${salaryrollList.annuityinsurance}</td>
								<td style="text-align: center; vertical-align: middle;">${salaryrollList.specialdeduction}</td>
								<td style="text-align: center; vertical-align: middle;">${salaryrollList.standardamount}</td>
								<td style="text-align: center; vertical-align: middle;">${salaryrollList.calculatedtax}</td>
								<td style="text-align: center; vertical-align: middle;">${salaryrollList.incometaxdeduction}</td>
								<td style="text-align: center; vertical-align: middle;">${salaryrollList.decidedtax}</td>
								<td style="text-align: center; vertical-align: middle;">${salaryrollList.simpletax}</td>
							</tr>
					</c:forEach>
				</tbody>
				
			</table>
			

			
			
			<div class="row" style="margin-top: 10px">
			<div class="col-md-3"></div>
			<div class="input-group mb-3 col-md-6 ">
				<div class="input-group-prepend">
					<input type="text" id="yyyy" name="yyyy" placeholder="yyyy" style="margin-right: 10px" value="${yyyy}">
					<input type="text" id="mm" name="mm" placeholder="mm" style="margin-right: 10px" value="${mm}">
					<button id="salary_search_btn" name="search_btn" type="submit" class="btn btn-info save" style="margin-right: 10px; color: #000000">검 색</button>
					<button id="reset_btn" name="reset_btn" type="reset" class="btn btn-info"	style="margin-right: 10px; color: #000000">리 셋</button>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
			
	</div>
	</form>
</body>
</html>