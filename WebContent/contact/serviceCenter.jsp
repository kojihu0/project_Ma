<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>serviceCenter</title>
</head>
<body>
				<!-----------------페이지 내용-----------------> 
			<p class="main_title">고객센터</p> 
			<hr class="border"/>  
				<div id="siteReisterBanner" class="my-8 w-full max-w-screen-xl my-0 mx-auto border-solid border-4 border-brand-dark ">
					<div id="banner_ment_01" class="">
						<a href="#"><span>ChariTree</span>에서 당신을 기다립니다.</a> 
					</div>      
					<div id="banner_ment_02" class="">
						<a href="#">여러분의 따스한 관심을 나누어주세요.</a> 
					</div>    
					<a href="#">
						<input type="button" id="resisterInput" class="bg-danger hover:bg-danger-light text-white font-bold py-2 px-4 border border-danger rounded" value="바로가기"/>
					</a>  
				</div><!-- siteReisterBanner end -->   
			   
     		<div class="modal  w-full bg-gray-lightest">
				<div class="repeatQuestion">자주하시는 질문들</div>
				<div id="questionDiv" class="max-w-screen-xl my-0 mx-auto bg-gray-lightest"> 	
			<!-- 자주묻는 질문창 -->        
			 	<div class="accordion-box">  
			 		<ul>           
			 			<li>      
			 				<p class="title my-2 cursor-pointer">
			 					<i class="xi-quicktime"></i>
			 					<span>캠페인 제출 전입니다. 어떠한 경우에 진행이 가능할까요?</span> 
			 				</p>   
 			 				<div class="answer border rounded-lg"> 
			 					캠페인 진행 가능 여부를 파악하기 위해서는 두 가지 사항을 스토리에 작성하신 후 제출 해 주시면 됩니다.<br/>
			 					1. 해당 캠페인이 정식적으로 인가된 캠페인인지의 여부<br/>
			 					2. 리워드의 유무 및 존재한다면 그 완성도.<br/>
			 					위의 내용을 반영 하여 캠페인을 제출해주시면, 진행 가능 여부에 관해 심사 당당자에게서 보다 정확한 답변을 들을 수 있습니다.
			 				</div>  
			 			</li> 
			 		</ul>
			 	</div>
			 	<div class="accordion-box">  
			 		<ul>           
			 			<li>      
			 				<p class="title my-2 cursor-pointer">
			 					<i class="xi-quicktime"></i>
			 					<span>반드시 제출해야하는 서류는 무엇이 있을까요?</span> 
			 				</p>   
 			 				<div class="answer border rounded-lg"> 
			 					필수 서류는 제출 시점에 따라서 크게 두 가지 종류로 나누어 집니다. <br/>
			 					1. 심사 시 제출 하셔야 하는 서류 : 캠페인 기획서, 법인 증명서, 사업자 등록증 사본, 캠페인 스토리 증빙자료<br/>
			 					2. 리워드 상품이 있을 시 제출 해야 하는 서류 : 리워드 상품 설명서 등
			 					 	
			 					
			 				</div> 
			 			</li> 
			 		</ul>
			 	</div>
			 	<div class="accordion-box"> 
			 		<ul>           
			 			<li>      
			 				<p class="title my-2 cursor-pointer">
			 					<i class="xi-quicktime"></i>
			 					<span>작성한 스토리에 수정이 필요하다고 합니다. 어떠한 이유 때문일까요?</span> 
			 				</p>   
 			 				<div class="answer border rounded-lg"> 
			 					ChariTree 펀딩의 심사팀에서는 리워드와 관련된 법률, 지정고시, 심사 지침에 근거하여 가족님께서<br/>
			 					무사히 캠페인을 진행 하실 수 있도록 스토리 수정을 요청하고 잇습니다.<br/>
			 					심사 담당자가 보내드린 피드백에서 수정이 필요한 이유를 자세히 안내해드리고 있사오니<br/>
			 					참고 부탁드립니다.
			 					
			 				</div> 
			 			</li> 
			 		</ul>
			 	</div> 
			 	<div class="accordion-box"> 
			 		<ul>            
			 			<li>      
			 				<p class="title my-2 cursor-pointer">
			 					<i class="xi-quicktime"></i>
			 					<span>이미 누군가 진행했던 캠페인도 가능한가요?</span> 
			 				</p>   
 			 				<div class="answer border rounded-lg">
 			 					불가능 합니다. 국내 뿐 아니라 타 국내 캠페인들 중 진행된 이력이 있다면 성공 여부와 관계없이 캠페인을 진행<br/>
 			 					하실 수 없습니다.
 			 				</div> 
			 			</li> 
			 		</ul>
			 	</div>
			 	<div class="accordion-box"> 
			 		<ul>           
			 			<li>      
			 				<p class="title my-2 cursor-pointer">
			 					<i class="xi-quicktime"></i>
			 					<span>심사 담당자의 피드백 외의 부분도 수정하고 싶습니다. 가능할까요?</span> 
			 				</p>   
 			 				<div class="answer border rounded-lg"> 
 			 					불가능 합니다. 시스템 상, 피드백 부분을 수정하신 뒤 제출하신다면, 그 이후 피드백 시 추가 수정 권한을 드릴 수 있습니다.
 			 				</div> 
			 			</li> 
			 		</ul> 
			 	</div> 
			 	
			 	
			 <div class="middle_Box flex max-w-screen-xl my-0 mx-auto bg-gray-lightest">  
			  	<div class="middle_card flex-initial rounded text-center shadow-lg">
  						<div class="middle_img_box"><img class="middle_img" src="../img/email_01.png" alt="이메일 문의"></div>
  				<div class="px-6 py-4 mx-0 auto">  
    					<div class="font-bold text-xl mb-2">test@test.or.kr</div>
   						<p class="text-gray-700 text-base">
   							<span class="font-bold">가입 및 일반 문의</span><br/> 	
      						평일 10:00~18:00<br/>  
							주말 및 공휴일 휴무
    					</p> 
  				</div> 
 				 	<div class="px-6 py-4">
	  		  			<span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2">#email</span>
	  				</div>
				</div>
				  
				<div class="middle_card flex-initial rounded text-center shadow-lg">
  						<div class="middle_img_box"><img class="middle_img" src="../img/telephone_01.png" alt="이메일 문의"></div>
  				<div class="px-6 py-4 mx-0 auto">  
    					<div class="font-bold text-xl mb-2"> 02-0000-0000</div>
   						<p class="text-gray-700 text-base">
   							<span class="font-bold">법인 등록 문의</span><br/>
      						평일 10:00~18:00<br/> 
							주말 및 공휴일 휴무 
    					</p>
  				</div>
 				 	<div class="px-6 py-4">
	  		  			<span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2">#Tel</span>
	  				</div>
				</div>
			 </div>
			 	
			 	
			 	
		</div>   
	</div>    	 
			<span class="repeatQuestion my-16">질문작성하기</span><br/>
			<div id="noticebordDiv" class="my-16 border-gray max-w-screen-xl my-0 mx-auto">
			    <div class="questionBox">         	    
				  	<hr/> 

				  	<div id="qna" class="tab-content-item"><!--문의-->
								<h1 class="my-4">Q&A</h1>
								<div>
									<form method="post" action="serviceCenter.do" class="campaign-qna-form">
										<div class="mb-4">
											<input type="text" name="qna_title" id="qna_title" placeholder="제목" class="appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline bg-gray-lightest">
										</div>
										<div class="mb-4">
											<textarea name="qna_question" id="qna_question" placeholder="로그인해야 문의 작성이 가능합니다." class="appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline h-24 bg-gray-lightest"></textarea>
										</div>
										<div class="text-right mb-4"> 
											<label for="is_secret" class="mr-4"><span class="mr-2">비밀글</span><input type="checkbox" name="is_secret" id="is_secret"/></label>
											<input type="submit" value="등록" class="bg-brand hover:bg-brand-dark text-white font-bold py-2 px-4 rounded"/>
										</div>
									</form>
								</div>
								
								
									<div class="campaign-qna-wrapper w-full">
										<div class="table table-fixed w-full text-center font-bold border-b-2 border-gray">
											<div class="table-cell w-24 p-4">답변여부</div>
											<div class="table-cell p-4">제 목</div>
											<div class="table-cell w-24 p-4">작성자</div>
											<div class="table-cell w-32 p-4">등록일</div>
										</div>
								
										
											<ul class="campaign-qna-list w-full">
											<c:forEach var="sList" items="${selectAllList}">
												<li>
													<div class="qna-container table table-fixed w-full text-center border-b border-gray">
														<c:if test="${sList.a_id == null }">
															<div class="table-cell w-24 p-4">미답</div>
														</c:if>
														<c:if test="${sList.a_id != null}">
															<div class="table-cell w-24 p-4 text-danger">답변완</div>
														</c:if>
														<c:if test="${sList.service_secret == 0 }"> 
															<div class="table-cell p-4 px-8 text-left"><a class="main-qna-title" href="#qna${sList.service_no }">${sList.service_title}</a></div>
														</c:if>
														<c:if test="${sList.service_secret == 1 }"> 
															<div class="table-cell p-4 px-8 text-left"><a class="main-qna-title" href="#qna${sList.service_no }"><i class="xi-lock-o"></i></a></div>
														</c:if>
														<div class="table-cell w-24 p-4">${sList.user_id }</div> 
														<div class="table-cell w-32 p-4">${sList.service_regi }</div>
													</div>
												<c:if test="${sList.a_id != null}"> 
													<div id="qna${sList.service_no }" class="qna-content px-8 bg-gray-lightest pl-24 border-b border-gray hidden">
														<div class="qna-user py-4 border-b border-gray">
															${sList.service_content}
														</div> 
														<div class="qna-reply py-4 pl-8 relative">
															<span class="absolute left-0 text-lg"><i class="xi-subdirectory-arrow"></i></span>
															<div class="comment-author font-bold pb-4 mb-4 text-success border-b border-gray border-dashed">${sList.a_id}<span class="text-gray-dark text-sm font-normal ml-4">${sList.a_regi }</span></div>
															<div class="comment-text text-gray-darkest">
																${sList.a_content }
															</div>
														</div>
													</div>
												</c:if>	 
												</li>
											</c:forEach>		
											</ul>
									</div>
									
								<ul class="pagenation flex items-center justify-center my-4">
									<li class="page-item disabled">
										<a class="page-link block py-1 px-2 hover:text-brand pointer-events-none" href="#">
											<i class="xi-angle-left-min"></i>
										</a>
									</li>
									<!-- 페이지 수 -->
									<c:forEach var="i" begin="${pVo.startPage }" end="${pVo.startPage + pVo.pageCount - 1 }">
										<c:if test="${i <= pVo.totalPage }">  
											<li class="page-item acitve">
												<a class="page-link block py-1 px-2 hover:text-brand text-brand" href="<%=projectPath%>/contact/serviceCenter.do?pageNum=${i}">
													${i }
												</a>
											</li>
										</c:if>
									</c:forEach>	
									<li class="page-item">
										<a class="page-link block py-1 px-2 hover:text-brand" href="#">
											<i class="xi-angle-right-min"></i>
										</a>
									</li>
								</ul>
					</div><!--문의-->
				</div>  
			</div>	 
</body>
</html>