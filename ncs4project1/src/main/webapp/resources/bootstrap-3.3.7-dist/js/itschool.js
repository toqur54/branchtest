function phone2_lengthchk(code){
	if(code.value.length == 4){
		document.memberinput_form.phone3.focus();
	}
}
$(document).ready(function() {
	$('#login').on('click',function(){
		var getmsg=$("#login_form").parsley().validate();
		var email = $('#email').val();
		var password = $('#password').val();
		
		if(getmsg){

			$.ajax({
				type : 'POST',
				data : {email:email,password:password},
				datatype : 'json',
				url : 'login',
				success : function(data) {
					if(data > 0) 
						$("#login_form").submit();
					else {
						$('#emailError').text("Email or 비밀번호를 정확하게 입력하세요!");
					}
					return false;
				},
				error:function(e){  
		            alert(e.responseText);  
		        }  

			});
			
		}
	});
	
	$('#confirm').on('click',function(){
		$('#alertmsg').hide();
		if($('#email').val()==""){
			$('#msg').text("E-mail을 입력하세요!");
			$('#alertmsg').show();
		}else{
			$(this).css('color','red');
			var email = $('#email').val();
			$.ajax({
				type : 'POST',
				data : "email="+email,
				datatype : 'json',
				url : 'emailconfirm',
				success : function(data) {
					if(data == 0){
						$('#modalmsg').text("사용 가능한 E-mail 입니다.");
						$('#usebtn').text("사용");
						$('#password').focus();
					}else if(data > 0){
						$('#modalmsg').text("중복된 E-mail 입니다."); 
						$('#usebtn').attr('value',"확인");
						
					}else {
						$('#modalmsg').text("올바른 E-mail 입력하세요."); 
						$('#usebtn').text("확인");
					}
					$("#myModal").modal('show');
					return false;
				}
			});
		}
		
	});
	
	$('#usebtn').on('click',function(){
		if($('#usebtn').text()=="사용"){
			$('#password').focus();
		    $('#dochecked').text("yes");
		}else {
			$('#email').val("");
			$('#email').focus();
			$('#dochecked').text("no");
			return;
		}
	});
	
	$('.close').on('click',function(){
		$('#alertmsg').hide();
	});
	$('#membersave').on('click',function(){
		if($('#dochecked').text()=="no"){
			$('#modalmsg').text("E-mail 중복검사를 하세요."); 
			$('#usebtn').attr('value',"확인");
			$("#myModal").modal('show');
			return;
		}
		$('.memberinput_form').submit();
	});
	
	$('#email').on('click',function(){
		$('#dochecked').text("no");
	});
	
	$('#memberupdate').on('click',function(){
		$('.memberupdate_form').submit();
	});
	
	
	if($('#showgender').val() == '남자'){
		$('.male').attr('class','btn btn-primary active male');
		
	}else{
		$('.female').attr('class','btn btn-primary active female');
	}
	
	$('input[type=radio][name=gender]').change(function() {
		if(this.value == '여자'){
			$('.female').attr('class','btn btn-primary active female');
			$('.male').attr('class','btn btn-default male');
			$('#showgender').val('여자');
		}else{
			$('.male').attr('class','btn btn-primary active male');
			$('.female').attr('class','btn btn-default female');
			$('#showgender').val('남자');
		}
	});
	
	$('#image').on('click',function(){
		$('input[type=file]').click();
	    return false;
	});
	
	$('#photo').change(function(event){
		var tmppath = URL.createObjectURL(event.target.files[0]);
		$('#image').attr('src',tmppath);
	});
	
	$('.close').on('click',function(){
		$('#alertmsg').hide();
	});
	
	$('#delete').on('click',function(){
		$("#myModal").modal('show');
		return;
	});
	$('#ok').on('click',function(){
		var url = "memberDelete?email="+$('#email').val();
		$(location).attr('href',url);
	});
	$('#cancel').on('click',function(){
		return;
	});
	
	var table = $('#example').DataTable();
	var email = '';
	var rowtable ='';
	$('#example').on("click", "button", function(){
		email = this.value;
		rowtable =table.row($(this).parents('tr'));
		$("#myModal").modal('show');
		return;
	});
	$('#del').on('click',function(){
		$.ajax({
			type : 'POST',
			data : "email="+email,
			datatype : 'json',
			url : 'memberListDelete',
			success : function(data) {
				return false;
			}
		});
		rowtable.remove().draw(false);
	});
	$('#pass').on('click',function(){
		return;
	});
	
	
	if($('#showgender').val() == '남자'){
		$('.male').attr('class','btn btn-primary active male');
		
	}else{
		$('.female').attr('class','btn btn-primary active female');
	}
	
	$('input[type=radio][name=gender]').change(function() {
		if(this.value == '여자'){
			$('.female').attr('class','btn btn-primary active female');
			$('.male').attr('class','btn btn-default male');
			$('#showgender').val('여자');
		}else{
			$('.male').attr('class','btn btn-primary active male');
			$('.female').attr('class','btn btn-default female');
			$('#showgender').val('남자');
		}
	});
	
	
});