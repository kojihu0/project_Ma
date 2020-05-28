<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav>
		<ul class="mpMenu flex">
		  <li class="flex-1 mr-2">
		    <a class="text-center block border border-blue-500 rounded py-3 px-5 bg-danger-dark hover:bg-danger-dark text-white" href="<%=projectPath %>/mypage/mypage.do">내 정보</a>
		  </li>
		  <li class="flex-1 mr-2">
		    <a class="text-center block border border-blue-500 rounded py-3 px-5 bg-danger hover:bg-danger-dark text-white" href="<%=projectPath %>/mypage/mypageSpon.do">후원 목록</a>
		  </li>
		  <li class="flex-1 mr-2">
		    <a class="text-center block border border-blue-500 rounded py-3 px-5 bg-danger hover:bg-danger-dark text-white" href="<%=projectPath %>/mypage/mypageWishList.do">위시 리스트</a>
		  </li>
		 </ul>
	</nav>
	<div id="explain"  class=" w-full max-w-screen-xl my-2 mx-auto border-solid border-gray border-b  my-1 text-4xl py-4">내 정보 </div>
		<div class="informationFrm">
			<div class="bg-white" style="margin:0 auto;border:1px gray solid;width:1000px;">
				<form class="w-full max-w-2xl m-0 m-auto mt-8 " action="<%=projectPath%>/mypage/editOk.do">
				  <div class="flex flex-wrap -mx-3 mb-6">
				    <div class="w-full px-3">
				      <label class="block uppercase tracking-wide text-gray-darker text-xs font-bold mb-2" for="grid-name">
				        Name
				      </label>
				      <input value="${vo.user_name}"name="user_name"class="appearance-none block w-full  text-gray-darkest text-2xl border-b border-info  py-5 px-5 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-danger" id="grid-name" type="text">
				    </div>
				  </div>
				  <div class="flex flex-wrap -mx-3 mb-6">
				    <div class="w-full px-3">
				      <label class="block uppercase tracking-wide text-gray-darker text-xs font-bold mb-2" for="grid-id">
				        ID
				      </label>
				      <input value='${vo.user_id }'name="user_id" class="appearance-none block w-full  text-gray-darkest text-2xl border-b border-info   py-5 px-5 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-danger" readonly="readonly" id="grid-id" type="text">
				    </div>
				  </div>
				  <div class="flex flex-wrap -mx-3 mb-6">
				    <div class="w-full px-3">
				      <label class="block uppercase tracking-wide text-gray-darker text-xs font-bold mb-2" for="grid-password">
				        Password
				      </label>
				      <input value="${vo.user_pw }" name="user_pw" class="appearance-none block w-full bg-gray-200 text-gray-darkest text-2xl border-b border-info border-gray-200  py-5 px-5 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-danger" id="grid-password" type="password">
				      <input  data-target="#passwordUpdate" id="move-ico" type="submit" value="비밀번호 변경" class="absolute bg-danger text-white hover:bg-danger-dark text-white font-bold py-4 px-5 rounded">
				    </div>
				  </div>
				  <div class="flex flex-wrap -mx-3 mb-6">
				    <div class="w-full px-3">
				      <label class="block uppercase tracking-wide text-gray-darker text-xs font-bold mb-2" for="grid-email">
				        E-mail
				      </label>
				      <input value="${vo.user_email }" name="user_email"class="appearance-none block w-full  text-gray-darkest text-2xl border-b border-info border-gray-200  py-5 px-5 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-danger" id="grid-email" type="text">
				    </div>
				  </div>
				  <div class="flex flex-wrap -mx-3 mb-6">
				    <div class="w-full px-3">
				      <label class="block uppercase tracking-wide text-gray-darker text-xs font-bold mb-2" for="grid-password">
				        tel
				      </label>
				      <input value=" ${vo.user_tel }" name="user_tel" class="appearance-none block w-full  text-gray-darkest text-2xl border-b border-info border-gray-200  py-5 px-5 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-danger" id="grid-password" type="text">
				    </div>
				  </div>
				    <div class="flex flex-wrap -mx-3 mb-6">
				    <div class="w-full px-3">
				      <label class="block uppercase tracking-wide text-gray-darker text-xs font-bold mb-2" for="grid-address">
				       Address
				      </label>
				      <input value="${vo.addr_no }" name="addr_no"class="appearance-none block w-full  text-gray-darkest text-2xl border-b border-info py-5 px-5 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-danger" id="grid-address" type="text">
				     <input id="move-ico" type="button" value="우편번호 검색" class="absolute bg-danger text-white hover:bg-danger-dark text-white font-bold py-4 px-5 rounded">
				    </div>
				  </div>
				   <div class="flex flex-wrap -mx-3 mb-2">
				    <div class="w-full md:w-3/6 px-3 mb-6 md:mb-0">
				      <label class="block uppercase tracking-wide text-gray-darker text-xs font-bold mb-2" for="grid-main">
				        main
				      </label>
				      <input value="${vo.addr_main }" name="addr_main" class="appearance-none block w-full  text-gray-darkest text-2xl border-b border-info py-5 px-5 leading-tight focus:outline-none focus:bg-white focus:border-danger" id="grid-main" type="text">
				    </div>
				     <div class="w-full md:w-3/6 px-3 mb-6 md:mb-0">
				      <label class="block uppercase tracking-wide text-gray-darker text-xs font-bold mb-2" for="grid-sub">
				        sub
				      </label>
				      <input value="${vo.addr_sub }" name="addr_sub" class="appearance-none block w-full  text-gray-darkest text-2xl border-b border-info py-5 px-5 leading-tight focus:outline-none focus:bg-white focus:border-danger" id="grid-sub" type="text">
				     </div>
				    </div><br/>
				    <label class="block uppercase tracking-wide text-gray-darker text-xs font-bold mb-2" for="grid-sub">
				       mileage
				      </label>
				    <input  name="mileage" class="appearance-none block w-full  text-gray-darkest text-2xl border-b border-info py-5 px-5 leading-tight focus:outline-none focus:bg-white focus:border-danger" id="grid-sub" type="text">
				    <div style="width:200px;height:110px; margin : 0 auto;">
				      <input type="submit" value="수정하기" class=" mb-12 mt-8 bg-danger text-white bg-blue-500 hover:bg-blue-700 text-white font-bold py-4 px-5 rounded">
				  	  <input type="button" value="홈으로" class="gohome mb-12 mt-8 bg-danger text-white bg-blue-500 hover:bg-blue-700 text-white font-bold py-4 px-5 rounded">
					</div>
					 <input id="deleteBtn" type="submit" data-target="#deleteFrm" value="회원 탈퇴" class="deleteBtn absolute mb-12 mt-8 bg-danger text-white bg-blue-500 hover:bg-blue-700 text-white font-bold py-4 px-5 rounded">
				</form>	
	 		</div>
		   </div>
<!-- 회원탈퇴  -->
<div id="deleteFrm"class="modal w-full h-screen bg-black opacity-100 fixed top-0 hidden m-0 m-auto">
	<form class="bg-white h-auto mt-32 w-3/12 m-0 m-auto" action="<%=projectPath%>/mypage/user_del.do">
		<div class="close text-black inline-block text-xl top-0 left-0 p-4 cursor-pointer">
			<i class="xi-close"></i>
		</div>
		<br /> <label class="text-3xl font-bold ml-12 mt-8">회원탈퇴</label>
		<div class="md:w-3/4  mt-4 m-0 m-auto">
			<input name="user_name" class="bg-gray-200 appearance-none border-2 border-info rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-info-dark"type="text" placeholder="이름"><br />
		</div>
		<div class="md:w-3/4  mt-4 m-0 m-auto">
			<input name="user_id" class="bg-gray-200 appearance-none border-2 border-info rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-info-dark"type="text" placeholder="아이디">
		</div>
		<div class="md:w-3/4  mt-4 m-0 m-auto">
			<input name="user_pw" class="bg-gray-200 appearance-none border-2 border-info rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-info-dark"id="modalDelPwChk" type="password" placeholder="비밀번호">
		</div>
		<div class="md:w-3/4  mt-4 m-0 m-auto">
			<input class="bg-gray-200 appearance-none border-2 border-info rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-info-dark"id="modalDelPwChk2" type="password" placeholder="비밀번호 확인 ">
			<div id="modal-del-pw-success" class="text-success">비밀번호가 일치합니다</div>
			<div id="modal-del-pw-danger" class="text-danger">비밀번호가 일치하지 않습니다. 다시 입력해 주세요</div>
		</div>
		<input type="submit" value="탈퇴하기" class="bg-danger hover:bg-danger-dark  ml-12 w-3/4 text-white font-bold py-2 px-4 rounded mb-8 mt-8">
	</form>
</div>	
<!-- 비밀번호 변경창  -->
<div id="passwordUpdate"class="modal w-full h-screen bg-black opacity-100 fixed top-0 hidden m-0 m-auto">
	<form class="bg-white h-auto mt-32 w-3/12 m-0 m-auto" action="<%=projectPath%>/mypage/pwEditOk.do">
		<div class="close text-black inline-block text-xl top-0 left-0 p-4 cursor-pointer"><i class="xi-close"></i></div><br/>
		<label class="text-3xl font-bold ml-12 mt-8">비밀번호 변경</label>
		<div class="md:w-3/4  mt-4 m-0 m-auto">
			<input value='${vo.user_id }' name="user_id" class="bg-gray-200 appearance-none border-2 border-info rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-info-dark" type="hidden" placeholder="아이디">
		</div>
		<div class="md:w-3/4  mt-4 m-0 m-auto">
			<input name="user_pw" class="bg-gray-200 appearance-none border-2 border-info rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-info-dark"id="modalPwChk" type="password" placeholder="변경비밀번호">
		</div>
		<div class="md:w-3/4  mt-4 m-0 m-auto">
			<input class="bg-gray-200 appearance-none border-2 border-info rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-info-dark"id="modalPwChk2" type="password" placeholder="변경비밀번호 확인">
			<label id="subText" class="text-gray text-xs">영문, 숫자, 특수문자를 조합한 8자이상</label><br/>
			<div id="modal-pw-success"  class="text-success">비밀번호가 일치합니다</div>
			<div id="modal-pw-danger" class="text-danger">비밀번호가 일치하지 않습니다. 다시 입력해 주세요</div>
		</div>
		<input type="submit" value="변경" id="mcBtn"class="bg-danger hover:bg-danger-dark  ml-12 w-3/4 text-white font-bold py-2 px-4 rounded mb-8 mt-8">
	</form>
</div>
</body>
</html>