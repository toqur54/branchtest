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
<form id="salary_insert_form" name="salary_insert_form" method="post" action="salary_insert" data-parsley-validate="true">
	<input type="hidden" id="confirm_yn" value="n">
		<div class="container" style="margin-top: 100px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp Salary Register </span>
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
					<input type="text" id="empno" name="empno" class="form-control" placeholder="ex)181251" aria-label="Useremail"
						required="true" data-parsley-error-message="사원번호를 입력하세요."	data-parsley-errors-container="div[id='EmpnoError']"
						style="ime-mode:disabled" aria-describedby="basic-addon1" maxlength="6">

					<button type="button" id="salary_confirm" class="btn btn-info" style="color: #000000">중복확인</button>
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
					<select id="dept" name="dept" style="width: 410px">
						<c:forEach var="dept2" items="${dept2}">
							<option value="${dept2.code}">${dept2.name}</option>
						</c:forEach> 
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
					required="true" data-parsley-error-message="이름을 입력하세요." data-parsley-errors-container="div[id='NameError']">
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
					<!-- Date input, salary_insert_form.jsp -->
					<input class="form-control" id="date" name="birth_date" placeholder="MM/DD/YYY" type="date" />
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
					<input id="pay" name="pay" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"	>
					
						<span class="input-group-text" style="width: 130px"> 급여 </span>
						<input id="extra" name="extra" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"	>
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
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 배우자 </span>
					</div>
					<select id="parter" name="parter"  style="width: 130px">
						<option value="0">0</option>
						<option value="1">1</option>
					</select>
					<div class="input-group-prepend" style="margin-left: 50px">
						<span class="input-group-text" style="width: 100px"> 자녀20 </span>
					</div>
					<select id="dependent20" name="dependent20"  style="width: 130px">
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</select>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-9 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 부양자60 </span>
					</div>
					<select id="dependent60" name="dependent60"  style="width: 130px">
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</select>
					<div class="input-group-prepend" style="margin-left: 50px">
						<span class="input-group-text" style="width: 100px"> 장애인 </span>
					</div>
					<select id="desabled" name="desabled"  style="width: 130px"> 
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</select>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-9 " >
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 부녀가장 </span>
					</div>
					<select id="womanpower" name="womanpower"  style="width: 130px">
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</select>
					<div class="input-group-prepend" style="margin-left: 50px">
						<span class="input-group-text" style="width: 100px"> 급여계산 </span>
					</div>
					<select id="yn" name="yn"  style="width: 130px">
						<option value="y">yes</option>
						<option value="n">no</option>
					</select>
				</div>
			</div>
			
			<div class="row" style="margin-bottom: 100px; margin-top: 20px">
				<div class="col-md-5"></div>
				<div class="col-md-4">
					<button id="salary_save_btn" name="salary_save_btn" type="submit" class="btn btn-success save" style="margin-right: 10px; color: #000000">저 장</button>
					<button  id="cancel_btn" name="cancel_btn"  type="reset" class="btn btn-primary save" style="margin-left: 10px; color: #000000">취 소</button>
				</div>
				<div class="col-md-3"></div>
			</div>
			
		</div>
</form>
</body>
</html>