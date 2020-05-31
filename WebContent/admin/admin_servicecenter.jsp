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

	<header class="header p-4 my-4 bg-danger text-xl text-white">
		<span class="danger"><a href="admin.jsp">ChariTree</a></span>&nbsp;&nbsp;관리자 페이지
		<c:if test="${login == 'Y' }">
			<a href="<%=adminPath %>/admin/admin_Logout.do">로그아웃</a>
		</c:if>
	</header>
	<div class="content flex"> 
		
		<!-- 메뉴선택 영역 -->
		<div class="flex-initial"><!-- 가장 왼쪽, 메인 선택메뉴 -->
			<ul>
				<li class="hover:bg-danger-dark p-4 m-2 leading-relaxed text-xl border-b text-white bg-danger rounded text-center"><a href="<%=adminPath %>/admin/admin.do">관리자 홈</a></li>
				<li class="hover:bg-danger-dark p-4 m-2 leading-relaxed text-xl border-b text-white bg-danger rounded text-center"><a href="<%=adminPath %>/admin/admin_news.do">새소식 관리</a></li>
				<li class="hover:bg-danger-dark p-4 m-2 leading-relaxed text-xl border-b text-white bg-danger-dark rounded text-center"><a href="<%=adminPath %>/admin/admin_servicecenter.do">질문 관리</a></li>
			</ul>
		</div>

		
		<section class="border flex-initial h-128"><!-- 해당 내용이 들어갈 부분. -->
			<div id="admin_QnA_Div"	 class="flex">

					<div class="viewDiv w-2/3">
					
					</div>
					
					<div class="editDiv w-1/3">
							<form method="post" action="<%=adminPath %>/admin/admin_servicecenter.do">
								<input type="text" name="title" id="title" class="border" value="${vo.service_title }"/> <br/>
								<input type="hidden" name="service_no" value="${vo.service_no }"/>
								<div class="border rounded">${vo.service_content }</div>						
							
								<textarea rows="10" cols="30" name="answerContent"></textarea>
							
								<input type="submit" value="등록" class="hover-danger-dark bg-danger text-white"/>
							</form> 
					</div>


			</div>	
		</section>
	</div>

</body>
</html>