/*약관동의 모달창 , 약관동의버튼 유효성검사*/
$(function(){
	$('#move-ico').on('click', function(e){
	        e.preventDefault();
        $($(this).data('target')).fadeIn(function(){
            $(this).removeClass('hidden');
	    });
	});
    $('.modal .close').on('click', function(){
        $(this).parents('.modal').fadeOut(function(){
            $(this).parents('.modal').addClass('hidden');
	     });
    });
	$('#deleteBtn').on('click', function(e){
        e.preventDefault();
        $($(this).data('target')).fadeIn(function(){
        	$(this).removeClass('hidden');
        });
	 });
	$('.modal .close').on('click', function(){
		$(this).parents('.modal').fadeOut(function(){
			$(this).parents('.modal').addClass('hidden');
		});
	});
	    
	$("#modalAllAgreement").change(function(){
		//this.checked -> true, false
		$("input[type=checkbox]").prop("checked",this.checked);
		$(".checkBox").prop("checked",checked);
	});
	
	$("#allAgreement").change(function(){
		//this.checked -> true, false
		$("input[type=checkbox]").prop("checked",this.checked);
	});

	//ajax 약관동의 txt정보 가져오기 
	$("#ajaxButton").click(function(){
		//서버에서 abcde.txt.파일의 내용을 가져오기
		//		전송받을 파일명 
		$("#txtDiv").load("test.txt");
	});
	$("#ajaxButton2").click(function(){
		//서버에서 abcde.txt.파일의 내용을 가져오기
		//		전송받을 파일명 
		$("#txtDiv2").load("test2.txt");
	});
	$("#ajaxButton3").click(function(){
		//서버에서 abcde.txt.파일의 내용을 가져오기
		//		전송받을 파일명 
		$("#txtDiv3").load("test3.txt");
	});
	$("#ModalcompleteBtn").click(function(){
		if($("#informationAgreement").is(":checked") == false || $("#ServiceAgreement").is(":checked") == false){
				alert("동의버튼을 체크해주세요.");
					return false;
		}
	});
		
});
$(function(){
		$("#pw-success").hide();
		$("#pw-danger").hide();
		$("input").keyup(function(){
				var pwd1=$("#passwordText").val();
				var pwd2=$("#passwordTextCheck").val();
			if(pwd1 !="" || pwd2 !=""){
				//패스워드 텍스트창 확인창에서 값을 가져와서 패스워드 창이 공백일때 if문으로 들어와서 
				//다음 if문에서 패스워드창과 패스워드체크창을 비교하여 맞을경우 일치 틀릴경우 불일치 보여준다 
				if(pwd1 == pwd2){
					$("#pw-success").show();
					$("#pw-danger").hide();
					$("input[type=submit]").removeAttr("disabled");
				}else{
					$("#pw-success").hide();
					$("#pw-danger").show();
					$("input[type=submit]").attr("disabled","disabled");
				}	
			}
		});
		
//법인 비밀번호창
		$("#coporatePw").hide();
		$("#coporatePwChk").hide();
		$("input").keyup(function(){
			
			var pwd1=$("#pw").val();
			var pwd2=$("#pwChk").val();
			if(pwd1 !="" || pwd2 !=""){
				
				//패스워드 텍스트창 확인창에서 값을 가져와서 패스워드 창이 공백일때 if문으로 들어와서 
				//다음 if문에서 패스워드창과 패스워드체크창을 비교하여 맞을경우 일치 틀릴경우 불일치 보여준다 
				if(pwd1 == pwd2){
				$("#coporatePw").show();
				$("#coporatePwChk").hide();
				$("input[type=submit]").removeAttr("disabled");
				
				
				}else{
				$("#coporatePw").hide();
				$("#coporatePwChk").show();
				$("input[type=submit]").attr("disabled","disabled");
			}	
			}
		});
	//비밀번호 변경 텍스트 창 
		$("#modal-pw-success").hide();
		$("#modal-pw-danger").hide();
		$("input").keyup(function(){
			var pwd1=$("#modalPwChk").val();
			var pwd2=$("#modalPwChk2").val();
			if(pwd1 !="" || pwd2 !=""){
				//패스워드 텍스트창 확인창에서 값을 가져와서 패스워드 창이 공백일때 if문으로 들어와서 
				//다음 if문에서 패스워드창과 패스워드체크창을 비교하여 맞을경우 일치 틀릴경우 불일치 보여준다 
				if(pwd1 == pwd2){
				$("#modal-pw-success").show();
				$("#modal-pw-danger").hide();
				$("input[type=submit]").removeAttr("disabled");
				}else{
				$("#modal-pw-success").hide();
				$("#modal-pw-danger").show();
				$("input[type=submit]").attr("disabled","disabled");
			}	
			}
		});
		//모달창 비밀번호 유효성 검사
		$("#mcBtn").attr('disabled',true);
		
		$("#mcBtn").click(function(){
			reg =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
			var pwd=$("#modalPw").val();
			var pwd1=$("#modalPwChk").val();
			var pwd2=$("#modalPwChk2").val();
		
			if(!reg.test(document.getElementById("modalPwChk").value) || !reg.test(document.getElementById("modalPwChk2").value)){
				$("#mcBtn").attr('disabled',true);
				alert("비밀번호를 다시입력해주세요");
				
			}else if(pwd1 == pwd2){
				$("#mcBtn").attr('disabled',false);
			}
		});
});

$(function(){
	$("#coporate_CompleteBtn").click(function(){
		
		if($("#coporateText").val()==""){
			alert("사업자 등록번호를 입력해주세요.");
				return false;
		}
		if($("#coporateName").val()==""){
			alert("대표자명을 입력해주세요.");
				return false;
		}
		if($("#userNameText").val()==""){
			alert("법인등록번호를 입력해주세요.");
				return false;
		}
		if($("#registerNumber").val()==""){
			alert("법인명을 입력해주세요.");
			return false;
		}
		if($("#idStatus").val() == "N"){//아이디 중복체크 유효성 검사 
			alert("아이디 중복체크 확인해주세요.");
				return false;
		}
		if($("#emailCheckResult").val()!="yes"){//이메일 인증 유효성 검사 
			alert("이메일 인증 하셔야 합니다 ");
				return false;
		}
		if($("#user_tel").val()==""){//휴대폰 번호 유효성 검사 
			alert("법인 전화번호를 입력해주세요.");
				return false;
		}
		if($("#pw").val()!=$("#pwChk").val()){//비밀번호 유효성 검사 
			alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
				return false;
		}
		if($("#pw").val()=="" ||$("#pwChk").val()==""){
			alert("비밀번호를 입력해주세요.");
				return false;
		}
		
		
		
			
			});
		});
function CoporateRegExpChk() {//법인창 유효성 검사 
	//사업자 등록번호 
	reg = /^[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]$/;
	if(!reg.test(document.getElementById("coporateText").value)){
		alert("사업자 등록번호를 잘못 입력하셨습니다.");
		return false;
	}
	reg = /^[가-힣]{2,7}$/;
	if (!reg.test(document.getElementById("userNameText").value)) {
		alert("대표자명을 양식에 맞춰 다시 입력해주세요.");
		return false;
	}
	//법인등록번호
	reg = /^[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]$/;
	if(!reg.test(document.getElementById("registerNumber").value)){
		alert("법인등록번호를 잘못 입력하셨습니다.");
		return false;
	}
	//법인명
	reg = /^[가-힣a-zA-Z0-9]{2,}$/;
	if(!reg.test(document.getElementById("coporateName").value)){
		alert("법인명은 한글, 영어, 숫자를 제외한 다른 문자는 입력 할 수 없습니다.");
		return false;
	}	
	reg = /^[a-zA-Z]{1}\w{7,11}$/; //[a-zA-Z0-9_] = \w: 영어 대소문자, 숫자,_

	if (!reg.test(document.getElementById("idText").value)) {
		alert("아이디는 첫번째 문자는 영문자 ,영,숫자,_만 허용 , 8~12글자까지 허용합니다...");
		return false;
	}
	//이메일
	reg = /^\w{2,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
	if(!reg.test(document.getElementById("e-mailText").value)){
		alert("이메일을 잘못 입력하셨습니다.");
		return false;
	}
	//비밀번호
	reg =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
	if(!reg.test(document.getElementById("pw").value)){
		alert("비밀번호를 잘못 입력하셨습니다.");
		return false;
	}
}


$(function(){
	$("#updateBtn").click(function(){
		emailReg = /^\w{2,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
		
		nameReg = /^[가-힣]{2,7}$/;
		
		phoneNumberReg = /^(010){0,2}[0-9][0-9]{3,10}$/;
		
		if(!emailReg.test(document.getElementById("EmailText").value)){
			alert("이메일을 잘못 입력하셨습니다 ");
		}else if(!nameReg.test(document.getElementById("nameText").value)){
			alert("이름을 잘못 입력하셨습니다 ");
		}else if(!phoneNumberReg.test(document.getElementById("phoneNumberText").value)){
			alert("휴대폰번호를 잘못 입력하셨습니다 ");
		}
	});
	
	$("#coporateUpdateButton").click(function(){
		emailReg = /^\w{2,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
		if(!emailReg.test(document.getElementById("coporateEmailText").value)){
			alert("이메일을 잘못 입력하셨습니다 ");
		}
		
	});
});

$(function(){
	$("#completeBtn").click(function(){
		if($("#userNameText").val()==""){
			alert("이름을 입력해주세요.");
				return false;
		
		}
		if($("#idStatus").val() == "N"){//아이디 중복체크 유효성 검사 
			alert("아이디 중복체크 확인해주세요.");
				return false;
		}
		
		if($("#passwordText").val()!=$("#passwordTextCheck").val()){//비밀번호 유효성 검사 
			alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
				return false;
		}
		if($("#passwordText").val()=="" ||$("#passwoedTextCheck").val()==""){
			alert("비밀번호를 입력해주세요.");
				return false;
		}
		if($("#user_tel").val()==""){//휴대폰 번호 유효성 검사 
			alert("핸드폰 번호를 입력해주세요.");
				return false;
		}
		if($("#emailCheckResult").val()!="yes"){//이메일 인증 유효성 검사 
			alert("이메일 인증 하셔야 합니다 ");
				return false;
		}
		
			
	});
});

//=======유저 회원가입 유효성검사===========
function regExpChk() {
	//이름검사 : 한글이여야한다. 2~7글자 까지 
	reg = /^[가-힣]{2,7}$/;
	if (!reg.test(document.getElementById("userNameText").value)) {
		alert("이름을 입력해주세요.");
		return false;
	}
	//^ : 처음부터 , $ : 끝까지 
	//아이디 검사 : 첫번째 문자는 영문자 ,영,숫자,_만 허용 , 8~12글자까지 허용 
	reg = /^[a-zA-Z]{1}\w{7,11}$/; //[a-zA-Z0-9_] = \w: 영어 대소문자, 숫자,_

	if (!reg.test(document.getElementById("idText").value)) {
		alert("아이디는 첫번째 문자는 영문자 ,영,숫자,_만 허용 , 8~12글자까지 허용합니다...");
		return false;
	}
	//이메일 검사 : goguma@nate.com			dd.co.kr								
	reg = /^\w{2,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
	if(!reg.test(document.getElementById("e-mailText").value)){
		alert("이메일을 잘못입력하셨습니다");
		return false;
	}
	reg =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
	if(!reg.test(document.getElementById("passwordText").value)){
		alert("비밀번호를 잘못입력하셨습니다");
		return false;
	}
}

//이메일 인증 창 
$(function(){
	$("#joinMembershipEmailCheckBtn").click(function(){
		if($("#e-mailText").val() == "" || $("#e-mailText").val() == null ){
			alert("이메일을 입력해주세요");
		}else{
		$(".emailFrm").css("display","none");
		$(".emailchkFrm").css("display","block");
		
		}
	});
});
//===========================mypage=================================================================



