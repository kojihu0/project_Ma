<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join_Corporate</title>
<script>
$(function(){ 
	$("#joinMembershipCheckBtn").click(function(){
		reg = /^[a-zA-Z]{1}\w{7,11}$/; //[a-zA-Z0-9_] = \w: 영어 대소문자, 숫자,_		
		if (!reg.test($("#idText").val())) {
			alert("아이디는 첫번째 문자는 영문자 ,영,숫자,_만 허용 , 8~12글자까지 허용합니다...");
			return false;
		}else{
		//아이디 중복 체크 
		window.open("<%=projectPath%>/joinMembership/idCheck.do?user_id="+$('#idText').val(),"joinMembershipCheckBtn","width=400px, height=300px");
		}
	});
});
$(function(){ 
	$("#blnCheckBtn").click(function(){
		reg = /^[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]$/;
		if (!reg.test($("#coporateText").val())) {
			alert("양식에 맞는 사업자 등록번호를 입력해주세요.");
			return false;
		}else{
		//사업자 등록번호 중복체크 
		window.open("<%=projectPath%>/joinMembership/regi_no.do?corpo_regi_no="+$('#coporateText').val(),"blnCheckBtn","width=400px, height=300px");
		}
	});
});
$(function(){ 
	function email(url,params,msg){
	$.ajax({
		url : url,
		data : params,
		success : function(result){console.log(result);
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
<div class="e shadow appearance-none border-gray-dark" id="joinMemberShipDiv"><!-- 회원가입창 -->
<p class="text-center text-4xl font-bold">법인 회원가입</p>
<div id="joinMenberShipForm">
	<div id="agreementForm">
	<input class="checkBox" type="checkbox" id="allAgreement">
	<label for="allAgreement" id="allAgreementText">전체동의</label>
	<button><a href="#" data-target="#agreementModal" id="move-ico">〉</a></button><br/>
	<h5>체리트리  서비스 이용약관(필수),개인정보 수집 및 이용동의(필수),마케팅 정보 수신(선택)</h5><br/> 
	<form onsubmit="return CoporateRegExpChk()" action="<%=projectPath%>/joinMembership/join_MemberShipCpOk.do" method="post" id="idForm"class="mb-4">
	    <div id="joinMemberShiptext">
    	  <h3 id="subText2">법인 정보</h3><br/>
	      <input  name="corpo_regi_no" id="coporateText" class="number-only shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="text" maxlength="10" placeholder="사업자등록번호">
	      <input type="button"  value="중복체크"id="blnCheckBtn" class="bg-danger hover:bg-danger-dark text-white font-bold py-2 px-4 rounded">
	      <input type="hidden" id="regi_no_Status" value="N"/><!-- 아이디 중복검사 여부 설정 -->				
		  <br/>
		 </div>
	    <input id="userNameText" name="user_name"class="shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline" type="text" placeholder="대표자명">
	    <div id="joinMemberShiptext">
     		<input name="corpo_name" id="coporateName"  class="shadow appearance-none border-gray-darker  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="text" placeholder="법인명"><br/>
  		 </div>
  		<div id="joinMemberShiptext">
      		<input id="registerNumber" name="corpo_no" class=" number-only shadow appearance-none border-gray-darker  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="text" maxlength="13" placeholder="법인등록번호(13자리)"><br/>
  		</div>
  		<input id="idText" name="user_id"class="shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline" id="coporateText" type="text" placeholder="아이디">
	    <input type="button" value="중복체크" id="joinMembershipCheckBtn" class="bg-danger hover:bg-danger-dark text-white font-bold py-2 px-4 rounded"><a href="#" data-target="#idCheck" id="move-ico"><br/></a>
		<input type="hidden" id="idStatus" value="N"/><!-- 아이디 중복검사 여부 설정 -->
      		<h3 id="subText2">계정 정보</h3><br/>
      		<div id="joinMemberShipText2" class="emailFrm">
      		<input id="e-mailText" name="user_email" class="shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="text" placeholder="이메일">
      		<input type="button" value="인증하기"id="joinMembershipEmailCheckBtn" class="bg-danger hover:bg-danger-dark text-white font-bold py-2 px-4 rounded">
				<br/>
			<label id="subText">위 이메일로 인증번호가 발송됩니다.</label><br/>
      	</div>
   		<div class="emailchkFrm mt-4" style="width:500px;display:none">
	   		<input name="user_email2"id="user_email2"class="shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="text" placeholder="이메일인증">
	   		<input type="hidden" name="emailCheckResult" id="emailCheckResult" value="no"/>
	   		<input type="button" id="joinMembershipEmailCheckBtn2" value="인증하기" class="bg-danger hover:bg-danger-dark text-white font-bold py-2 px-4 rounded">	<br/>
	   		<label id="subText" class="text-danger">위 이메일로 인증번호가 발송되었습니다.</label><br/>	
   		</div>
      	  <input  name="user_tel" class="number-only shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="text" placeholder="법인전화번호">
      	<div id="joinMemberShiptext">
      		<input id="pw" name="user_pw" class="shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="password" placeholder="비밀번호">
      	</div>
      	<div id="joinMemberShiptext">
      		<input id="pwChk" class="shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="password" placeholder="비밀번호 확인"><br/>
      		<label id="subText">영문, 숫자, 특수문자 조합한 8자 이상</label><br/>
      		<div class="text-success" id="coporatePw">비밀번호가 일치합니다.</div>
      		<div class="text-danger" id="coporatePwChk">비밀번호가 일치하지 않습니다.</div>
      	</div>
      	<div>
      		<input type="submit" value="가입하기" id="coporate_CompleteBtn" class="bg-danger w-5/6 hover:bg-danger-dark text-white font-bold py-2 px-4 rounded">
	      	</div>
	    </form>
	    </div>
	</div><!--회원가입 폼   -->
</div><!-- 회원가입창 -->
	<!-- 약관동의  -->
</body>
</html>