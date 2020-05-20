<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>

			<div class="w-full max-w-screen-xl my-24 mx-auto flex flex-wrap">
				<div class="w-1/2"><!----------------------- 로그인  --------------------------------------------->
					<div class="text-4xl">로그인</div>
					<div class="w-full max-w-lg">
					  <form class="bg-white rounded px-8 pt-6 pb-8 mb-4">
					    <div class="mb-4">
					      <label class="block text-gray-700 text-sm font-bold mb-2" for="username">
					      	  아이디
					      </label>
					      <input class="border rounded w-full py-2 px-3 text-gray-700 leading-tight h-12" id="username" type="text" placeholder="아이디">
					    </div>
					    <div class="mb-6">
					      <label class="block text-gray-700 text-sm font-bold mb-2" for="password">
					       	 비밀번호
					      </label>
					      <input class="border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight h-12" id="password" type="password" placeholder="비밀번호">
					    </div>
					    <div class="flex items-center justify-between">
					    	<label class="inline-flex items-center">
					    		<input type="checkbox" class=" w-5 h-5">
					    		<span>아이디 저장</span>
					    	</label>
					      <a class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800 hover:text-gray" href="findAccount.html">
					      	  아이디/비밀번호 찾기
					      </a>
					    </div>
						    <button class="text-white font-bold py-2 px-4 rounded bg-danger w-full my-8 h-12">
						                    로그인
						     </button>
						 <div class="flex justify-center mb-8">
							<a href="#"><div class="flex w-48 h-16 justify-center mx-5" style="border:solid 1px lightgray; line-height:64px;">
							 	<i class="xi-naver text-4xl" style="line-height:64px; color:rgb(050,205,050)"></i>
							 	<span class="text-lg mx-3">네이버</span>
							 </div> </a>
							 <a href="#"><div class="flex w-48 h-16 justify-center mx-5" style="border:solid 1px lightgray; line-height:64px;">
							 	<i class="xi-kakaotalk text-4xl" style="line-height:64px;"></i>
							 	<span class="text-lg mx-3">카카오</span>
							  </div></a>
						 </div>
						<div class="flex justify-center">
							<a class="inline-block align-baseline font-bold text-sm hover:text-gray mx-10 underline" href="/project_Ma/joinMembership/joinMemberShipSelect.html">
					      	  일반 회원가입
					         </a>
					         <a class="inline-block align-baseline font-bold text-sm hover:text-gray mx-10 underline" href="/project_Ma/joinMembership/coporate_join.html">
					      	  법인 회원가입
					         </a>
						</div>
					  </form>
					</div>
				</div><!----------------------------- 로그인  ----------------------------------->
				<div class="w-1/2"><!----------------- 광고 창 ----------------------------------->
					<div id="imgList">
						<img class="slide1" src="../img/img_List/dokdo2.jpg"/>
						<img class="slide1" src="../img/img_List/culture2.jpg"/>
						<img class="slide1" src="../img/img_List/women_in_war2.jpg"/>
					</div>
				</div><!----------------- 광고 창 끝 ----------------------------------->
			</div>


</body>
</html>