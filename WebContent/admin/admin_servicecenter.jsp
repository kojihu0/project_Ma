<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String adminPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서비스센터 QNA</title> 
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<link href="<%=adminPath %>/lib/css/tailwind.css" rel="stylesheet" type="text/css"/>
	<link href="<%=adminPath %>/lib/css/slick-theme.css" rel="stylesheet" type="text/css"/>
	<link href="<%=adminPath %>/lib/css/slick.css" rel="stylesheet" type="text/css"/>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="<%=adminPath %>/lib/js/jquery-ui.min.js"></script> 
	<script src="<%=adminPath %>/lib/js/datepicker-ko.js"></script>
	<script src="<%=adminPath %>/lib/js/jquery.number.min.js"></script>
	<script src="<%=adminPath %>/lib/ckeditor/ckeditor.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/clipboard@2/dist/clipboard.min.js"></script>

   <!--css-->

   <!--js-->
   


<script>
var qna = 1;
$(function(){ 
	function qnaLoading(){
		var url ="<%=adminPath%>/admin/admin_servicecenterAjax.do";
	
		$.ajax({
			url : url,
			data : "pageNum="+qna,
			success: function(result){
				
				var tag1= result.indexOf("<hr id='zzz'>");
				var tag2= result.indexOf("<hr id='dddd'>");
				var tag3= result.substring(tag1 + 13,tag2);
				
				console.log("뭐가 문제일까?");
				
				$(".viewDiv").html(tag3); 
	 
			},  
			error: function(){ 
				console.log("게시판 ajax 에러");
			}
		}); 
	}
	qnaLoading();
	//페이지 번호 눌렀을 때 
	$(document).on("click", '#main_QnA_page li a' ,function(e){		
		e.preventDefault(); 		
		if($(this).text()==""){ 
			if($(this).find("i").attr("class") == "xi-angle-right-min"){
				qna++;
			}
			if($(this).find("i").attr("class") == "xi-angle-left-min"){
				qna--;
			}
		}else{	
			qna = $(this).text();		
		}
		qnaLoading()
	});
});//$(document).ready(furnction(){}); end

</script>
</head>
<body>
	<header class="header p-4 bg-white text-xl border-b border-gray flex justify-between fixed w-full z-20 top-0">
		<div><span class="text-brand pr-4"><a href="admin.jsp">ChariTree</a></span>관리자 페이지</div>
		<div><c:if test="${login == 'Y' }"><a href="<%=adminPath %>/admin/admin_Logout.do" class="text-lg">로그아웃</a></c:if></div>
	</header>	
	<div class="content flex w-full"> 
		<!-- 메뉴선택 영역 -->
		<div class="bg-white h-16 fixed bottom-0 mt-12 md:relative md:h-screen z-10 w-full md:w-48 border-r border-gray"><!-- 가장 왼쪽, 메인 선택메뉴 -->
			<ul class="mt-16 p-4 w-48 fixed left-0 top-0 content-start text-left justify-between">
				<li class="border-b-2 border-gray hover:border-brand hover:text-brand p-2 m-2 leading-relaxed text-center"><a href="<%=adminPath %>/admin/admin.do">관리자 홈</a></li>
				<li class="border-b-2 border-gray hover:border-brand hover:text-brand p-2 m-2 leading-relaxed text-center"><a href="<%=adminPath %>/admin/admin_news.do">새소식 관리</a></li>
				<li class="border-b-2 border-gray hover:border-brand hover:text-brand p-2 m-2 leading-relaxed text-center"><a href="<%=adminPath %>/admin/admin_servicecenter.do">질문 관리</a></li>
			</ul>
		</div>
		<section class="flex-1 bg-gray-lightest mt-12 p-8"><!-- 해당 내용이 들어갈 부분. -->
			<div id="admin_QnA_Div"	 class="flex">
				<div class="viewDiv w-2/3">
				
				</div>
				<div class="editDiv w-1/3 pt-16 pl-8">
					<form method="post" action="<%=adminPath %>/admin/admin_servicecenter.do">
						<div class="mb-4">
							<input type="text" name="title" id="title" placeholder="제목" class="appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline" value="${vo.service_title }"/>
							<input type="hidden" name="service_no" value="${vo.service_no}"/>
						</div>
						<div class="border border-gray mb-4">${vo.service_content}</div>	
						<textarea name="answerContent" class="appearance-none border border-gray rounded w-full h-24 py-2 px-3 leading-tight focus:outline-none focus:shadow-outline"></textarea>
						<input type="submit" value="등록" class="bg-brand hover:bg-brand-dark text-white font-bold py-2 px-4 rounded"/>
					</form> 
				</div>
			</div>	
		</section>
	</div>

</body>
</html>