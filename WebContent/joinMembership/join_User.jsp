<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join_user</title>
</head>
<body>

<div class="shadow appearance-none border-gray-dark" id="joinMemberShipDiv"><!-- 회원가입창 -->
			 <form method="post" action="/project_Ma/joinMembership/completedJoin.html" onsubmit="return regExpChk()">
				<p class="text-center text-4xl font-bold">회원가입</p>
				<div id="joinMenberShipForm">
					<div id="agreementForm"><input type="checkbox" id="allAgreement">
						<label for="allAgreement" id="allAgreementText">전체동의</label>
						<button><a href="#" data-target="#agreementModal" id="move-ico">〉</a></button><br/>
						<h5>체리트리 서비스 이용약관(필수),개인정보 수집 및 이용동의(필수),<br/>마케팅정보 수집동의(선택)</h5><br/>
						<div id="idForm"class="mb-S4">
							<div id="joinMemberShiptext">
					      		<input id="userNameText"class="shadow appearance-none border-gray-darker  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="text" placeholder="이름"><br/>
					  		</div>
						    <div id="joinMemberShiptext">
							      <input id="idText" class="shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="text" placeholder="아이디">
							      <input type="button" value="중복체크" id="joinMembershipCheckBtn" class="bg-danger hover:bg-danger-dark text-white font-bold py-2 px-4 rounded"><a href="#" data-target="#idCheck" id="move-ico"><br/>
							      <label id="subText">아이디는 첫번째 문자는 영문자 ,영,숫자,_만 허용 , 8~12글자까지 허용합니다..</label>
								</a><br/>
						    </div>
					      	<div id="joinMemberShiptext">
					      		<input  id="passwordText" class="shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="password" placeholder="비밀번호">
					      	</div>
					      	<div id="joinMemberShiptext">
					      		<input id="passwordTextCheck" class="shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="password" placeholder="비밀번호 확인"><br/>
					      		<label id="subText">영문, 숫자, 특수문자를 조합한 8자 이상</label><br/>
					      		<div class="text-success" id="pw-success">비밀번호가 일치합니다</div>
					      		<div class="text-danger" id="pw-danger">비밀번호가 일치하지 않습니다</div>
					      	</div>
					      	<div id="joinMemberShipText2">
					      		<input class="shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="text" placeholder="핸드폰번호" maxlength="11"><br/>
					      		<label id="subText">휴대폰 번호 입력 시 -은 생략입니다</label><br/>
					      	</div>
					      	<div id="joinMemberShipText2">
					      		<input name="email"id="e-mailText"class="shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="text" placeholder="이메일">
					      		<input type="button" id="joinMembershipEmailCheckBtn" value="인증하기" class="bg-danger hover:bg-danger-dark text-white font-bold py-2 px-4 rounded">	<br/>
								<label id="subText">위 이메일로 인증번호가 발송됩니다.</label><br/>	
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