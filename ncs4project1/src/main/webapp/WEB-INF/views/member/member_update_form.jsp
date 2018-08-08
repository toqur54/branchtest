<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Update</title>
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

<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function ZipcodeFind() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postno').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullRoadAddr;
//                document.getElementById('addr2').value = data.jibunAddress;
 				
                //이 부분 삭제하면 클릭시 닫힘
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
//                 if(data.autoRoadAddress) {
//                     //예상되는 도로명 주소에 조합형 주소를 추가한다.
//                     var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
//                     document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
 
//                 } else if(data.autoJibunAddress) {
//                     var expJibunAddr = data.autoJibunAddress;
//                     document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
 
//                 } else {
//                     document.getElementById('guide').innerHTML = '';
//                 }
            }
        }).open();

    }
</script>

</head>



<body>
	<form id="member_update_form" name="member_update_form" method="post" action="member_update_form" data-parsley-validate="true"
	enctype="multipart/form-data">
		<div class="container" style="margin-top: 100px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span
							style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px"><i
							class="fas fa-info-circle"> Member Update </i></span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>

			<div class="row">
				<div class="col-md-5"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
					</div>
					<a href="#">
						<img id="image" name="image" src="${member.photo}" title="클릭 후 이미지 변경"
							alt="클릭 후 이미지 변경" class="rounded-circle" style="border: 1px solid;" width="140px" height="140px">
						<input type="hidden" name="beforephoto" value="${member.photo}"> 
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

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 130px"><i class="fas fa-envelope" style="font-size: 15px; color: #000000"> E-Mail </i></span>
					</div>
					<input type="email" id="email" name="email" class="form-control"
						placeholder="E-Mail" aria-label="Useremail"
						style="ime-mode:disabled" readonly="readonly"
						value="${member.email}"
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
						required="true" data-parsley-error-message="비밀번호를 입력하세요!" data-parsley-errors-container="div[id='passwordError']"	/>
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
					data-parsley-error-message="비밀번호가 다릅니다!"	data-parsley-equalto="#password" >
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 130px"><i class="fas fa-address-card" style="font-size: 15px; color: #000000"> 이 름 </i></span>
					</div>
					<input id="name" name="name" type="text" class="form-control" value="${member.name}" placeholder="Name" aria-label="Username" aria-describedby="basic-addon1"
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
						<option value="010" <c:if test="${member.phone1 == '010'}">selected</c:if> >010<option>
						<option value="011" <c:if test="${member.phone1 == '011'}">selected</c:if> >011<option>
						<option value="012" <c:if test="${member.phone1 == '012'}">selected</c:if> >012<option>
						<option value="017" <c:if test="${member.phone1 == '017'}">selected</c:if> >017<option>

					</select> 
						<input name="phone2" id="phone2" value="${member.phone2}" onkeyup="phone2_lengthchk(this)" maxlength="4" type="text" class="form-control" placeholder="1234"
						aria-label="Userphone1" aria-describedby="basic-addon1">
						 <input name="phone3" id="phone3" value="${member.phone3}"
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
					<input id="postno" name="postno" type="text" value="${member.postno}" class="form-control" placeholder="Zipcode" aria-label="Usernzipcode" aria-describedby="basic-addon1">
					<button onclick="ZipcodeFind()" type="button" class="btn btn-primary" 	style="color: #000000">검색</button>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 130px"><i class="fas fa-location-arrow" style="font-size: 15px; color: #000000"> 주소 </i></span>
					</div>
					<input id="addr1" name="addr1" type="text" value="${member.addr1}" class="form-control" placeholder="Address" aria-label="UsernAddress" aria-describedby="basic-addon1">
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 130px"><i class="fas fa-location-arrow" style="font-size: 15px; color: #000000"> 상세주소 </i></span>
					</div>
					<input id="addr2" name="addr2" type="text" class="form-control" value="${member.addr2}" placeholder="Address" aria-label="UsernAddress" aria-describedby="basic-addon1">
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row" style="margin-bottom: 100px; margin-top: 20px">
				<div class="col-md-5"></div>
				<div class="col-md-4">
					<button id="save_btn" name="save_btn" type="submit" class="btn btn-success save" style="margin-right: 10px; color: #000000">저 장</button>
					<button id="member_delete_btn" name="member_delete_btn" type="button" class="btn btn-success delete" style="margin-right: 10px; color: #000000">삭 제</button>
					<button  id="cancel_btn" name="cancel_btn"  type="reset" class="btn btn-primary cancel" style="margin-right: 10px; color: #000000">취 소</button>
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
						<div class="modal-body">
						</div>
						<div class="modal-footer">
						<button type="button" class="btn btn-success modal_btn1" data-dismiss="modal">사용</button>
							<button type="button" class="btn btn-danger modal_btn2"	data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		</div>
	</form>
</body>
</html>