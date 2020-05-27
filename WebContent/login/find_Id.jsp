<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find_Id</title>
</head>

<script>
$(function(){
	$("#bMember").click(function(){
		$("#reTxt").css({
			"display":"none"	 
		});
		if($("input[id='bMember']").prop("checked")==true){
			$("#bmInfo").css({
				"display":"block"
			});
			$("#pmInfo").css({
				"display":"none"
			});
		}
	});
	$("#pMember").click(function(){
		$("#reNum").css({
			"display":"none"	 
		});
		if($("input[id='pMember']").prop("checked")==true){
			$("#bmInfo").css({
				"display":"none"
			});
			$("#pmInfo").css({
				"display":"block"
			});
		}
	});
});
var reg= /^[가-힝]{2,7}$/;
var reg2= /^\w{4,20}$/;
var reg3= /^[a-zA-Z]{2,10}[.]{1}[a-zA-Z]{2,3}$/;
var reg4= /^[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}$/;
var reg5= /^[a-zA-Z]{1}\w{7,11}$/; 
var reg6= /^[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}$/;


function findUser_Id(){
	if($("input[id='pMember']").prop("checked")==true){
		$("#reNum").css({
			"display":"none"	 
		});
		$("#bmInfo").css({
			"display":"none"
		});
		$("#pmInfo").css({
			"display":"block"
		});
		if(!reg.test($("#rename").val())){
			$("#reTxt").css({
				"display":"block"
			});
			return false;
		}else{
			$("#reTxt").css({
				"display":"none"	 
			});
		}
		
		if(!reg2.test($("#reEmail").val()) || !reg3.test($("#domain").val())){
			$("#reTxt2").css({
				"display":"block"	 
			});
			return false;
		}else{
			$("#reTxt2").css({
				"display":"none"	 
			});
		}
	}
	
	if($("input[id='bMember']").prop("checked")==true){
		$("#reTxt").css({
			"display":"none"	 
		});
		$("#bmInfo").css({
			"display":"block"
		});
		$("#pmInfo").css({
			"display":"none"
		});
		if(!reg6.test($("#reBNum").val())){
			$("#reNum").css({
				"display":"block"	
			});
			return false;
		}else{
			$("#reNum").css({
				"display":"none"	 
			});
		}
		if(!reg2.test($("#reEmail").val()) || !reg3.test($("#domain").val())){
			$("#reTxt2").css({
				"display":"block"	 
			});
			return false;
		}else{
			$("#reTxt2").css({
				"display":"none"	 
			});
		}
	}
}

function findUser_Pwd(){

		if(!reg5.test($("#reId").val())){
			$("#reTxt3").css({
				"display":"block"
			});
			return false;
		}else{
			$("#reTxt3").css({
				"display":"none"
			});
		}
		if(!reg2.test($("#reEmail2").val()) || !reg3.test($("#domain2").val())){
			$("#reTxt4").css({
				"display":"block"	
			});
			return false;
		}else{
			$("#reTxt4").css({
				"display":"none"	 
			});
		}
	
}
</script>
<body>

			<div class="w-full max-w-screen-xl my-24 mx-auto flex flex-wrap">
				<div class="text-4xl w-full mb-20 -mt-16">계정찾기</div>
				<form method="post" action="<%=projectPath%>/login/find_IdOk.do" onsubmit="return findUser_Id()">
					<div class="mr-2" style="width:630px"><!----------------------------- 아이디 찾기 -------------------------------------->
						<div class="flex border-solid border-danger border-b mb-5">
							<i class="xi-search text-4xl"></i>
							<span class="text-lg leading-10 mr-3 text-2xl">아이디 찾기</span>
						</div>
						<div class="border border-gray">
							<div class="flex ml-5 mt-8">
								<i class="xi-angle-right leading-6"></i>
								<span class="text-xl">회원유형</span>
								<div class="ml-24 text-xl">
									<input type="radio" name="member" value="1" checked id="pMember">일반회원
									<input type="radio" name="member" value="2" class="ml-40" id="bMember">법인회원
								</div>
							</div>
							<div class="flex ml-5 mt-8" id="pmInfo">
								<i class="xi-angle-right leading-6"></i>
								<span class="text-xl">이름</span>
								<input name="user_name" type="text" placeholder="이름" class="border h-10 ml-24 rounded h-12 text-lg" style="width:440px;" id="rename"/>
							</div>
							<div class="flex ml-5 mt-8 hidden" id="bmInfo">
								<i class="xi-angle-right leading-6"></i>
								<span class="text-xl">사업자등록번호</span>
								<input type="text" placeholder="사업자등록번호10자리" class="border h-10 ml-2 rounded h-12 text-lg" style="width:435px;" id="reBNum" maxlength="10"/>
							</div>
							<div class="text-danger mt-2 hidden" style="margin-left:300px" id="reTxt">이름을 다시 입력해주세요.</div>
							<div class="text-danger mt-2 hidden" style="margin-left:300px" id="reNum">번호(10자리)을 다시 입력해주세요.</div>
							<div class="flex ml-5 mt-8">
								<i class="xi-angle-right leading-6"></i>
								<span class="text-xl">이메일</span>
								<div class="ml-20">
									<input name="user_email_id" type="text" class="border h-10 w-32 rounded h-12 mr-1 text-lg" id="reEmail"/><span>@</span>
									<input name="user_email_domain" type="text" class="border h-10 w-32 text-center rounded h-12 ml-1 text-lg" id="domain"/>
									<div class="inline-block relative w-40  ">
										<select id="email" onclick="inputDomain()" class="h-12 block appearance-none w-full bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline">
											<option>직접입력</option>
										    <option>naver.com</option>
										    <option>daum.net</option>
										    <option>gmail.com</option>
										    <option>hotmail.com</option>
										    <option>nate.com</option>
										    <option>korea.com</option>
										    <option>chollian.net</option>
									  	 </select>
									  	 <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
							    			<svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
							  			</div>
						 			</div>
						 			<div class="text-danger hidden" style="margin-left:128px" id="reTxt2">이메일을 다시 입력해주세요.</div>
					 			</div>
							</div>
							<div class="text-center my-8">
								<input type="submit" class="h-10 w-24 border" id="sendId" value="아이디 조회"/>
							</div>
						</div>
					</div><!-------------------------------------------- 아이디 찾기 끝----------------------------------------->
				</form>
				<form method="post" action="<%=projectPath%>/login/find_PwOk.do" onsubmit="return findUser_Pwd()">
					<div class="ml-3" style="width:630px"><!---------------------------------- 비빌번호 찾기 ------------------------------------------>
						<div class="flex border-solid border-danger border-b mb-5">
							<i class="xi-search text-4xl"></i>
							<span class="text-lg leading-10 mr-3 text-2xl">비밀번호 찾기</span>
						</div>
						<div class="border border-gray">
							<div class="flex ml-5 mt-8">
								<i class="xi-angle-right leading-6"></i>
								<span class="text-xl">회원유형</span>
								<div class="ml-24 text-xl">
									<input type="radio" name="member2" value="1" checked>일반회원
									<input type="radio" name="member2" value="2" class="ml-40">법인회원
								</div>
							</div>
							<div class="flex ml-5 mt-8">
								<i class="xi-angle-right leading-6"></i>
								<span class="text-xl">아이디</span>
								<input type="text" name="user_id" placeholder="아이디" class="border h-10 ml-20 rounded h-12 text-lg" style="width:440px;" id="reId"/>
							</div>
							<div class="text-danger mt-2 hidden" style="margin-left:300px;"id="reTxt3">아이디를 다시 입력해주세요.</div>
							<div class="flex ml-5 mt-8">
								<i class="xi-angle-right leading-6"></i>
								<span class="text-xl">이메일</span>
								<div class="ml-20">
									<input type="text" name="user_email_id"class="border h-10 w-32 rounded h-12 mr-1 text-lg" id="reEmail2"/><span>@</span>
									<input type="text" name="user_email_domain" class="border h-10 w-32 text-center rounded h-12 ml-1 text-lg" id="domain2"/>
									<div class="inline-block relative w-40  ">
										<select id="email2" onclick="inputDomain2()" class="h-12 block appearance-none w-full bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline">
											<option>직접입력</option>
										    <option>naver.com</option>
										    <option>daum.net</option>
										    <option>gmail.com</option>
										    <option>hotmail.com</option>
										    <option>nate.com</option>
										    <option>korea.com</option>
										    <option>chollian.net</option>
									  	 </select>
									  	 <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
							    			<svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
							  			</div>
						 			</div>
						 			<div class="text-danger hidden" style="margin-left:130px" id="reTxt4">이메일을 다시 입력해주세요.</div>
					 			</div>
							</div>
							<div class="text-center my-8">
								<input type="submit" class="h-10 w-32 border" id="sendId2" value="비밀번호 조회"/>
							</div>
						</div>
					</div><!---------------------------------- 비빌번호 찾기 끝------------------------------------------>
				</form>
			</div>
			<a href="/project_Ma/login/login.html"><div class="w-32 h-10 border mb-24 mx-auto justify-center rounded">
					<div class="text-center leading-9 login h-full">로그인하러 가기</div>
				</div></a>


</body>
</html>