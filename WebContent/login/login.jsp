<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<script>
   $(function(){S
      $("#loginFrm").submit(function(){
         if($("#userid").val()==""){
            alert("아이디를 입력해주세요.");
            return false;
         }
         if($("#password").val()==""){
            alert("비밀번호를 입력해주세요.");
            return false;
         }
      });
   });
   
</script>
<body>

         <div class="w-full max-w-screen-xl my-24 mx-auto flex flex-wrap">
            <div class="w-1/2"><!----------------------- 로그인  --------------------------------------------->
               <div class="text-4xl">로그인</div>
               <div class="w-full max-w-lg">
                 <form class="bg-white rounded px-8 pt-6 pb-8 mb-4" method="post" action="<%=projectPath%>/login/loginOk.do" id="loginFrm">
                   <div class="mb-4">
                     <label class="block text-gray-700 text-sm font-bold mb-2" for="user_id">
                          아이디
                     </label>
                     <input class="border rounded w-full py-2 px-3 text-gray-700 leading-tight h-12" name="user_id" id="user_id" type="text" placeholder="아이디">
                   </div>
                   <div class="mb-6">
                     <label class="block text-gray-700 text-sm font-bold mb-2" for="user_pw">
                          비밀번호
                     </label>
                     <input class="border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight h-12" name="user_pw" id="user_pw" type="password" placeholder="비밀번호">
                   </div>
                   <div class="flex items-center justify-between">
                      <label class="inline-flex items-center">
                         <input type="checkbox" class=" w-5 h-5">
                         <span>아이디 저장</span>
                      </label>
                     <a class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800 hover:text-gray" href="<%=projectPath%>/login/find_Id.do">
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
                     <a class="inline-block align-baseline font-bold text-sm hover:text-gray mx-10 underline" href="<%=projectPath%>/joinMembership/join_MembershipSelect.do">
                          일반 회원가입
                        </a>
                        <a class="inline-block align-baseline font-bold text-sm hover:text-gray mx-10 underline" href="<%=projectPath%>/joinMembership/join_Coporate.do">
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