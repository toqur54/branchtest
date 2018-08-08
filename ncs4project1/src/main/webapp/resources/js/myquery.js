//우편번호
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
//			document.getElementById('addr2').value = data.jibunAddress;

			//vender
//			document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
//			document.getElementById('newaddr').value = fullRoadAddr;
//			document.getElementById('oldaddr').value = data.jibunAddress;

			//이 부분 삭제하면 클릭시 닫힘
			// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
//			if(data.autoRoadAddress) {
//			//예상되는 도로명 주소에 조합형 주소를 추가한다.
//			var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
//			document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

//			} else if(data.autoJibunAddress) {
//			var expJibunAddr = data.autoJibunAddress;
//			document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

//			} else {
//			document.getElementById('guide').innerHTML = '';
//			}
		}
	}).open();

}

//vender
function ZipcodevenderFind() {
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

			// 우편번호와 주소 정보를 해당 필드에 넣는다.	//vender
			document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('newaddr').value = fullRoadAddr;
			document.getElementById('oldaddr').value = data.jibunAddress;

			//이 부분 삭제하면 클릭시 닫힘
			// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
//			if(data.autoRoadAddress) {
//			//예상되는 도로명 주소에 조합형 주소를 추가한다.
//			var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
//			document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

//			} else if(data.autoJibunAddress) {
//			var expJibunAddr = data.autoJibunAddress;
//			document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

//			} else {
//			document.getElementById('guide').innerHTML = '';
//			}
		}
	}).open();

}

	//phone2 4자리 차면 phone3로 포커스
	function phone2_lengthchk(code){
		if(code.value.length == 4){
			document.member_insert_form.phone3.focus();
		}
	}
	
	function officeno2_lengthchk(code){
		if(code.value.length == 4){
			document.vender_insert_form.officeno3.focus();
		}
	}
	
	function busno1_lengthchk(code){
		if(code.value.length == 3){
			document.vender_insert_form.busno2.focus();
		}
	}
	
	function busno2_lengthchk(code){
		if(code.value.length == 2){
			document.vender_insert_form.busno3.focus();
		}
	}
	
	//selectedSeq 0724 buyDetail
	function selectedSeq(seq){
		$.ajax({
			type : 'POST',
			data : "seq="+seq,
			url : 'buyDetail',
			success : function(data){
				$('#buy_save_btn').hide();
				$('#buy_reset_btn').hide();
				$('#buyupdate').show();
				$('#buydelete').show();
				
				
				$('#seq').attr('value',data.seq);
				$('#yyyy').attr('value',data.yyyy);
				$('#mm').attr('value',data.mm);
				$('#dd').attr('value',data.dd);
				$('#no').attr('value',data.no);
				$('#hang').attr('value',data.hang);
				$('#procode').attr('value',data.procode);
				$('#beforeprocode').attr('value',data.procode);
				
				
				$('#stock').attr('value',data.stock);
				$('#price').attr('value',data.price);
				$('#beforeprice').attr('value',data.price);
				$('#qty').attr('value',data.qty);
				
				$('#beforeqty').attr('value',data.qty);
				
				var amount = $('#price').val() * $('#qty').val();
				$('#amount').attr('value',amount);
				$('#memo').attr('value',data.memo);
				$('#selectvender').val(data.vendcode).prop('selected',true);
				$('#selectproduct').val(data.procode).prop('selected',true);
			},
			error : function(xhr, status, error){
				alert('ajax error'+error);
			}
		});
	}
	
	//pay
	function selectedPayway(seq){
		$.ajax({
			type : 'POST',
			data : "seq="+seq,
			url : 'payDetail',
			success : function(data){
				$('#pay_save_btn').hide();
				$('#pay_reset_btn').hide();
				$('#payupdate').show();
				$('#paydelete').show();
				
				$('#vendname').attr('value',data.vendname);
				$('#seq').attr('value',data.seq);
				$('#yyyy').attr('value',data.yyyy);
				$('#mm').attr('value',data.mm);
				$('#dd').attr('value',data.dd);
				$('#no').attr('value',data.no);
				$('#hang').attr('value',data.hang);
				$('#procode').attr('value',data.procode);
				$('#beforeprocode').attr('value',data.procode);
				
				$('#amount').attr('value',data.amount);
				$('#beforeamount').attr('value',data.amount);
				$('#payway').attr('value',data.payway);
				$('#beforepayway').attr('value',data.payway);
				
				
				$('#memo').attr('value',data.memo);
				$('#selectvender').val(data.vendcode).prop('selected',true);
				$('#payway').val(data.payway).prop('selected',true);
			},
			error : function(xhr, status, error){
				alert('ajax error'+error);
			}
		});
	}
	
	$(document).ready(function(){
		//중복확인
		$('#member_confirm').on('click',function(){
			var email = $('#email').val();
			if(email==""){
				alert('E-mail을 입력하세요');
//				$('#confirmModal').modal('show');
//				$('#confirm-modal-body').text('E-mail을 입력하세요.');
//				$('#confirm_modal_btn1').text("확인");
//				$('#confirm_modal_btn2').hide();
				return;
			}else{
//				email += "@" + $('#domain').val();
				$.ajax({
					type : 'POST',
					data : "email="+email,
					url : 'memberConfirm',
					success : function(data){
						if(data == 0){
 							alert('사용가능한 ID입니다.');
//							$('#confirmModal').modal('show');
//							$('#modal-confirm-modal-body').text('사용가능한 E-Mail입니다.');
//							$('#confirm_modal_btn1').on('click',function(){
								$('#confirm_yn').val("y");
//							});
						}else{
 							alert('중복된 ID입니다.\n다시 입력해주세요.');
//							$('#confirmModal').modal('show');
//							$('#modal-confirm-modal-body').text('중복된 ID입니다.\n다시 입력해주세요.');
//							$('#confirm_modal_btn1').text("확인");
//							$('#confirm_modal_btn2').hide();
//								$('#email').val("");
//								$('#email').focus();
						}
						
					},
					error : function(xhr, status, error){
						alert('ajax error');
					}
				});
			}
		});
		//저장
		$('#member_save_btn').on('click',function(){
			if($('#confirm_yn').val() == "n"){
				alert('E-Mail 중복 체크를 하세요.');
//				$('#myModal').modal('show');
//				$('.modal-body').text('E-Mail 중복 체크를 하세요.');
//				$('.modal_btn1').text("확인");
//				$('.modal_btn2').hide();
				return;
			}
			
			$('#member_insert_form').parsley().validate();
		});
		
		$('#image').on('click',function(){
			$('input[type=file]').click();
			return false
		});
		
		$('#photo').change(function(event){
			var tmppath = URL.createObjectURL(event.target.files[0]);
			$('#image').attr('src',tmppath);
		});
		
		//숫자만 받기
		$('#phone2').keyup(function () { 
		    this.value = this.value.replace(/[^0-9]/g,'');
		});
		
		$('#phone3').keyup(function () { 
		    this.value = this.value.replace(/[^0-9]/g,'');
		});
		
	//email 인증
	$('#emailAuth').on('click', function() {
			var email = $('#email').val();
			$.ajax({
				type : 'POST',
				data : "email=" + email,
				datatype : 'json',
				url : 'emailAuth',
				success : function(data) {
					alert("ajax success:"+data);
					return false;
				}
			});

		});
	//저장버튼 로그인
		$('#insertmember').on('click',function(){
			$(location).attr('href',"member_insert_form");
		});
	
	//member result	홈
	$('#home').on('click',function(){
		$(location).attr('href',"index");
	});
	
	//member update 
	$('#image').on('click',function(){
		$('input[type=file]').click();
		return false
	});
	
	$('#photo').change(function(event){
		var tmppath = URL.createObjectURL(event.target.files[0]);
		$('#image').attr('src',tmppath);
	});
	
	//숫자만 받기
	$('#phone2').keyup(function () { 
	    this.value = this.value.replace(/[^0-9]/g,'');
	});
	
	$('#phone3').keyup(function () { 
	    this.value = this.value.replace(/[^0-9]/g,'');
	});
	
	$('#member_delete_btn').on('click',function(){
		alert('정말 삭제하시겠습니까?');
//		$('#myModal').modal('show');
//		$('.modal-body').text('정말 삭제 하시겠습니까?');
//		$('.modal_btn1').text("삭제");
//		$('.modal_btn2').text("취소");
//		$('.modal_btn1').on('click',function(){
			var url = "memberDelete?email="+$('#email').val();
			$(location).attr('href',url);
//		});
	});
	
	//index
	$('#image11').on('click',function(){
		$(location).attr('href',"member_insert_form");
	});
	$('#image12').on('click',function(){
		$(location).attr('href',"member_search");
	});
	$('#image21').on('click',function(){
		$(location).attr('href',"user_insert_form");
	});
	$('#image22').on('click',function(){
		$(location).attr('href',"user_search");
	});
	$('#image31').on('click',function(){
		$(location).attr('href',"board_insert_form");
	});
	$('#image32').on('click',function(){
		$(location).attr('href',"personInsertForm");
	});
	
	//login
	$('#insertmember').on('click',function(){
		$(location).attr('href',"member_insert_form");
	});
	
	//login fail
	$('#insertmember').on('click',function(){
		$(location).attr('href',"member_insert_form");
	});
	
	$('#passsearch').on('click',function(){
//		$('#emailModal').modal('show');
//		$('.modal_emailfind').on('click',function(){
		
			//ajax
			$.ajax({
				type : 'POST',
				data : "email="+$('#email').val(),
//				data : "email="+email,
				url : 'emailLossFind',
				success : function(data){
					if(data == 0){
						alert('E-mail이 존재하지 않습니다.');
						$('#email').val("");
	                    $('#email').focus();
	                    $('#password').val(""); 	
					}else {
	                     alert('임시 비밀번호를 해당 E-mail로 발송했습니다.');
	                  }
//						alert('E-mail이 존재하지 않습니다.');
////						$('#myModal').modal('show');
////						$('#modal-body').text('E-mail이 존재하지 않습니다.');
//					}else{
//						
//						alert('임시번호를 E-mail로 전송했습니다.');
////						$('#myModal').modal('show');
////						$('#modal-body').text('임시번호를 E-mail로 전송했습니다.');
//					}
					$('#email').val('');
					$('#password').val(''); 	
				},
				error : function(xhr, status, error){
					alert('ajax error');
				}
			});
			
//		});
	});

	
	//board insert
	$('.save').on('click',function(){
		$('#board_insert_form').submit();
	});
	$('#cancel_btn').on('click',function(){
		$(location).attr('href',"index");
	});
	
	//board page list
	$('#insert_btn').on('click',function(){
		$(location).attr('href',"board_insert_form");
	});
	$('#cancel_btn').on('click',function(){
		$(location).attr('href',"index");
	});
	
	//board reply form
	$('.save').on('click',function(){
		$('#board_insert_form').submit();
	});
	$('#cancel_btn').on('click',function(){
		$(location).attr('href',"index");
	});
	//board detail
	$('#list_btn').on('click',function(){
		$(location).attr('href',"boardPageList");
	});
	$('#board_delete_btn').on('click',function(){
		var b_seq = $('#boardb_seq').val();
		var b_ref = $('#b_ref').val();
		alert('게시글을 삭제 하시겠습니까?');
//		$('#myModal').modal('show');
//		$('.modal-body').text('게시글을 삭제 하시겠습니까?');
//		$('.modal_btn1').text("삭제");
//		$('.modal_btn2').text("취소");
//		$('.modal_btn1').on('click',function(){
//			$(location).attr('href',"boardDelete?b_ref=${board.b_ref}&b_seq=${board.b_seq}");
				location.href="boardDelete?b_seq="+b_seq+"&b_ref="+b_ref;
//		});
	});
	//////////////////////////////////////////////////////////////////////
	//중복확인 salary
	$('#salary_confirm').on('click',function(){
		var empno = $('#empno').val();
		if(empno==""){
			alert('사원번호를 입력하세요');
			return;
		}else{
			$.ajax({
				type : 'POST',
				data : "empno="+empno,
				url : 'salaryConfirm',
				success : function(data){
					if(data == 0){
							alert('사용가능한 사원번호입니다.');
							$('#confirm_yn').val("y");
//						});
					}else{
							alert('중복된 사원번호입니다.다시 입력해주세요.');
					}
					
				},
				error : function(xhr, status, error){
					alert('ajax error');
				}
			});
		}
		
	});
	
//	$('#salary_update_btn').on('click',function(){
//		
//		$('#salary_update_form').parsley().validate();
//	});
	
	$('#salary_save_btn').on('click',function(){
		if($('#confirm_yn').val() == "n"){
			alert('사원번호 중복 체크를 하세요.');
			 
			return;
		}
		
		$('#salary_insert_form').parsley().validate();
		$('salary_insert_form').submit();
	});
	
	$('#salary_delete_btn').on('click',function(){
		alert('정말 삭제하시겠습니까?');
		
			var empno = $('#empno').val();
			location.href="salaryDelete?empno="+empno;
	});
	
//		//datapicker
//	    var date_input=$('input[name="birth_date"]'); //our date input has the name "date"
//	    var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
//	    date_input.datepicker({
//	        format: 'mm/dd/yyyy',
//	        container: container,
//	        todayHighlight: true,
//	        autoclose: true,
//	    });
	
	    //datatable 정렬
	    
	    $('#examplesalary').DataTable({
	    	
	    });

	    
	    //급여 계산
	    $('#salarytax_insert_btn').on('click',function(){
			alert(' - 데이터가 지워지고 다시 생성됩니다. - \n - 계산 처리 하시겠습니까? - ');
			
//			$('#salaryModal').modal('show');
//			$('#salary-modal-body').text('데이터가 지워지고 다시 생성됩니다.\n계산 처리 하시겠습니까?');
//			$('#salary_modal_btn1').text("등록");
//			$('#salary_modal_btn2').text("취소");
			$('#salary_modal_btn1').on('click',function(){
				//모달 확인버튼 눌럿을때 form에 action 안줫을때 이동
				$('.salarytax_form').attr('action', 'salaryTax');
				$('.salarytax_form').submit();
			});
//			});
			
		});
	    
	    $('#examplesalaryroll').DataTable({
	    	
	    });
	    
	    //////////////////////////////////
	  //중복확인 product
		$('#product_confirm').on('click',function(){
			var code = $('#code').val();
			if(code==""){
				alert('바코드를 입력하세요');
				return;
			}else{
				$.ajax({
					type : 'POST',
					data : "code="+code,
					url : 'productConfirm',
					success : function(data){
						if(data == 0){
								alert('사용가능한 바코드입니다.');
								$('#confirm_yn').val("y");
//							});
						}else{
								alert('중복된 바코드입니다.다시 입력해주세요.');
						}
						
					},
					error : function(xhr, status, error){
						alert('ajax error');
					}
				});
			}
			
		});
		
		$('#product_save_btn').on('click',function(){
			if($('#confirm_yn').val() == "n"){
				alert('바코드 중복 체크를 하세요.');
				 
				return;
			}
			
			$('#product_save_btn').parsley().validate();
		});
		
		//삭제
		$('#product_delete_btn').on('click',function(){
			alert('정말 삭제하시겠습니까?');
			
				var code = $('#code').val();
				location.href="productDelete?code="+code;
		});
	    
		//숫자만 받기
		$('#buyprice').keyup(function () { 
		    this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#saleprice').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#preyystock').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#premmstock').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#preddstock').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#buy01').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#buy02').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#buy03').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#buy04').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#buy05').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#buy06').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#buy07').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#buy08').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#buy09').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#buy10').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#buy11').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#buy12').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#sale01').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#sale02').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#sale03').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#sale04').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#sale05').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#sale06').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#sale07').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#sale08').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#sale09').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#sale10').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#sale11').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#sale12').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#stock').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		
		////////vender
		
		$('#officeno2').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#officeno3').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#busno1').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#busno2').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#busno3').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});

		 //중복확인 vender
		$('#vender_confirm').on('click',function(){
			var code = $('#code').val();
			if(code==""){
				alert('상호 코드를 입력하세요');
				return;
			}else{
				$.ajax({
					type : 'POST',
					data : "code="+code,
					url : 'venderConfirm',
					success : function(data){
						if(data == 0){
								alert('사용가능한 코드입니다.');
								$('#confirm_yn').val("y");
//							});
						}else{
								alert('중복된 코드입니다.다시 입력해주세요.');
						}
						
					},
					error : function(xhr, status, error){
						alert('ajax error');
					}
				});
			}
			
		});
		
		$('#vender_save_btn').on('click',function(){
			if($('#confirm_yn').val() == "n"){
				alert('상호 코드 중복 체크를 하세요.');
				 
				return;
			}
			
			$('#vender_save_btn').parsley().validate();
		});
		
		//삭제
		$('#vender_delete_btn').on('click',function(){
			alert('정말 삭제하시겠습니까?');
			
				var code = $('#code').val();
				location.href="venderDelete?code="+code;
		});
		
		///////////////////////// balance
		$('#examplepbalance').DataTable({
	    	
	    });
		
		$('#balance_delete_btn').on('click',function(){
			alert('정말 삭제하시겠습니까?');
			
				var vendcode = $('#vendcode').val();
				location.href="balanceDelete?vendcode="+vendcode;
		});
	    
		$('#prebalance01').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#deal01').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#pay01').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#balance01').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#prebalance02').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#deal02').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#pay02').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#balance02').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#prebalance03').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#deal03').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#pay03').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#balance03').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#prebalance04').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#deal04').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#pay04').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#balance04').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#prebalance05').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#deal05').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#pay05').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#balance05').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#prebalance06').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#deal06').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#pay06').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#balance06').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#prebalance07').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#deal07').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#pay07').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#balance07').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#prebalance08').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#deal08').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#pay08').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#balance08').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#prebalance09').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#deal09').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#pay09').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#balance09').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#prebalance10').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#deal10').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#pay10').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#balance10').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#prebalance11').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#deal11').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#pay11').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#balance11').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#prebalance12').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#deal12').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#pay12').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#balance12').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#preyybalance').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#dealtot').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#paytot').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		$('#balance').keyup(function () { 
			this.value = this.value.replace(/[^0-9]/g,'');
		});
		
		///////////////buy
		//vender
		$('#selectvender').on('change',function () { 
			var vendname = $(this).children('option:selected').text();
			var vendcode = $(this).val();
			$.ajax({
				type : 'POST',
				data : "vendcode="+vendcode,
				url : 'buyNew',
				success : function(data){
					$('#vendname').attr('value',vendname);
					$('#yyyy').attr('value',data.yyyy);
					$('#mm').attr('value',data.mm);
					$('#dd').attr('value',data.dd);
					$('#no').attr('value',data.no);
					$('#hang').attr('value',data.hang);
				},
				error : function(xhr, status, error){
					alert('ajax error'+error);
				}
			});
		});
		
		//product
		$('#selectproduct').on('change',function () { 
			var proname = $(this).children('option:selected').text();
			var procode = $(this).val();
			$.ajax({
				type : 'POST',
				data : "procode="+procode,
				url : 'productSelected',
				success : function(data){
					$('#procode').attr('value',data.code);
					$('#stock').attr('value',data.stock);
					$('#price').attr('value',data.buyprice);
					$('#qty').focus();
				},
				error : function(xhr, status, error){
					alert('ajax error'+error);
				}
			});
		});
		
		//
		$('#qty').on('blur',function(){
			var amount = $('#price').val() * $('#qty').val();
			$('#amount').attr('value',amount);
		});
		
		//buy_save_btn
		$('#buy_save_btn').on('click',function(){
			var selectedvend = $('#selectvender').val();
			var selectedproduct = $('#selectproduct').val();
			var qty = $('#qty').val();
			
			if(selectedvend == '0000'){
//				$('modalmsgvender').text('- 매입처를 선택하세요! -');
				alert('- 매입처를 선택하세요! -');
			}else{
				$('modalmsgvender').text('');
			}
			
			if(selectedproduct == '0000000000000'){
//				$('modalmsgproduct').text('- 상품를 선택하세요! -');
				alert('- 상품를 선택하세요! -');
			}else{
				$('modalmsgproduct').text('');
			}
			
			if(qty == 0){
//				$('modalmsg').text('- 수량을 입력하세요! -');
				alert('- 수량을 입력하세요! -');
			}else{
				$('modalmsgproduct').text('');
			}
			
			if(selectedvend == '0000' || selectedproduct == '0000000000000' || qty == 0){
//				$('#buyModal').modal('show');				
			}else{
				$('.buyinsert_form').submit();
			}
			
		});
		
		//buy insert form 검색
		$('#buysearch_btn').on('click',function(){
//			var searchvender = $('#searchvender').val();
			var vendcode = $('#searchvender').children('option:selected').val();
			var yyyy = $('searchyyyy').val();
			var mm = $('searchmm').val();
			var dd = $('searchdd').val();
			
			if(vendcode == '0000'){
//				$('modalmsgvender').text('- 매입처를 선택하세요! -');
//				$('#buyModal'),modal('show');
				alert('- 거래처를 선택하세요! -');
				return;
			}else{
				$('#buysearch_form').submit();
			}
			
		});
		
		//buyupdate
		$('#buyupdate').on('click',function(){
			$('.buyinsert_form').attr('action','buyUpdate');
			$('.buyinsert_form').submit();
		});
		
		//buydelete
		$('#buydelete').on('click',function(){
//			$('#buyModal').modal('show');
//			$('#buy_modal_btn2').modal('show');
//			$('#buy_modal_btn1').on('click',function(){
//			$('.buyinsert_form').attr('action','buyDelete');
//			$('.buyinsert_form').submit();			
//			});
			
			alert('- 삭제하시겠습니까? - ');
//			alert('delete');
			$('.buyinsert_form').attr('action','buyDelete');
			$('.buyinsert_form').submit();		
		});
		
		//pay
		$('#selectvender').on('change',function () { 
			var vendname = $(this).children('option:selected').text();
			var vendcode = $(this).val();
			$.ajax({
				type : 'POST',
				data : "vendcode="+vendcode,
				url : 'payNew',
				success : function(data){
					$('#vendname').attr('value',vendname);
					$('#yyyy').attr('value',data.yyyy);
					$('#mm').attr('value',data.mm);
					$('#dd').attr('value',data.dd);
					$('#no').attr('value',data.no);
					$('#hang').attr('value',data.hang);
				},
				error : function(xhr, status, error){
					alert('ajax error'+error);
				}
			});
		});
		
		//paysave
		$('#pay_save_btn').on('click',function(){
			var selectedvend = $('#selectvender').val();
			var selectedpayway = $('#payway').val();
			var amount =$('#amount').val();
			
			if(amount ==""){
				alert('- 금액을 입력하세요 -');
			}else{
				$('modalmsgvender').text('');
			}
			
			if(selectedvend == '0000'){
				alert('- 거래처를 선택하세요! -');
			}else{
				$('modalmsgvender').text('');
			}
			
			if(selectedpayway == '지불 방법을 선택하세요'){
//				$('modalmsgproduct').text('- 상품를 선택하세요! -');
				alert('- 지불방법를 선택하세요! -');
			}else{
				$('modalmsgproduct').text('');
			}
			
			
			if(selectedvend == '0000' || selectedpayway == ''){
//				$('#buyModal').modal('show');				
			}else{
				$('.payinsert_form').submit();
			}
			
		});
		
		//pay insert form 검색
		$('#paysearch_btn').on('click',function(){
//			var searchvender = $('#searchvender').val();
			var vendcode = $('#searchvender').children('option:selected').val();
			var yyyy = $('searchyyyy').val();
			var mm = $('searchmm').val();
			var dd = $('searchdd').val();
			
			if(vendcode == '0000'){
//				$('modalmsgvender').text('- 매입처를 선택하세요! -');
//				$('#buyModal'),modal('show');
				alert('- 거래처를 선택하세요! -');
				return;
			}else{
				$('#paysearch_form').submit();
			}
			
		});
		
		
		//payupdate
		$('#payupdate').on('click',function(){
			$('.payinsert_form').attr('action','payUpdate');
			$('.payinsert_form').submit();
		});
		
		//paydelete
		$('#paydelete').on('click',function(){
//			$('#buyModal').modal('show');
//			$('#buy_modal_btn2').modal('show');
//			$('#buy_modal_btn1').on('click',function(){
//			$('.buyinsert_form').attr('action','buyDelete');
//			$('.buyinsert_form').submit();			
//			});
			
			alert('- 삭제하시겠습니까? - ');
//			alert('delete');
			$('.payinsert_form').attr('action','payDelete');
			$('.payinsert_form').submit();		
		});

		
		//final 마감
		$('#finalsubmit').on('click',function(){
			alert('확인 후 데이터는 되돌릴수 없습니다.');
			alert('마감하시겠습니까?');
			$('#final_form').submit();
//			$('#finalModal').modal('show');
//			$('#final_btn').on('click',function(){
//				$('#final_form').submit();
//			});
		});
		
	});
	