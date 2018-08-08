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
<script src="resources/js/myquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	
</head>
<body>
<form id="salary_update_form" name="salary_update_form" method="post" action="salary_update_form" data-parsley-validate="true">
	<input type="hidden" id="confirm_yn" value="n">
		<div class="container" style="margin-top: 100px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span
							style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp Salary Update </span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 130px"> 사원번호 </span>
					</div>
					<input type="text" id="empno" name="empno" class="form-control"
						placeholder="ex)181251" aria-label="Useremail" value="${salary.empno}" readonly="readonly"
						required="true" data-parsley-error-message="사원번호를 입력하세요." 
						data-parsley-errors-container="div[id='EmpnoError']"
						style="ime-mode:disabled" aria-describedby="basic-addon1">

				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="EmpnoError" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">	
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 130px"> 부서명 </span>
					</div>
					<select id="dept" name="dept"  style="width: 410px">
						<option value="${salary.dept}" <c:if test="${salary.dept == '1001'}">selected</c:if> >영업부<option>
						<option value="${salary.dept}" <c:if test="${salary.dept == '1002'}">selected</c:if> >관리부<option>
						<option value="${salary.dept}" <c:if test="${salary.dept == '1003'}">selected</c:if> >사업부<option>
						<option value="${salary.dept}" <c:if test="${salary.dept == '1004'}">selected</c:if> >기획부<option>
						<option value="${salary.dept}" <c:if test="${salary.dept == '1005'}">selected</c:if> >법무부<option>
						<option value="${salary.dept}" <c:if test="${salary.dept == '1006'}">selected</c:if> >회계부<option>
						<option value="${salary.dept}" <c:if test="${salary.dept == '1007'}">selected</c:if> >경리부<option>
					</select>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 130px"> 이 름</span>
					</div>
					<input id="name" name="name" type="text" class="form-control" placeholder="Name" aria-label="Username" aria-describedby="basic-addon1"	
					required="true" data-parsley-error-message="이름을 입력하세요."  value="${salary.name}"
						data-parsley-errors-container="div[id='NameError']">
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="NameError" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
			<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 130px"> 입사일자 </span>
					</div>
						<input class="form-control" id="date" name="birth_date" placeholder="MM/DD/YYY" type="date" value="${salary.birth_date}" />
<%-- 						<input id="birth_date" name="birth_date" type="text" class="form-control" value="${salary.birth_date}"  placeholder="Name" aria-label="Username" aria-describedby="basic-addon1"> --%>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12" style="text-align: center">
					<label style="background-color: gray; color: black;width: 550px">소득 내역</label>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 130px"> 기본급 </span>
					</div>
					<input id="pay" name="pay" type="text" value="${salary.pay}" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"	>
					
						<span class="input-group-text" style="width: 130px"> 급여 </span>
						<input id="extra" name="extra" type="text" value="${salary.extra}" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"	>
				</div>
			</div>
			
			
			<div class="row">
				<div class="col-md-12" style="text-align: center">
					<label style="background-color: gray; color: black;width: 550px">부양 가족 공제</label>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-9 ">
					<div class="input-group-prepend" >
						<span class="input-group-text" style="width: 100px"> 배우자 </span>
					</div>
					<select id="parter" name="parter" style="width: 130px">
						<option value="0" <c:if test="${salary.parter == '0'}">selected</c:if> >0<option>
						<option value="1" <c:if test="${salary.parter == '1'}">selected</c:if> >1<option>
					</select>
					<div class="input-group-prepend" style="margin-left: 50px">
						<span class="input-group-text" style="width: 100px"> 자녀20 </span>
					</div>
					<select id="dependent20" name="dependent20" style="width: 130px">
						<option value="0" <c:if test="${salary.dependent20 == '0'}">selected</c:if> >0<option>
						<option value="1" <c:if test="${salary.dependent20 == '1'}">selected</c:if> >1<option>
						<option value="2" <c:if test="${salary.dependent20 == '2'}">selected</c:if> >2<option>
						<option value="3" <c:if test="${salary.dependent20 == '3'}">selected</c:if> >3<option>
					</select>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-9 ">
					<div class="input-group-prepend" >
						<span class="input-group-text" style="width: 100px"> 부양자60 </span>
					</div>
					<select id="dependent60" name="dependent60" style="width: 130px">
						<option value="0" <c:if test="${salary.dependent20 == '0'}">selected</c:if> >0<option>
						<option value="1" <c:if test="${salary.dependent60 == '1'}">selected</c:if> >1<option>
						<option value="2" <c:if test="${salary.dependent60 == '2'}">selected</c:if> >2<option>
						<option value="3" <c:if test="${salary.dependent60 == '3'}">selected</c:if> >3<option>
					</select>
					<div class="input-group-prepend" style="margin-left: 50px">
						<span class="input-group-text" style="width: 100px"> 장애인 </span>
					</div>
					<select id="desabled" name="desabled" style="width: 130px">
						<option value="0" <c:if test="${salary.desabled == '0'}">selected</c:if> >0<option>
						<option value="1" <c:if test="${salary.desabled == '1'}">selected</c:if> >1<option>
						<option value="2" <c:if test="${salary.desabled == '2'}">selected</c:if> >2<option>
						<option value="3" <c:if test="${salary.desabled == '3'}">selected</c:if> >3<option>
					</select>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-9 " >
					<div class="input-group-prepend" >
						<span class="input-group-text" style="width: 100px"> 부녀가장 </span>
					</div>
					<select id="womanpower" name="womanpower" style="width: 130px">
						<option value="0" <c:if test="${salary.womanpower == '0'}">selected</c:if> >0<option>
						<option value="1" <c:if test="${salary.womanpower == '1'}">selected</c:if> >1<option>
						<option value="2" <c:if test="${salary.womanpower == '2'}">selected</c:if> >2<option>
						<option value="3" <c:if test="${salary.womanpower == '3'}">selected</c:if> >3<option>
					</select>
					<div class="input-group-prepend" style="margin-left: 50px">
						<span class="input-group-text" style="width: 100px"> 급여계산 </span>
					</div>
					<select id="yn" name="yn" style="width: 130px">
						<option value="y" <c:if test="${salary.yn == 'y'}">selected</c:if> >yes<option>
						<option value="n" <c:if test="${salary.yn == 'n'}">selected</c:if> >no<option>
					</select>
				</div>
			</div>
			
			<div class="row" style="margin-bottom: 100px; margin-top: 20px">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="text-align: center;">
					<button id="salary_update_btn" name="salary_update_btn" type="submit" class="btn btn-success save" style="margin-right: 10px; color: #000000">수 정</button>
					<button id="salary_delete_btn" name="salary_delete_btn" type="button" class="btn btn-success delete" style="margin-right: 10px; color: #000000">삭 제</button>
					<button  id="cancel_btn" name="cancel_btn"  type="reset" class="btn btn-primary save" style="color: #000000">취 소</button>
				</div>
				<div class="col-md-2"></div>
			</div>
			
		</div>
</form>
</body>
</html>