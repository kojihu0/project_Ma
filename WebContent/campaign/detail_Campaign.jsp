<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<div class="w-full bg-gray-lightest">
		<div class="w-full max-w-screen-xl my-0 mx-auto px-8 xl:px-0 py-8"><!-- 상세페이지 -->
			<div class="w-full flex mb-4"><!-- 상단 -->
				<div class="flex-shrink-0 w-1/2 mr-16">
					<!--슬라이더-->
					<div class="campaign-slider-wrapper relative mb-8">
						<div class="campaign-slider w-full overflow-hidden">
							<c:forTokens items="${vo.camImg}" delims="|" var="imgsrc">
							<div class="slide">
								<img src="<%=projectPath%>/img/campaign/${imgsrc}" class="object-cover w-full">
							</div>
							</c:forTokens>
						</div>
						<button class="campaign-slider-arrow prev absolute left-0 z-50 bg-black text-white"><i class="xi-angle-left-thin"></i></button>
						<button class="campaign-slider-arrow next absolute right-0 z-50 bg-black text-white"><i class="xi-angle-right-thin"></i></button>
					</div>
					<div class="campaign-slider-nav flex justify-start">
						<c:forTokens items="${vo.camImg}" delims="|" var="imgsrc">
						<div class="slider-nav-item w-1/3 h-32 px-2">
							<div class="cursor-pointer rounded overflow-hidden">
								<img alt="prd_img" src="<%=projectPath%>/img/campaign/${imgsrc}" class="object-cover w-full h-32 transform hover:scale-125 duration-300">
							</div>
						</div>
						</c:forTokens>
					</div>
					<!--슬라이더-->
				</div>
				<div class="w-1/2">
					<h1 class="mb-4 text-3xl font-bold">${vo.camTitle}</h1>
					<p class="mb-4 text-gray-dark">${vo.camDesc}</p>
					<p class="mb-4 text-2xl font-bold">${vo.camRemain}일 남음</p>
					<div class="flex justify-between items-baseline flex-grow-0 mb-2">
						<p class="inline-block text-brand"><span class="text-2xl font-bold"><fmt:formatNumber value="${vo.camTotalPrice}" pattern="#,###"/></span>원 후원</p>
						<p class="inline-block">목표금액 <fmt:formatNumber value="${vo.camGoalPrice}" pattern="#,###" />원</p>
					</div>
					<div class="progress relative bg-gray-lighter mb-4 rounded overflow-hidden">
						<div class="progress-bar absolute top-0 bottom-0 left-0 bg-brand" style="width:${vo.camPercentage}%"></div>
					</div>
					<p class="mb-4"><span class="text-2xl font-bold">${vo.camPercentage}</span>% 달성</p>
					<p class="mb-4"><span class="text-2xl font-bold">${vo.camTotalDonator}</span>명 후원</p>
					<div class="p-4 bg-brand-light text-sm">
						<p class="text-brand"><span class="font-bold mr-2">펀딩기간</span>${vo.camStart} ~ ${vo.camEnd}</p>
						<p class="text-gray-darkest">목표금액 100% 달성시에만 결제</p>
					</div>
					<!--버튼--> 
					<div class="mt-8 mb-4 flex justify-end">
						<a href="#donate" class="btn-donate bg-brand hover:bg-brand-dark text-white py-2 px-4 w-1/2 rounded inline-block text-lg text-center font-bold">후원하기</a>
						<c:if test="${wvo.wishNo=='' || wvo.wishNo==null}">
						<a id="addWishList" href="<%=projectPath%>/campaign/camWishOk.do?action=add&cam_no=${vo.camNo}" class="add-wishlist relative ml-2 bg-white border border-gray-dark text-gray-dark w-12 rounded inline-block text-2xl text-center">
							<span class="wishlist-ico align-middle"></span>
						</a>
						</c:if>
						<c:if test="${wvo.wishNo!='' && wvo.wishNo!=null}">
						<a id="addWishList" href="<%=projectPath%>/campaign/camWishOk.do?action=delete&cam_no=${vo.camNo}" class="added-this add-wishlist relative ml-2 bg-white border border-gray-dark text-gray-dark w-12 rounded inline-block text-2xl text-center">
							<span class="wishlist-ico align-middle"></span>
						</a>
						</c:if>
					</div>
					<div class="share text-2xl text-gray-darker my-4 text-right">
						<div class="inline-block w-10 h-10 leading-10 text-center mr-2"><i class="xi-share-alt"></i></div>
						<button title="페이스북에 공유하기" data-sns="facebook" data-url="" class="btn-share-sns inline-block w-8 h-10 leading-10 text-center hover:text-brand duration-300"><i class="xi-facebook"></i></button>
						<button title="카카오톡에 공유하기" data-sns="kakaotalk" data-url="" data-text="ChariTree" class="btn-share-sns inline-block w-8 h-10 leading-10 text-center hover:text-brand duration-300"><i class="xi-kakaotalk"></i></button>
						<button title="트위터에 공유하기" data-sns="twitter" data-url="" data-text="ChariTree" class="btn-share-sns inline-block w-8 h-10 leading-10 text-center hover:text-brand duration-300"><i class="xi-twitter"></i></button>
						<button title="URL 복사" data-clipboard-text="<%=request.getRequestURL() %>?no=${vo.camNo}" class="copy_url inline-block w-8 h-10 leading-10 text-center hover:text-brand duration-300"><i class="xi-link"></i></button>
					</div>
				</div>
			</div><!-- 상단 -->
			<div class="w-full flex items-start content-start"><!-- 본문 -->
				<div class="bg-white w-3/4 mt-4 mr-8 border border-gray pb-16">
					<div class="campaign-tab-nav w-full bg-white flex items-center justify-center">
						<ul class="flex items-center justify-center flex-wrap block py-8 font-bold">
							<li class="tab-item text-center mr-4 active"><a href="#story" class="inline-block py-4 px-4">스토리</a></li>
							<li class="tab-item text-center mr-4"><a href="#updates" class="inline-block py-4 px-4">새 소식</a></li>
							<li class="tab-item text-center mr-4"><a href="#beckers" class="inline-block py-4 px-4">후원자 <span class="text-brand">${fn:length(donatorLst)}</span></a></li>
							<li class="tab-item text-center mr-4"><a href="#comments" class="inline-block py-4 px-4">응원하기 <span class="text-brand">${fn:length(commentLst)}</span></a></li>
							<li class="tab-item text-center mr-4"><a href="#qna" class="inline-block py-4 px-4">Q&A</a></li>
						</ul>
						<a href="#donate" class="sticky-btn-donate inline-block bg-brand hover:bg-brand-dark text-white py-2 px-4 rounded inline-block text-lg text-center ml-4">후원하기</a>
					</div>
					<div class="campaign-tab-content px-16"><!--스토리-->
						<div id="story" class="tab-content-item active">
							<div class="story-content">
							${vo.camContent}
							</div>
							<div class="company-info bg-white mt-16">
								<h2 class="mb-4">단체·기업 정보</h2>
								<div class="flex items-center border border-gray p-4">
									<div class="company-name flex items-center w-2/5 border-r border-gray border-dashed pr-4 text-lg">
										<div class="font-bold">${vo.corpoName}</div>
									</div>
									<div class="company-detail w-3/5 pl-4">
										<div class="company-desc text-gray-darker text-sm">
											<span class="pr-4"><span class="text-black">대표자명:</span> ${vo.userName}</span>
											<span><span class="text-black">법인(사업자)번호:</span> ${vo.corpoNo}</span>
										</div>
									</div>
								</div>
							</div>
						</div><!--스토리-->
						<div id="updates" class="tab-content-item"><!--업데이트-->
						<c:if test="${fn:length(noticeLst)<=0}">
							<p class="py-8 text-center">아직 이 캠페인에 대한 업데이트 내역이 없습니다.</p>
						</c:if>
						<c:if test="${fn:length(noticeLst)>0}">
							<ul class="campaign-update">
							<c:forEach var="nvo" items="${noticeLst}">
								<li class="relative px-4 mb-8">
									<span class="round-circle"></span>
									<div class="update-title mb-4">
										<p class="text-lg font-bold">${nvo.camNoticeDate}</p>
										<h2 class="text-brand font-bold">${nvo.camNoticeTitle}</h2>
									</div>
									<div class="update-content">${nvo.camNoticeContent}</div>
								</li>
							</c:forEach>
							</ul>
							<ul class="pagenation flex items-center justify-center mx-4">
								<li class="page-item disabled"><a class="page-link block py-1 px-2 hover:text-brand pointer-events-none" href="#"><i class="xi-angle-left-min"></i></a></li>
								<li class="page-item acitve"><a class="page-link block py-1 px-2 hover:text-brand text-brand" href="#">1</a></li>
								<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">2</a></li>
								<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">3</a></li>
								<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#"><i class="xi-angle-right-min"></i></a></li>
							</ul>
						</c:if>
						</div><!--업데이트-->
						<div id="beckers" class="tab-content-item"><!--후원자-->
							<c:if test="${vo.camTotalDonator<=0}">
							<p class="py-8 text-center">이 캠페인에는 아직 후원자가 없습니다.</p>
							</c:if>
							<c:if test="${vo.camTotalDonator>0}">
							<table class="table-fixed w-full m-4 text-left">
								<thead class="text-lg">
									<tr class="border-b-2 border-gray">
										<th class="p-4 w-1/3">이름</th>
										<th class="p-4 w-1/3">후원금액</th>
										<th class="p-4 w-1/3">후원일자</th>
									</tr>
								</thead>
								<tbody class="text-gray-darkest">
								<c:forEach var="dvo" items="${donatorLst}">
									<tr class="border-b border-gray border-dashed">
										<td class="p-4">
										<c:if test="${dvo.name_anonymous==0}">${dvo.user_name}</c:if>
										<c:if test="${dvo.name_anonymous==1}">익명</c:if>
										</td>
										<td class="p-4">
										<c:if test="${dvo.price_anonymous==0}"><fmt:formatNumber value="${dvo.funding_price}" pattern="#,###"/>원</c:if>
										<c:if test="${dvo.price_anonymous==1}">공개 안 함</c:if>
										</td>
										<td class="p-4">${dvo.donate_date}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							</c:if>
						</div><!--후원자-->
						<div id="comments" class="tab-content-item"><!--응원글-->
							<h1 class="my-4">응원·의견</h1>
							<div class="mb-8">
								<c:if test="${loginStatus == null || loginStatus == '' || loginStatus =='N'}">
								<div class="bg-warning-light border-t-4 border-warning rounded-b text-teal-900 px-4 py-3 shadow-md" role="alert">
									<p class="text-warning-dark font-bold">로그인 해야 작성이 가능합니다.</p>
								</div>
								</c:if>
								<c:if test="${loginStatus != null &&  loginStatus != '' && loginStatus=='Y'}">
								<form method="POST" action="<%=projectPath%>/campaign/camCommentOk.do" onsubmit="return campaign_comment_validation()" class="campaign-comment-form">
									<label for="comment_content"></label>
									<textarea name="comment_content" id="comment_content" placeholder="캠페인에 대해 따뜻한 응원 한 마디나 의견이 있다면 여기에 작성해주세요." class="appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline h-24 bg-gray-lightest"></textarea>
									<input type="hidden" name="cam_no" value="${vo.camNo}"/>
									<div class="text-right">
										<input type="submit" value="응원하기" class="bg-brand hover:bg-brand-dark text-white font-bold py-2 px-4 rounded"/>
									</div>
								</form>
								</c:if>
							</div>
							<ul class="campaign-comment-list">
							<c:if test="${fn:length(commentLst)>0}">
								<c:forEach var="cvo" items="${commentLst}">
								<li class="mb-8">
									<c:if test="${cvo.commentParentNo == 0}">
									<div class="comment-container">
										<p class="comment-author font-bold mb-2">${cvo.userid}<span class="px-1 text-info-dark text-sm font-normal ml-2 bg-info-light">후원자</span><span class="text-gray-dark text-sm font-normal ml-4">${cvo.commentDate}</span></p>
										<div class="comment-text text-gray-darkest">${cvo.commentContent}</div>
									</div>
									</c:if>
									<c:if test="${cvo.replyCommentParentNo == cvo.commentNo}">
									<div class="comment-reply mt-4 py-4 px-8 bg-gray-lightest">
										<p class="comment-author font-bold mb-2"><i class="xi-subdirectory-arrow pr-2"></i><span class="text-success">${cvo.replyUserid}</span><span class="text-gray-dark text-sm font-normal ml-4">${cvo.replyCommentDate}</span></p>
										<div class="comment-text text-gray-darkest pl-6">${cvo.replyCommentContent}</div>
									</div>
									</c:if>
								</li>
								</c:forEach>
								<ul class="pagenation flex items-center justify-center my-4">
									<li class="page-item disabled"><a class="page-link block py-1 px-2 hover:text-brand pointer-events-none" href="#"><i class="xi-angle-left-min"></i></a></li>
									<li class="page-item acitve"><a class="page-link block py-1 px-2 hover:text-brand text-brand" href="#">1</a></li>
									<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">2</a></li>
									<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">3</a></li>
									<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">4</a></li>
									<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">5</a></li>
									<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#"><i class="xi-angle-right-min"></i></a></li>
								</ul>
								<ul id="main_QnA_page" class="pagenation flex items-center justify-center my-4">
								${pVO.totalPage}
									<!-- prev -->
									<li class="page-item"> 
										<c:if test="${pVO.pageNum == 1 }">
											<a class="page-link block py-1 px-2 hover:text-danger pointer-events-none" href=""><i class="xi-angle-left-min"></i></a>
										</c:if> 
										<c:if test="${pVO.pageNum > 1 }">
											<a class="page-link block py-1 px-2 hover:text-danger" href="<%=projectPath%>/campaign/detail_Campaign.do?cam_no=${vo.camNo}&pageNum=${pVO.pageNum - 1}"><i class="xi-angle-left-min"></i></a>
										</c:if>	
									</li>
									<!-- 페이지 수 -->
									<c:forEach var="i" begin="${pVO.startPage}" end="${pVO.startPage + pVO.pageCount - 1}">
										<c:if test="${i <= pVO.totalPage }">  
											<li class="page-item acitve"><a class="pn page-link block py-1 px-2 hover:text-brand text-black" href="<%=projectPath%>/c/serviceCenterAjax.do?pageNum=${i}"<c:if test="${i == pVO.pageNum }">style='color:red'</c:if>>${i}</a></li>
										</c:if>
									</c:forEach>	
									<!-- next -->
									<li class="page-item">
										<c:if test="${pVO.pageNum == pVO.totalPage}">
											<a class="page-link block py-1 px-2 hover:text-danger pointer-events-none" href=""><i class="xi-angle-right-min"></i></a>
										</c:if>
										<c:if test="${pVO.pageNum < pVO.totalPage}">  
											<a class="page-link block py-1 px-2 hover:text-danger" href="<%=projectPath%>/contact/serviceCenter.do?pageNum=${pVO.pageNum + 1}"><i class="xi-angle-right-min"></i></a>
										</c:if>		
									</li>
								</ul>	
							</c:if>
							<c:if test="${fn:length(commentLst)<=0}">
								<p class="py-8 text-center">아직 이 캠페인에 대한 응원·의견이 없습니다.</p>
							</c:if>
							</ul>
						</div><!--응원글-->
						<div id="qna" class="tab-content-item"><!--문의-->
							<h1 class="my-4">Q&A</h1>
							<div>
								<c:if test="${loginStatus == null || loginStatus == '' || loginStatus =='N'}">
								<div class="bg-warning-light border-t-4 border-warning rounded-b text-teal-900 px-4 py-3 shadow-md" role="alert">
									<p class="text-warning-dark font-bold">로그인 해야 작성이 가능합니다.</p>
								</div>
								</c:if>
								<c:if test="${loginStatus != null &&  loginStatus != '' && loginStatus=='Y'}">
								<form method="POST" action="<%=projectPath%>/campaign/camQnaOk.do" class="campaign-qna-form" onsubmit="return campaign_qna_validation(this);">
									<div class="mb-4">
										<input type="text" name="qna_title" id="qna_title" placeholder="제목" class="appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline bg-gray-lightest">
									</div>
									<div class="mb-4">
										<textarea name="qna_content" id="qna_question" placeholder="캠페인에 대해 궁금한 점이 있나요?" class="appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline h-24 bg-gray-lightest"></textarea>
										<input type="hidden" name="cam_no" value="${vo.camNo}">
									</div>
									<div class="text-right mb-4">
										<label for="is_secret" class="mr-4"><span class="mr-2">비밀글</span><input type="checkbox" name="qna_secret" value="1" id="is_secret"/></label>
										<input type="submit" value="등록" class="bg-brand hover:bg-brand-dark text-white font-bold py-2 px-4 rounded"/>
									</div>
								</form>
								</c:if>
								
							</div>
							<div class="campaign-qna-wrapper w-full">
								<div class="table table-fixed w-full text-center font-bold border-b-2 border-gray">
									<div class="table-cell w-24 p-4">답변상태</div>
									<div class="table-cell p-4">제목</div>
									<div class="table-cell w-24 p-4">작성자</div>
									<div class="table-cell w-32 p-4">작성일</div>
								</div>
								<c:if test="${fn:length(qnaLst)>0}">
								<ul class="campaign-qna-list w-full">
									<c:forEach var="qvo" items="${qnaLst}">
									<li>
										<div class="qna-container table table-fixed w-full text-center border-b border-gray">
											<div class="table-cell w-24 p-4">
											<c:if test="${qvo.ansQnaNo=='' || qvo.ansQnaNo==null}">미답변</c:if>
											<c:if test="${qvo.ansQnaNo!='' && qvo.ansQnaNo!=null}">답변완료</c:if>
											</div>
											<div class="table-cell py-4 px-8 text-left"><a class="qna-title block" href="#qna${qvo.qnaNo}">${qvo.qnaTitle} <span class="text-cta"><i class="xi-new"></i></span></a></div>
											<div class="table-cell w-24 p-4">${qvo.userid}</div>
											<div class="table-cell w-32 p-4">${qvo.qnaRegi}</div>
										</div>
										<div id="qna${qvo.qnaNo}" class="qna-content px-8 bg-gray-lightest pl-24 border-b border-gray hidden">
											<div class="qna-user py-4 border-b border-gray">${qvo.qnaContent}</div>
											<c:if test="${qvo.ansQnaNo!='' && qvo.ansQnaNo!=null}">
											<div class="qna-reply py-4 pl-8 relative">
												<span class="absolute left-0 text-lg"><i class="xi-subdirectory-arrow"></i></span>
												<div class="comment-author font-bold pb-4 mb-4 text-success border-b border-gray border-dashed">${qvo.ansUserid} <span class="text-gray-dark text-sm font-normal ml-4">${qvo.ansQnaRegi}</span></div>
												<div class="comment-text text-gray-darkest">${qvo.ansQnaContent}</div>
											</div>
											</c:if>
										</div>
									</li>
									</c:forEach>
								</ul>
								<ul class="pagenation flex items-center justify-center my-4">
									<li class="page-item disabled"><a class="page-link block py-1 px-2 hover:text-brand pointer-events-none" href="#"><i class="xi-angle-left-min"></i></a></li>
									<li class="page-item acitve"><a class="page-link block py-1 px-2 hover:text-brand text-brand" href="#">1</a></li>
									<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">2</a></li>
									<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">3</a></li>
									<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#"><i class="xi-angle-right-min"></i></a></li>
								</ul>
								</c:if>
								<c:if test="${fn:length(qnaLst)<=0}">
									<p class="py-8 text-center">문의글이 없습니다.</p>
								</c:if>
							</div>
						</div><!--문의-->
					</div>
				</div>
				<!--리워드-->
				
				<div id="donate" class="rewards w-1/4">
				<c:if test="${vo.camRewardStatus == 1}">
				<c:forEach var="rvo" items="${rwList}">
					<div class="reward-item relative my-4 p-8 bg-white border border-gray">
						<p class="text-lg mb-4 font-bold">${rvo.reward_price}원 후원</p>
						<div class="mb-4">
							<p class="mb-2 text-gray-darkest">${rvo.reward_name}</p>
							<p class="text-gray-dark text-sm">${rvo.reward_content}</p>
						</div>
						<div class="mb-4 text-sm">
							<p class="text-gray-dark">배송비</p>
							<p>${rvo.delivery_price}원</p>
						</div>
						<div class="mb-8 text-sm">
							<p class="text-gray-dark">리워드 발송 시작일</p>
							<p>${rvo.delivery_ex_year}년 ${rvo.delivery_ex_month}월</p>
							<p>${rvo.delivery_ex_date_detail}</p>
						</div>
						<div class="text-sm">
							<p class="text-brand mb-2">제한수량 ${rvo.reward_quantity}개 <span class="ml-2 px-2 bg-brand-light text-brand">${rvo.reward_quantity-rvo.donateCnt}개 남음</span></p>
							<p>${rvo.donateCnt}개 후원됨</p>
						</div>
						<a href="<%=projectPath %>/payment/paymentProcess.do?camNo=${vo.camNo}&reward_no=${rvo.reward_no}&reward_status=${vo.camRewardStatus}" class="overlay absolute block top-0 bottom-0 left-0 w-full bg-brand opacity-0 hover:opacity-75 duration-300">
							<span class="donate-this absolute text-white font-bold text-lg">후원하기</span>
						</a>
					</div>
				</c:forEach>
				</c:if>
				<c:if test="${vo.camRewardStatus == 0}">
					<div class="reward-item relative my-4 p-8 bg-white border border-gray">
						<p>리워드 없이 후원하기</p>
						<a href="<%=projectPath %>/payment/paymentProcess.do?camNo=${vo.camNo}&reward_status=${vo.camRewardStatus}" class="overlay absolute block top-0 bottom-0 left-0 w-full bg-brand opacity-0 duration-300">
							<span class="donate-this absolute text-white font-bold text-lg">후원하기</span>
						</a>
					</div>
				</c:if>
				</div>
				<!--리워드-->
			</div><!-- 본문 -->
		</div><!-- 상세페이지 -->
	</div>
	<script>
	$(function(){
		//폼 제출 후 탭
		var hash = window.location.hash;
		if(hash != ''){
			hash=hash.replace('#', '');
			var currentTab = $('#'+hash);
			
			//$('.campaign-tab-nav .tab-item').removeClass('active');
	        //$('.campaign-tab-content .tab-content-item').removeClass('active');

	        $("a[href='#"+hash+"']").trigger('click');
	        //$('#'+hash).addClass('active');
	        
	        //$('html,body').animate({
	        //    scrollTop: currentTab.offset().top
	        //});
		}
		
		//상단 슬라이더
		$('.campaign-slider').slick({
			infinite: true,
			slidesToShow: 1,
			slidesToScroll: 1,
			fade: true,
			prevArrow: '.campaign-slider-arrow.prev',
			nextArrow: '.campaign-slider-arrow.next',
		});

		$('.campaign-slider-nav .slider-nav-item').click(function(){
			var slideNo = $(this).index();
			$('.campaign-slider').slick('slickGoTo', slideNo);
		});
		$('.campaign-slider').on('afterChange', function(event, slick, currentSlide, nextSlide){
			var slideNo = currentSlide;
			$('.campaign-slider-nav .slider-nav-item').removeClass("active");
			$('.campaign-slider-nav .slider-nav-item').eq(slideNo).addClass('active');
		});

		//본문 탭
		var banner = $(".campaign-tab-nav");
		var stickyBanner = banner.offset().top;
		
		var sticky_banner = function(){
			if($(this).scrollTop() >= stickyBanner){
				banner.addClass('sticky');
			}
			else{
				banner.removeClass('sticky');
			}
		}
	
		$(window).on('scroll', sticky_banner);

		window.onresize=function(){
			$(window).on('scroll', sticky_banner);
		}
		
	});
	</script>
	<c:if test="${loginStatus == null || loginStatus == '' || loginStatus =='N'}">
	<script>
	//위시리스트
	$('#addWishList').on('click', function(e){
		e.preventDefault();
		alert('로그인 후 이용가능합니다.');
	});
	</script>
	</c:if>
	<c:if test="${loginStatus != null &&  loginStatus != '' && loginStatus=='Y'}">
	<script>
	//위시리스트
	/*
	$('#addWishList').on('click', function(e){
		e.preventDefault();
		$.ajax({
			url: $(this).attr('href'),
		});
	});
	*/
	</script>
	</c:if>