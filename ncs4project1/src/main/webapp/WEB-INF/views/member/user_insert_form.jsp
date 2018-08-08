<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> User Register</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/parsley.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"	crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</head>

<script type="text/javascript">
	$(document).ready(function() {
		$('#confirm').on('click', function() {
			var code = $('#code').val();
			if (code == "") {
				$('#myModal').modal('show');
				$('.modal-body').text('Code를 입력하세요.');
				$('.modal_btn1').text("확인");
				$('.modal_btn2').hide();
				return;
			} else {
				$.ajax({
					type : 'POST',
					data : "code=" + code,
					url : 'userConfirm',
					success : function(data) {
						if (data == 0) {
							$('#myModal').modal('show');
							$('.modal-body').text('사용가능한 Code입니다.');
							$('.modal_btn1').on('click', function() {
								$('#confirm_yn').val("y");
							});
						} else {
							$('#myModal').modal('show');
							$('.modal-body').text('중복된 Code입니다.');
							$('.modal_btn1').text("확인");
							$('.modal_btn2').hide();
							$('#code').val("");
							$('#code').focus();

						}

					},
					error : function(xhr, status, error) {
						alert('ajax error');
					}
				});
			}
		});
		$('.save').on('click', function() {
			if ($('#confirm_yn').val() == "n") {
				$('#myModal').modal('show');
				$('.modal-body').text('Code 중복 체크를 하세요.');
				$('.modal_btn1').text("확인");
				$('.modal_btn2').hide();
				return;
			}
			$('#user_insert_form').parsley().validate();
			// 			$('#user_insert_form').submit();
		});
		//숫자만 받기
		$('#age').keyup(function() {
			this.value = this.value.replace(/[^0-9]/g, '');

		});
	});
</script>
<body>
	<form id="user_insert_form" name="user_insert_form" method="post" action="user_insert" data-parsley-validate="true"
		enctype="multipart/form-data">
		<input type="hidden" id="confirm_yn" value="n">
		<div class="container" style="margin-top: 20px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span
							style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px"><i class="fas fa-info-circle"> User Register </i></span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 130px"><i class="fas fa-unlock-alt" style="font-size: 15px; color: #000000">	Code </i></span>
					</div>
					<input id="code" name="code" type="text" class="form-control" placeholder="code" aria-label="Userpass" aria-describedby="basic-addon1" required="true"
						data-parsley-error-message="Code를 입력하세요!" data-parsley-errors-container="div[id='codeError']" />
					<button type="button" id="confirm" class="btn btn-primary" style="color: #000000">중복확인</button>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="codeError" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 130px"><i class="fas fa-unlock-alt" style="font-size: 15px; color: #000000"> 이름 </i></span>
					</div>
					<input id="name" name="name" type="text" class="form-control" placeholder="name" aria-label="Userpass" aria-describedby="basic-addon1" required="true"
						data-parsley-error-message="이름를 입력하세요!" data-parsley-errors-container="div[id='nameError']" />
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="nameError" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 130px"><i class="fas fa-unlock-alt" style="font-size: 15px; color: #000000"> 나이 </i></span>
					</div>
					<input id="age" name="age" type="text" class="form-control"	placeholder="age" aria-label="Userpass" aria-describedby="basic-addon1" required="true"
						data-parsley-error-message="나이를 입력하세요!" data-parsley-errors-container="div[id='ageError']" />
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="ageError" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 130px"><i class="fas fa-unlock-alt" style="font-size: 15px; color: #000000"> 성별 </i></span>
					</div>

					<input id="gender" name="gender" value="남자" type="radio" checked="checked" class="form-control" aria-describedby="basic-addon1" />남자
					<input id="gender" name="gender" value="여자" type="radio" class="form-control" aria-describedby="basic-addon1" />여자

				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row" style="margin-bottom: 100px; margin-top: 20px">
				<div class="col-md-5"></div>
				<div class="col-md-4">
					<button id="save_btn" name="save_btn" type="submit"	class="btn btn-success save" style="margin-right: 10px; color: #000000">저 장</button>
					<button id="cancel_btn" name="cancel_btn" type="reset" class="btn btn-primary save" style="margin-left: 10px; color: #000000">취 소</button>
				</div>
				<div class="col-md-3"></div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body"></div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success modal_btn1" data-dismiss="modal">사용</button>
							<button type="button" class="btn btn-danger modal_btn2" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>


</body>
</html>