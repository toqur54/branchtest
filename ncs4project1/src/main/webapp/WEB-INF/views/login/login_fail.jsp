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
<form id="login_form" name="login_form" method="post" action="login" data-parsley-validate="true">
		<div class="container" style="margin-top: 100px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span
							style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px; color: red;"><i
							class="fas fa-info-circle"> Login Fail </i></span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 130px"><i class="fas fa-envelope" style="font-size: 15px; color: #000000"> E-Mail </i></span>
					</div>
					<input type="text" id="email" name="email" class="form-control"
						placeholder="E-Mail" aria-label="Useremail"
						style="ime-mode:disabled" value="${member.email}"
						required="true" data-parsley-error-message="E-Mail타입으로 입력하세요." 
						data-parsley-errors-container="div[id='EmailError']"
						aria-describedby="basic-addon1">
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="EmailError" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 130px"><i class="fas fa-unlock-alt" style="font-size: 15px; color: #000000"> 비밀번호 </i></span>
					</div>
					<input id="password" name="password" type="password" class="form-control" placeholder="Password" aria-label="Userpass" aria-describedby="basic-addon1"
							value="${member.password}"
							required="true" data-parsley-error-message="비밀번호를 입력하세요!" 
						 data-parsley-errors-container="div[id='passwordError']"/>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="passwordError" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row" style="margin-top: 20px">
				<div class="col-md-3"></div>
				<div class="col-md-5">
					<button  id="save_btn" name="save_btn"  type="submit" class="btn btn-info save" style="color: #000000;width: 550px""> Login </button>
				</div>
				<div class="col-md-4"></div>
			</div>
			
			<div class="row" style="margin-top: 5px">
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<label style="margin-right: 10px" id="insertmember"><i class="fas fa-plus"> 회원가입</i></label>
					<label style="margin-right: 10px" id="passsearch"><i class="fas fa-search"> 비밀번호 찾기 </i></label>
				</div>
				<div class="col-md-4"></div>
			</div>
			
			<!--email Modal -->
			<div class="modal fade" id="emailModal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header bg-info text-white">
							<h5 class="col-10 modal-title text-center">비밀번호 찾기</h5>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body" id="emailmodal-body">
							<div class="row">
								<div class="col-md-2"></div>
								<div class="input-group mb-3 col-md-8 ">
									<div class="input-group-prepend">
										<span class="input-group-text" style="width: 90px"><i class="fas fa-envelope" style="font-size: 15px; color: #000000"> E-Mail </i></span>
									</div>
									<input id="findemail" name="findemail" type="text" class="form-control" placeholder="E-mail을 입력하세요." aria-label="Useremail" aria-describedby="basic-addon1">
								</div>
								<div class="col-md-2"></div>
							</div>
						</div>
						<div class="modal-footer">
						<button type="button" class="btn btn-success modal_emailfind" data-dismiss="modal">찾 기</button>
							<button type="button" class="btn btn-danger modal_btn2"	data-dismiss="modal">취 소</button>
						</div>
					</div>
				</div>
			</div>
			<!-- end email modal -->
			
			<!-- mymodal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body" id="modal-body">
						</div>
						<div class="modal-footer">
						<button type="button" class="btn btn-success modal_btn1" data-dismiss="modal">확 인</button>
						</div>
					</div>
				</div>
			</div>
			<!-- end mymodal -->
			
		</div>
</form>	
</body>
</html>