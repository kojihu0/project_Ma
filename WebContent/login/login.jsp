<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<meta charset="UTF-8">
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>login</title>
</head>
<script type="text/javascript">
	$(function(){
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
							<div id="naver_id_login" class="flex mr-3" ></div> 
							<script type="text/javascript">
								  	var naver_id_login = new naver_id_login("V8e0tffyN2T8QLyH9O3w", "http://=localhost:9090/login.do");
								  	var state = naver_id_login.getUniqState();
								  	naver_id_login.setButton("white", 2,40);
								  	naver_id_login.setDomain("http://127.0.0.1:9090/login.do");
								  	naver_id_login.setState(state);
								  	naver_id_login.setPopup();
								  	naver_id_login.init_naver_id_login();
  							</script>
							 <a id="kakao-login-btn" class="flex ml-3"></a>

							<script type='text/javascript'>
							  //<![CDATA[
							    // 사용할 앱의 JavaScript 키를 설정해 주세요.
							    Kakao.init('3201485c8b4e41d0146e1bf9eceada34');  //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
							    // 카카오 로그인 버튼을 생성합니다.
							   Kakao.Auth.createLoginButton({
							   container: '#kakao-login-btn',
							   success: function(authObj) {
							     Kakao.API.request({
							       url: '/v1/user/me',
							       success: function(res) {
							      		console.log(res);
							      		var email = res.kakao.account.email;
							      		var name = res.properties.nickname;
							      		console.log(email);
							      		console.log(name);
							           }
							         })
							       },
							       fail: function(error) {
							         alert(JSON.stringify(error));
							       }
							     });
							    console.log(authObj);
							    var token = authObj.access_token;
							  //]]>
							</script>
						 </div>
						<div class="flex justify-center">
							<a class="inline-block align-baseline font-bold text-sm hover:text-gray mx-10 underline" href="<%=projectPath%>/joinMembership/join_MembershipSelect.do">
					      	  일반 회원가입
					         </a>
					         <a class="inline-block align-baseline font-bold text-sm hover:text-gray mx-10 underline" href="<%=projectPath%>/joinMembership/join_Corporate.do">
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