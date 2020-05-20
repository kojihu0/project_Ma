<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<ul class="mpMenu flex">
			  <li class="flex-1 mr-2">
			    <a class="text-center block border border-blue-500 rounded py-3 px-5 bg-danger-dark hover:bg-danger-dark text-white" href="<%=projectPath%>/mypage/corporatePage.jsp">법인 정보</a>
			  </li>
			  <li class="flex-1 mr-2">
			    <a class="text-center block border border-blue-500 rounded py-3 px-5 bg-danger hover:bg-danger-dark text-white" href="<%=projectPath%>/mypage/campaignControlPage.jsp">캠페인 관리</a>
			  </li>
			  <li class="flex-1 mr-2">
			    <a class="text-center block border border-blue-500 rounded py-3 px-5 bg-danger hover:bg-danger-dark text-white" href="<%=projectPath%>/mypage/campaignWrite.jsp">캠페인 등록</a>
			  </li>
			 </ul>
		 	 
		 
		 <div id="myInformation" class="tab-content"><!-- 내정보 탭-->
		<div id="explain" class="w-full max-w-screen-xl my-2 mx-auto border-solid border-gray border-b  my-1 text-4xl py-4">법인 정보</div>
		 <!-- 법인명 -->
		  <div class="informationFrm">
				<div class="bg-white" style="margin:0 auto;border:1px gray solid;width:1000px;">
					<form class="w-full max-w-2xl m-0 m-auto mt-8 ">
					  <div class="flex flex-wrap -mx-3 mb-6">
					    <div class="w-full px-3">
					      <label class="block uppercase tracking-wide text-gray-darker text-xs font-bold mb-2" for="grid-name">
					       Corporate name
					      </label>
					      <input class="appearance-none block w-full  text-gray-darkest text-2xl border-b border-info  py-5 px-5 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-danger" id="grid-name" type="text">
					    </div>
					  </div>
					  <div class="flex flex-wrap -mx-3 mb-6">
					    <div class="w-full px-3">
					      <label class="block uppercase tracking-wide text-gray-darker text-xs font-bold mb-2" for="grid-name">
					    	Business license number
					      </label>
					      <input class="appearance-none block w-full  text-gray-darkest text-2xl border-b border-info  py-5 px-5 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-danger" id="grid-name" type="text">
					    </div>
					  </div>
					  
					  <div class="flex flex-wrap -mx-3 mb-6">
					    <div class="w-full px-3">
					      <label class="block uppercase tracking-wide text-gray-darker text-xs font-bold mb-2" for="grid-name">
					       Corporate registration number
					      </label>
					      <input class="appearance-none block w-full  text-gray-darkest text-2xl border-b border-info  py-5 px-5 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-danger" id="grid-name" type="text">
					    </div>
					  </div>
					  
					  <div class="flex flex-wrap -mx-3 mb-6">
					    <div class="w-full px-3">
					      <label class="block uppercase tracking-wide text-gray-darker text-xs font-bold mb-2" for="grid-id">
					        ID
					      </label>
					      <input class="appearance-none block w-full  text-gray-darkest text-2xl border-b border-info   py-5 px-5 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-danger" id="grid-id" type="text">
					    </div>
					  </div>
					  
					  <div class="flex flex-wrap -mx-3 mb-6">
					    <div class="w-full px-3">
					      <label class="block uppercase tracking-wide text-gray-darker text-xs font-bold mb-2" for="grid-password">
					        Password
					      </label>
					      <input class="appearance-none block w-full bg-gray-200 text-gray-darkest text-2xl border-b border-info border-gray-200  py-5 px-5 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-danger" id="grid-password" type="password">
					      <input data-target="#passwordUpdate" id="move-ico" type="submit" value="비밀번호 변경" class="absolute bg-danger text-white bg-blue-500 hover:bg-blue-700 text-white font-bold py-4 px-5 rounded">
					    </div>
					  </div>
					  
					  <div class="flex flex-wrap -mx-3 mb-6">
					    <div class="w-full px-3">
					      <label class="block uppercase tracking-wide text-gray-darker text-xs font-bold mb-2" for="grid-email">
					        E-mail
					      </label>
					      <input class="appearance-none block w-full  text-gray-darkest text-2xl border-b border-info border-gray-200  py-5 px-5 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-danger" id="grid-email" type="text">
					    </div>
					  </div>
					  
					  <div class="flex flex-wrap -mx-3 mb-6">
					    <div class="w-full px-3">
					      <label class="block uppercase tracking-wide text-gray-darker text-xs font-bold mb-2" for="grid-password">
					        tel
					      </label>
					      <input class="appearance-none block w-full  text-gray-darkest text-2xl border-b border-info border-gray-200  py-5 px-5 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-danger" id="grid-password" type="text">
					     
					    </div>
					  </div>
					  
					    <div class="flex flex-wrap -mx-3 mb-6">
					    <div class="w-full px-3">
					      <label class="block uppercase tracking-wide text-gray-darker text-xs font-bold mb-2" for="grid-address">
					       Address
					      </label>
					      <input class="appearance-none block w-full  text-gray-darkest text-2xl border-b border-info py-5 px-5 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-danger" id="grid-address" type="text">
					     <input id="move-ico" type="submit" value="우편번호 검색" class="absolute bg-danger text-white bg-blue-500 hover:bg-blue-700 text-white font-bold py-4 px-5 rounded">
					    </div>
					  </div>
					  
					   <div class="flex flex-wrap -mx-3 mb-2">
					   
					    <div class="w-full md:w-3/6 px-3 mb-6 md:mb-0">
					      <label class="block uppercase tracking-wide text-gray-darker text-xs font-bold mb-2" for="grid-main">
					        main
					      </label>
					      <input class="appearance-none block w-full  text-gray-darkest text-2xl border-b border-info py-5 px-5 leading-tight focus:outline-none focus:bg-white focus:border-danger" id="grid-main" type="text">
					    </div>
					    
					    <div class="w-full md:w-3/6 px-3 mb-6 md:mb-0">
					      <label class="block uppercase tracking-wide text-gray-darker text-xs font-bold mb-2" for="grid-sub">
					        sub
					      </label>
					      <input class="appearance-none block w-full  text-gray-darkest text-2xl border-b border-info py-5 px-5 leading-tight focus:outline-none focus:bg-white focus:border-danger" id="grid-sub" type="text">
					    </div>
					    
					    
					    </div
					    >
					    <div style="width:200px;height:110px; margin : 0 auto ">
					      <input  type="submit" value="수정하기" class=" mb-12 mt-8 bg-danger text-white bg-blue-500 hover:bg-blue-700 text-white font-bold py-4 px-5 rounded">
					  		<input  type="button" value="홈으로" class="gohome mb-12 mt-8 bg-danger text-white bg-blue-500 hover:bg-blue-700 text-white font-bold py-4 px-5 rounded">
						</div>
						<<input id="deleteBtn" type="submit" data-target="#deleteFrm" value="회원 탈퇴" class="deleteBtn absolute mb-12 mt-8 bg-danger text-white bg-blue-500 hover:bg-blue-700 text-white font-bold py-4 px-5 rounded">
					</form>	
		 		</div>
			</div>	
		 </div>
		 
		
		 
</body>
</html>