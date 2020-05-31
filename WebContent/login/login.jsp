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

$(function(){
	 var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
	 $("input[name='user_id']").val(userInputId); 
	  
	 if($("input[name='user_id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
		 // 아이디 저장하기 체크되어있을 시,
	     $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	 }
	  
	 $("#idSaveCheck").change(function(){ // 체크박스에 변화가 발생시
	     if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	         var userInputId = $("input[name='user_id']").val();
	         setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	     }else{ // ID 저장하기 체크 해제 시,
	         deleteCookie("userInputId");
	     }
	 });
	  
	 // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	 $("input[name='user_id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	     if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	         var userInputId = $("input[name='user_id']").val();
	         setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	     }
	 });
	});
	
	function setCookie(cookieName, value, exdays){
	 var exdate = new Date();
	 exdate.setDate(exdate.getDate() + exdays);
	 var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	 document.cookie = cookieName + "=" + cookieValue;
	}
	
	function deleteCookie(cookieName){
	 var expireDate = new Date();
	 expireDate.setDate(expireDate.getDate() - 1);
	 document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	
	function getCookie(cookieName) {
	 cookieName = cookieName + '=';
	 var cookieData = document.cookie;
	 var start = cookieData.indexOf(cookieName);
	 var cookieValue = '';
	 if(start != -1){
	     start += cookieName.length;
	     var end = cookieData.indexOf(';', start);
	     if(end == -1)end = cookieData.length;
	     cookieValue = cookieData.substring(start, end);
	 }
	 return unescape(cookieValue);
}
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
					    		<input type="checkbox" class=" w-5 h-5" id="idSaveCheck">
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
							<div id="naver_id_login"></div>
								<script type="text/javascript"
										src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
										charset="utf-8"></script>
								
								<script type="text/javascript">
										var clientId = "XIjSOZY8lBjfkXq5jWmK";
										var callbackUrl = "http://localhost:9090/project_Ma/login/callBack.do";
										var naver_id_login = new naver_id_login(clientId, callbackUrl);
										var state = naver_id_login.getUniqState();
										naver_id_login.setButton("white", 3, 40);
										naver_id_login.setDomain("localhost:9090/project_Ma/index.do");
										naver_id_login.setState(state);
										//naver_id_login.setPopup();
										naver_id_login.init_naver_id_login();
								</script>

							 <a id="kakao-login-btn" class="flex ml-3"></a>
  							<a href="http://developers.kakao.com/logout"></a>
							<script type='text/javascript'>
							Kakao.init('3201485c8b4e41d0146e1bf9eceada34'); //아까 카카오개발자홈페이지에서 발급받은 자바스크립트 키를 입력함
							//카카오 로그인 버튼을 생성합니다. 
							Kakao.Auth.createLoginButton({ 
							    container: '#kakao-login-btn', 
							    success: function(authObj) { //authObj가 참일때, 자료를 성공적으로 보냈을때 출력되는 부분
							           Kakao.API.request({
							               url: '/v2/user/me',
							               success: function(res) { //res가 참일때, 자료를 성공적으로 보냈을때 출력되는 부분
							                     console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)			 
							                     console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)						 
							                     console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 						                             
							                     // res.properties.nickname으로도 접근 가능 )
							                     console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력					         
							          var kakaonickname = res.properties.nickname;    //카카오톡 닉네임을 변수에 저장
							          var kakaoe_mail = res.properties.kaccount_email;    //카카오톡 이메일을 변수에 저장함
							          //카카오톡의 닉네임과,mail을 url에 담아 같이 페이지를 이동한다.
							          location.href="<%=projectPath%>/index.do?user_id="+kakaonickname+"&kakaoe_mail="+kakaoe_mail;						      
							                   }
							                 })
							               },
							               fail: function(error) { //에러 발생시 에러 메시지를 출력한다.
							                 alert(JSON.stringify(error));
							               }
							             });
							</script>
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
						<img class="slide1" src="../img/dokdo2.jpg"/>
						<img class="slide1" src="../img/culture2.jpg"/>
						<img class="slide1" src="../img/women_in_war2.jpg"/>
					</div>
				</div><!----------------- 광고 창 끝 ----------------------------------->
			</div>


</body>
</html>