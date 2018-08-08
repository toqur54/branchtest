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
	<form id="salarytax_form" name="salarytax_form" method="post" action="salaryTax" data-parsley-validate="true">
		<div class="container" style="margin-top: 100px">
			
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Salary Tax </span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 처리년도</span>
					</div>
					<input id="yyyy" name="yyyy" type="text" class="form-control" placeholder="yyyy" aria-label="Username" aria-describedby="basic-addon1" value="${yyyy}"	>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-9 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 처리 월 </span>
					</div>
					<select id="mm" name="mm"  style="width: 470px">
						<c:forEach begin="1" end="12" var="x">
							<option value="${x}">${x}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="row" style="margin-bottom: 100px; margin-top: 20px">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="text-align: center;">
					<button id="salarytax_insert_btn" name="salarytax_insert_btn" type="submit" class="btn btn-success" style="margin-right: 10px; color: #000000">급여생성</button>
					<button id="salarytax_delete_btn" name="salarytax_delete_btn" type="button" class="btn btn-success" style="margin-right: 10px; color: #000000">생성삭제</button>
					<button  id="cancel_btn" name="cancel_btn"  type="reset" class="btn btn-primary" style="color: #000000">취 소</button>
				</div>
				<div class="col-md-2"></div>
			</div>
			
			<!-- Modal -->
			<div class="modal" id="salaryModal" roll="dialog">
			<div class="modal-dialog">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body" id="salary-modal-body">
						</div>
						<div class="modal-footer">
							<button type="button" id="salary_modal_btn1" class="btn btn-success modal_btn1" data-dismiss="modal">사용</button>
							<button type="button" id="salary_modal_btn2" class="btn btn-danger modal_btn2"	data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
				</div>
			</div>
			
		</div>
	</form>
			
</body>
</html>