<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var clientId = "XIjSOZY8lBjfkXq5jWmK";
  var callbackUrl = "http://localhost:9090/project_Ma/login/callBack.do";
  var naver_id_login = new naver_id_login(clientId, callbackUrl);


  
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	  
	  var name = naver_id_login.getProfileData('name');

      location.href="<%=projectPath%>/index.do?name="+ name;
  }
</script>
</body>
</html>