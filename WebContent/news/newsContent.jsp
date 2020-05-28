<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>newsContent</title>
</head>
<body>

	<div class="document w-full max-w-screen-xl my-0 mx-auto py-16">
				<div class="document-header pb-8 border-b-2 border-gray">
					<h1 class="mb-4 font-bold">${nVo.news_title}</h1>
					<div class="flex">
						<div class="mr-8"><span class="font-bold mr-2">작성자 : </span>${nVo.user_id }</div>
						<div><span class="font-bold mr-2">작성일 : </span>${nVo.news_date }</div> 
					</div>
				</div>
				<div class="document-content mx-4 py-8">
					<img src="<%=projectPath %>/img/${nVo.news_img}">
					<p>${nVo.news_content }</p>
				</div>
				<div class="document-footer">
					<div class="share text-2xl text-gray-darker my-4 text-right">
						<button title="페이스북에 공유하기" data-sns="facebook" data-url="charitree.fezze.name" class="btn-share-sns inline-block w-8 h-10 leading-10 text-center hover:text-brand duration-300"><i class="xi-facebook"></i></button>
						<button title="카카오톡에 공유하기" data-sns="kakaotalk" data-url="charitree.fezze.name" data-text="ChariTree" class="btn-share-sns inline-block w-8 h-10 leading-10 text-center hover:text-brand duration-300"><i class="xi-kakaotalk"></i></button>
						<button title="트위터에 공유하기" data-sns="twitter" data-url="charitree.fezze.name" data-text="ChariTree" class="btn-share-sns inline-block w-8 h-10 leading-10 text-center hover:text-brand duration-300"><i class="xi-twitter"></i></button>
						<button title="URL 복사" data-clipboard-text="https://charitree.fezze.name" class="copy_url inline-block w-8 h-10 leading-10 text-center hover:text-brand duration-300"><i class="xi-link"></i></button>
					</div>
					<hr/>
					<div>   
						<c:if test="${pnVo.leadSubject != '이전글' }">
							<span class="block bg-brand text-white py-2 px-4">이전글 </span> : 
							<a href="<%=projectPath%>/news/newsContent.do?news_no=${pnVo.leadNo}&news_category=${nVo.news_category}">${pnVo.leadSubject }</a><br/>
						</c:if> 
						<c:if test="${pnVo.lagSubject != '다음글' }">
							<span class="block bg-brand text-white py-2 px-4">다음글</span> :  <a href="<%=projectPath%>/news/newsContent.do?news_no=${pnVo.lagNo}&news_category=${nVo.news_category}">${pnVo.lagSubject }</a>
						</c:if>
						
						<c:if test="${nVo.news_category == 1 }">
								<a class="block bg-brand hover:bg-brand-dark text-white py-2 px-4" href="<%=projectPath %>/news/notice.do">공지사항</a>
							</c:if>
							
							<c:if test="${nVo.news_category == 3 }">
								<a class="block bg-brand hover:bg-brand-dark text-white py-2 px-4" href="<%=projectPath %>/news/article.do">보도자료</a>
							</c:if>
							
							<c:if test="${nVo.news_category == 2 }">
								<a class="block bg-brand hover:bg-brand-dark text-white py-2 px-4" href="<%=projectPath %>/news/event.do">이벤트</a>
							</c:if>
					</div>	
				</div>
			</div>
				
			<!-- 위로 이동 -->  
			<div class="page_up_div text-2xl border border-gray text-center rounded h-12 w-12 bg-black opacity-75 text-white">
					<a id="scrollToTop" class="align-middle" href="#"><i class="xi-angle-up"></i></a>  
			</div>   

</body>
</html>