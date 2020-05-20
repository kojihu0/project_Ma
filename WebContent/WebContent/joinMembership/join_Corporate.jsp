<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join_Corporate</title>
</head>
<body>
<div class="e shadow appearance-none border-gray-dark" id="joinMemberShipDiv"><!-- 회원가입창 -->
			<p class="text-center text-4xl font-bold">법인 회원가입</p>
			<div id="joinMenberShipForm">
				<div id="agreementForm">
				<input type="checkbox" id="allAgreement">
				<label for="allAgreement" id="allAgreementText">전체동의</label>
				<button><a href="#" data-target="#agreementModal" id="move-ico">〉</a></button><br/>

				<h5>체리트리  서비스 이용약관(필수), 마케팅 정보 수신(선택)</h5><br/> 
				<form onsubmit="return CoporateRegExpChk()" action="/project_Ma/joinMembership/completedJoin.html" method="post" id="idForm"class="mb-4">
					
				    <div id="joinMemberShiptext">
				    	  <h3 id="subText2">법인 정보</h3><br/>
					      <input id="coporateText" class="number-only shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="text" maxlength="10" placeholder="사업자등록번호">
					      <input type="button"  value="중복체크"id="blnCheckBtn" class="bg-danger hover:bg-danger-dark text-white font-bold py-2 px-4 rounded">				
					      
						  <br/>
					 </div>
					 <div id="joinMemberShiptext">
			      		<input id="coporateName" class="shadow appearance-none border-gray-darker  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="text" placeholder="법인명"><br/>
			  		</div>
			  		<div id="joinMemberShiptext">
			      		<input id="registerNumber" class=" number-only shadow appearance-none border-gray-darker  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="text" maxlength="13" placeholder="법인등록번호(13자리)"><br/>
			  		</div>
			  		<input id="idText" class="shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline" id="coporateText" type="text" placeholder="아이디">
							      <input type="button" value="중복체크" id="joinMembershipCheckBtn" class="bg-danger hover:bg-danger-dark text-white font-bold py-2 px-4 rounded"><a href="#" data-target="#idCheck" id="move-ico"><br/></a>
							      
							      
					<div id="joinMemberShipText2">
			      		<h3 id="subText2">계정 정보</h3><br/>
			      		<input id="e-mailText" class="shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="text" placeholder="이메일">
			      		<input type="button" value="인증하기"id="emailChkBtn" class="bg-danger hover:bg-danger-dark text-white font-bold py-2 px-4 rounded">
						
							<br/>
						<label id="subText">위 이메일로 인증번호가 발송됩니다.</label><br/>
						
			      	</div>
			      	<div id="joinMemberShiptext">
			      		<input id="pw" class="shadow appearance-none border-gray-dark  w-5/6 py-3 px-4 text-black leading-tight focus:outline-none focus:shadow-outline"  type="password" placeholder="비밀번호">
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