<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join_user</title>
<script>
$(function(){ 
	
	$("#joinMembershipCheckBtn").click(function(){
		reg = /^[a-zA-Z]{1}\w{7,11}$/; //[a-zA-Z0-9_] = \w: 영어 대소문자, 숫자,_		
		if (!reg.test($("#idText").val())) {
			alert("아이디는 첫번째 문자는 영문자 ,영,숫자,_만 허용 , 8~12글자까지 허용합니다...");
			return false;
		}else{
		//아이디 중복 체크 
		window.open("<%=projectPath%>/nTnB/idCheck.do?user_id="+$('#idText').val(),"joinMembershipCheckBtn","width=400px, height=300px");
		}
	});
});

$(function(){ 

	function email(url,params,msg){
	$.ajax({
		url : url,
		data : params,
		success : function(result){
			var tag = result.split("<hr id='z'>");
			console.log(result);
			emailCode = tag[1].trim();
			console.log(emailCode);
			
			if(emailCode=='ok'){
				alert(msg);
			}else if(emailCode=="yes"){
				$("#emailCheckResult").val("yes");
				alert(msg);
			}else{
		
			}
		},
		error : function(){
			console.log("이메일 에러 ...");
		}
	});
	}

//이메일 인증코드 받기 joinMembershipEmailCheckBtn 
	$(document).on("click",'#joinMembershipEmailCheckBtn',function(){
		var url="<%=projectPath%>/joinMembership/emailCode.do";
		var params = "user_email="+$("#e-mailText").val(); 
		var msg = "이메일로 인증코드를 전송하였습니다.";
		email(url,params,msg);
	});
//이메일 인증하기 
	$(document).on("click",'#joinMembershipEmailCheckBtn2',function(){
		var url="<%=projectPath%>/joinMembership/emailCheckCode.do";
		var params = "user_email2="+$("#user_email2").val();
		var msg = "이메일 인증이 완료 되었습니다.";
		email(url,params,msg);
	});
});
</script>
</head>
<body>
<div class="shadow appearance-none border-gray-dark" id="joinMemberShipDiv"><!-- 회원가입창 -->
	 <form method="post" id="userFrm" action="<%=projectPath %>/joinMembership/join_MemberShipOk.do" onsubmit="return regExpChk()">
		<p class="text-center text-4xl font-bold">회원가입</p>
		<div id="joinMenberShipForm">
			<div id="agreementForm"><input type="checkbox" class="checkBox" id="allAgreement">
				<label for="allAgreement" id="allAgreementText">전체동의</label>
				<button type="button"><a href="#" data-target="#agreementModal" id="move-ico">〉</a></button><br/>
				<h5>체리트리 서비스 이용약관(필수),개인정보 수집 및 이용동의(필수),<br/>마케팅정보 수집동의(선택)</h5><br/>
				<div id="idForm"class="mb-S4">
					<div id="joinMemberShiptext">
			      		<input id="userNameText" name="user_name" class="shadow appearance-none border-gray-darker  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="text" placeholder="이름"><br/>
			  		</div>
				    <div id="joinMemberShiptext">
					      <input id="idText" name="user_id" class="shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="text" placeholder="아이디">
					      <input type="button" value="중복체크" id="joinMembershipCheckBtn" class="bg-danger hover:bg-danger-dark text-white font-bold py-2 px-4 rounded"><a href="#" data-target="#idCheck" id="move-ico"><br/>
					      <input type="hidden" id="idStatus" value="N"/><!-- 아이디 중복검사 여부 설정 -->
					      <label id="subText">아이디는 첫번째 문자는 영문자 ,영,숫자,_만 허용 , 8~12글자까지 허용합니다..</label>
						</a><br/>
				    </div>
			      	<div id="joinMemberShiptext">
			      		<input  id="passwordText" name="user_pw" class="shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="password" placeholder="비밀번호">
			      	</div>
			      	<div id="joinMemberShiptext">
			      		<input id="passwordTextCheck" class="shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="password" placeholder="비밀번호 확인"><br/>
			      		<label id="subText">영문, 숫자, 특수문자를 조합한 8자 이상</label><br/>
			      		<div class="text-success" id="pw-success">비밀번호가 일치합니다</div>
			      		<div class="text-danger" id="pw-danger">비밀번호가 일치하지 않습니다</div>
			      	</div>
			      	<div id="joinMemberShipText2">
			      		<input id="user_tel" name="user_tel" class="shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="text" placeholder="핸드폰번호" maxlength="11"><br/>
			      		<label id="subText">휴대폰 번호 입력 시 -은 생략입니다</label><br/>
			      	</div>
			      	
			      	<div id="joinMemberShipText2" class="emailFrm">
			      		<input name="user_email" id="e-mailText"class="shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="text" placeholder="이메일">
			      		<input type="button" id="joinMembershipEmailCheckBtn" value="인증요청" class="bg-danger hover:bg-danger-dark text-white font-bold py-2 px-4 rounded">	<br/>
			      		<label id="subText">위 이메일로 인증번호가 발송됩니다.</label><br/>	
			      	</div>
			      	
			      		<div class="emailchkFrm mt-4" style="width:500px;display:none">
			      		<input name="user_email2"id="user_email2"class="shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="text" placeholder="이메일인증">
			      		<input type="hidden" name="emailCheckResult" id="emailCheckResult" value="no"/>
			      		<input type="button" id="joinMembershipEmailCheckBtn2" value="인증하기" class="bg-danger hover:bg-danger-dark text-white font-bold py-2 px-4 rounded">	<br/>
			      		<label id="subText" class="text-danger">위 이메일로 인증번호가 발송되었습니다.</label><br/>	
			      		</div>
			      	<div>
			      		<input type="submit"id="completeBtn" class="bg-danger hover:bg-danger-dark w-5/6 text-white font-bold py-2 px-4 rounded"value="가입하기"> 		
			  		</div>
			      </div>
			</div><!-- id="agreementForm" -->
		</div><!--회원가입 폼   -->
	</form>
</div><!-- 회원가입창 -->





</body>
</html>