<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find_Id</title>
</head>
<body>

			<div class="w-full max-w-screen-xl my-24 mx-auto flex flex-wrap">
				<div class="text-4xl w-full mb-20 -mt-16">계정찾기</div>
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
								<input type="radio" name="member" value="personal" checked id="pMember">일반회원
								<input type="radio" name="member" value="branch" class="ml-40" id="bMember">법인회원
							</div>
						</div>
						<div class="flex ml-5 mt-8" id="pmInfo">
							<i class="xi-angle-right leading-6"></i>
							<span class="text-xl">이름</span>
							<input type="text" placeholder="이름" class="border h-10 ml-24 rounded h-12 text-lg" style="width:440px;" id="rename"/>
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
								<input type="text" class="border h-10 w-32 rounded h-12 mr-1 text-lg" id="reEmail"/><span>@</span>
								<input type="text" class="border h-10 w-32 text-center rounded h-12 ml-1 text-lg" id="domain"/>
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
							<button class="h-10 w-24 border" id="sendId">아이디 조회</button>
						</div>
						<div class="flex ml-40 hidden" id="emailMsg">
							<i class="xi-mail text-3xl"></i>
							<span class="text-danger text-lg">아이디가 이메일주소로 전송되었습니다.</span>
						</div>
					</div>
				</div><!-------------------------------------------- 아이디 찾기 끝----------------------------------------->
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
								<input type="radio" name="member2" value="personal" checked>일반회원
								<input type="radio" name="member2" value="branch" class="ml-40">법인회원
							</div>
						</div>
						<div class="flex ml-5 mt-8">
							<i class="xi-angle-right leading-6"></i>
							<span class="text-xl">아이디</span>
							<input type="text" placeholder="아이디" class="border h-10 ml-20 rounded h-12 text-lg" style="width:440px;" id="reId"/>
						</div>
						<div class="text-danger mt-2 hidden" style="margin-left:300px;"id="reTxt3">아이디를 다시 입력해주세요.</div>
						<div class="flex ml-5 mt-8">
							<i class="xi-angle-right leading-6"></i>
							<span class="text-xl">이메일</span>
							<div class="ml-20">
								<input type="text" class="border h-10 w-32 rounded h-12 mr-1 text-lg" id="reEmail2"/><span>@</span>
								<input type="text" class="border h-10 w-32 text-center rounded h-12 ml-1 text-lg" id="domain2"/>
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
							<button class="h-10 w-32 border" id="sendId2">비밀번호 조회</button>
						</div>
						<div class="flex ml-40 hidden" id="emailMsg2">
							<i class="xi-mail text-3xl"></i>
							<span class="text-danger text-lg">임시비밀번호가 이메일주소로 전송되었습니다.</span>
						</div>
					</div>
				</div><!---------------------------------- 비빌번호 찾기 끝------------------------------------------>
			</div>
			<a href="/project_Ma/login/login.html"><div class="w-32 h-10 border mb-24 mx-auto justify-center rounded">
					<div class="text-center leading-9 login h-full">로그인하러 가기</div>
				</div></a>


</body>
</html>