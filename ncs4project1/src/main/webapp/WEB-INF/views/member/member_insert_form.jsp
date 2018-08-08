<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Insert</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/parsley.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	
<!--우편번호 	 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180619/1529384927473/180619.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180619/1529384927473/180619.js"></script>
<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

</head>

<body>
	<form id="member_insert_form" name="member_insert_form" method="post" action="member_insert" data-parsley-validate="true"
	enctype="multipart/form-data">
	<input type="hidden" id="confirm_yn" value="n">
		<div class="container" style="margin-top: 100px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span
							style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px"><i
							class="fas fa-info-circle"> Member Register </i></span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>

			<div class="row">
				<div class="col-md-5"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
<!-- 						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> -->
					</div>
					<a href="#">
						<img id="image" name="image" src="resources/img/member.png" title="클릭 후 이미지 변경"
							alt="클릭 후 이미지 변경" class="rounded-circle" style="border: 1px solid;" width="140px" height="140px"> 
					</a>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6 text-center">
					<div>
						<input type="file" id="photo" name="imgfile" style="visibility: hidden;">
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<!-- 이메일인증 -->
			<div style="text-align: center; margin-bottom: 10px">
				<span class="input-group-addon button btn btn-warning" id="emailAuth">Email 인증</span>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 130px"><i class="fas fa-envelope" style="font-size: 15px; color: #000000"> E-Mail </i></span>
					</div>
					<input type="email" id="email" name="email" class="form-control"
						placeholder="E-Mail" aria-label="Useremail"
						style="ime-mode:disabled"
						required="true" data-parsley-error-message="E-Mail타입으로 입력하세요." 
						data-parsley-errors-container="div[id='EmailError']"
						aria-describedby="basic-addon1">

					<button type="button" id="member_confirm" class="btn btn-info" style="color: #000000">중복확인</button>
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
						required="true" data-parsley-error-message="비밀번호를 입력하세요!" 
						 data-parsley-errors-container="div[id='passwordError']"	/>
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

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 130px"><i class="fas fa-unlock-alt" style="font-size: 15px; color: #000000"> 비밀번호 확인 </i></span>
					</div>
					<input id="repassword" name="repassword" type="password" class="form-control" placeholder="RePassword" aria-label="Userpass" aria-describedby="basic-addon1"
					data-parsley-error-message="비밀번호가 다릅니다!"
					data-parsley-equalto="#password" >
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 130px"><i class="fas fa-address-card" style="font-size: 15px; color: #000000"> 이 름 </i></span>
					</div>
					<input id="name" name="name" type="text" class="form-control" placeholder="Name" aria-label="Username" aria-describedby="basic-addon1"
					required="true" data-parsley-error-message="이름을 입력하세요!" data-parsley-errors-container="div[id='NameError']">
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
						<span class="input-group-text" style="width: 130px"><i class="fas fa-phone-square" style="font-size: 15px; color: #000000"> 전화번호 </i></span>
					</div>
					<select name="phone1" id="phone1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="012">012</option>
						<option value="017">017</option>
					</select> 
						<input name="phone2" id="phone2" onkeyup="phone2_lengthchk(this)" maxlength="4" type="text" class="form-control" placeholder="1234"
						aria-label="Userphone1" aria-describedby="basic-addon1">
						 <input name="phone3" id="phone3"
						type="text" class="form-control" placeholder="5678" maxlength="4"	aria-label="Userphone1" aria-describedby="basic-addon1">
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 130px"><i class="fab fa-twitter" style="font-size: 15px; color: #000000"> 우편번호</i></span>
					</div>
					<input id="postno" name="postno" type="text" class="form-control" placeholder="Zipcode" aria-label="Usernzipcode" aria-describedby="basic-addon1">
					<button onclick="ZipcodeFind()" type="button" class="btn btn-info" 	style="color: #000000">검색</button>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 130px"><i class="fas fa-location-arrow" style="font-size: 15px; color: #000000"> 주소 </i></span>
					</div>
					<input id="addr1" name="addr1" type="text" class="form-control" placeholder="Address" aria-label="UsernAddress" aria-describedby="basic-addon1">
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 130px"><i class="fas fa-location-arrow" style="font-size: 15px; color: #000000"> 상세주소 </i></span>
					</div>
					<input id="addr2" name="addr2" type="text" class="form-control" placeholder="Address" aria-label="UsernAddress" aria-describedby="basic-addon1">
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row" style="margin-bottom: 100px; margin-top: 20px">
				<div class="col-md-5"></div>
				<div class="col-md-4">
					<button id="member_save_btn" name="member_save_btn" type="submit" class="btn btn-success save" style="margin-right: 10px; color: #000000">저 장</button>
					<button  id="cancel_btn" name="cancel_btn"  type="reset" class="btn btn-primary save" style="margin-left: 10px; color: #000000">취 소</button>
				</div>
				<div class="col-md-3"></div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="confirmModal" role="dialog">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body" id="confirm-modal-body">
						</div>
						<div class="modal-footer">
						<button type="button" id="confirm_modal_btn1" class="btn btn-success modal_btn1" data-dismiss="modal">사용</button>
							<button type="button" id="confirm_modal_btn2" class="btn btn-danger modal_btn2"	data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		</div>
	</form>
</body>
</html>