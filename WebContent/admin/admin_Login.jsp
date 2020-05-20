<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어드민 로그인</title>
</head> 
<body>
	<div class="w-full max-w-screen-xl my-0 mx-auto border justify-center">
		<div>
			<div class="text-4xl">로그인</div> 
				<div class="w-full max-w-lg">
					<form class="bg-white rounded px-8 pt-6 pb-8 mb-4">
						<div class="mb-4">
							<label class="block text-gray-700 text-sm font-bold mb-2" for="username">아이디</label>
						      <input class="border rounded w-full py-2 px-3 text-gray-700 leading-tight h-12" id="username" type="text" placeholder="아이디">
						</div>
						<div class="mb-6">
							<label class="block text-gray-700 text-sm font-bold mb-2" for="password">비밀번호</label>
						    <input class="border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight h-12" id="password" type="password" placeholder="비밀번호">
						</div>
						<button class="text-white font-bold py-2 px-4 rounded bg-danger w-full my-8 h-12">로그인</button>
					</form>
				</div>
		</div> 
	</div>
</body>
</html>