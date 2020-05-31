<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String adminPath = request.getContextPath(); %>

<hr id='zzz'>
	<script>
		$(function(){
			   $("a.main-qna-title").on('click', function(e){
			        e.preventDefault();
			        $($(this).attr('href')).toggleClass('hidden');
			   });		   
		});//end
	</script>

		<div class="campaign-qna-wrapper w-full"> 
			<div class="table table-fixed w-full text-center font-bold border-b-2 border-gray">
				<div id="answer" class="table-cell w-24 p-4">답글쓰기</div>
				<div id="offPos" class="border table-cell w-64 p-4">답변여부</div>
				<div class="table-cell p-4">제 목</div>
				<div class="table-cell w-24 p-4">작성자</div>
				<div class="table-cell w-32 p-4">등록일</div>
			</div>
			<ul id="camPos" class="campaign-qna-list w-full">
				<!-- 여기에 내용이 보여야 하는데 -->
				<c:forEach  var="sList" items="${selectAllList}">	
					<li>
							<div class="qna-container table table-fixed w-full text-center border-b border-gray">
								<form id="eidtInfo" method="get" action="<%=adminPath%>/admin/admin_servicecenter.do" class="">
									<div class="table-cell p-4 px-8 w-16 text-left">
										<input class="hover-danger-dark bg-danger text-white" type="submit" value="답변달기">
									</div>
								
									<c:if test="${sList.a_id == null }">
										<div class=" table-cell w-48 p-4">미답</div> 
									</c:if>
									<c:if test="${sList.a_id != null}">
										<div class=" table-cell w-24 p-4 text-danger">답변완</div>
									</c:if>
									<c:if test="${sList.service_secret == 0 }"> 
										<div class=" table-cell p-4 px-8 text-left"><a class="main-qna-title" href="#qna${sList.service_no }">${sList.service_title}</a></div>
										<input type="hidden" class="qNo" name="qNo" value="${sList.service_no }"/>					
									</c:if>
									<c:if test="${sList.service_secret == 1 }"> 
										<div class=" w-48 table-cell p-4 px-8 text-left"><a class="main-qna-title" href="#qna${sList.service_no }"><i class="xi-lock-o"></i></a></div>
										<input type="hidden" class="qNo" name="qNo" value="${sList.service_no }"/>
									</c:if>
									<div class="table-cell w-32 p-4">${sList.user_id }</div> 
									<div class="table-cell w-32 p-4">${sList.service_regi }</div>
								</form>	
							</div>
							<div id="qna${sList.service_no }" class="qna-content px-8 bg-gray-lightest pl-24 border-b border-gray hidden">
								<div class="qna-user py-4 border-b border-gray">${sList.service_content}</div> 
								<div class="qna-reply py-4 pl-8 relative">
									<c:if test="${sList.a_id != null }">
										<span class="absolute left-0 text-lg"><i class="xi-subdirectory-arrow"></i></span>
										<span>${sList.a_title }</span>
										<div class="comment-author font-bold pb-4 mb-4 text-success border-b border-gray border-dashed">${sList.a_id}<span class="text-gray-dark text-sm font-normal ml-4">${sList.a_regi }</span></div>
										<div class="comment-text text-gray-darkest">${sList.a_content }</div>
									</c:if>
								</div>
							</div>
					</li>		
					</c:forEach>
								
			</ul>
		
		</div>
		  
	<ul id="main_QnA_page" class="pagenation flex items-center justify-center my-4">
		<!-- prev -->
		<li class="page-item"> 
			<c:if test="${pVo.pageNum == 1 }">
				<a class="page-link block py-1 px-2 hover:text-danger pointer-events-none" href=""><i class="xi-angle-left-min"></i></a>
			</c:if> 
			<c:if test="${pVo.pageNum > 1 }">
				<a class="page-link block py-1 px-2 hover:text-danger" href="<%=adminPath%>/admin/admin_servicecenter.do?pageNum=${pVo.pageNum - 1}"><i class="xi-angle-left-min"></i></a>
			</c:if>	
		</li>
		<!-- 페이지 수 -->
		<c:forEach var="i" begin="${pVo.startPage }" end="${pVo.startPage + pVo.pageCount - 1 }">
			<c:if test="${i <= pVo.totalPage }">  
				<li class="page-item acitve"><a class="pn page-link block py-1 px-2 hover:text-brand text-black" href="<%=adminPath%>/admin/admin_servicecenterAjax.do?pageNum=${i}"<c:if test="${i == pVo.pageNum }">style='color:red'</c:if>>${i}</a></li>
			</c:if>
		</c:forEach>	
		<!-- next -->
		<li class="page-item">
			<c:if test="${pVo.pageNum == pVo.totalPage}">
				<a class="page-link block py-1 px-2 hover:text-danger pointer-events-none" href=""><i class="xi-angle-right-min"></i></a>
			</c:if>
			<c:if test="${pVo.pageNum < pVo.totalPage}">  
				<a class="page-link block py-1 px-2 hover:text-danger" href="<%=adminPath%>/admin/admin_servicecenter.do?pageNum=${pVo.pageNum + 1}"><i class="xi-angle-right-min"></i></a>
			</c:if>		
		</li>
	</ul>							
<hr id='dddd'>