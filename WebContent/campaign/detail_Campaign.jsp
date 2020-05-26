<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
Calendar cal = Calendar.getInstance();

DateFormat df = new SimpleDateFormat("dd");
%>
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
					<div class="campaign-slider-nav flex">
					<c:forTokens items="${vo.camImg}" delims="|" var="imgsrc">
						<div class="slider-nav-item w-1/3 h-32 mr-4 cursor-pointer rounded overflow-hidden active">
							<img alt="prd_img" src="<%=projectPath%>/img/campaign/${imgsrc}" class="object-cover w-full h-32 transform hover:scale-125 duration-300">
						</div>
					</c:forTokens>
					</div>
					<!--슬라이더-->
				</div>
				<div class="w-1/2">
					<h1 class="mb-4 text-3xl font-bold">${vo.camTitle}</h1>
					<p class="mb-4 text-gray-dark">${vo.camDesc}</p>
					<p class="mb-4 text-2xl font-bold">23일 남음</p>
					<div class="flex justify-between items-baseline flex-grow-0 mb-2">
						<p class="inline-block text-brand"><span class="text-2xl font-bold">36,500,000</span>원 후원</p>
						<p class="inline-block">목표금액 ${vo.camGoalPrice}원</p>
					</div>
					<div class="progress relative bg-gray-lighter mb-4 rounded overflow-hidden">
						<div class="progress-bar absolute top-0 bottom-0 left-0 bg-brand" style="width:36.5%"></div>
					</div>
					<p class="mb-4"><span class="text-2xl font-bold">36.5</span>% 달성</p>
					<p class="mb-4"><span class="text-2xl font-bold">100</span>명 후원</p>
					<div class="p-4 bg-brand-light text-sm">
						<p class="text-brand"><span class="font-bold mr-2">펀딩기간</span>${vo.camStart} ~ ${vo.camEnd}</p>
						<p class="text-gray-darkest">목표금액 100% 달성시에만 결제</p>
					</div>
					<!--버튼--> 
					<div class="mt-8 mb-4 flex justify-end">
						<a href="#donate" class="btn-donate bg-brand hover:bg-brand-dark text-white py-2 px-4 w-1/2 rounded inline-block text-lg text-center font-bold">후원하기</a>
						<a href="#" class="add-wishlist relative ml-2 bg-white border border-gray-dark text-gray-dark w-12 rounded inline-block text-2xl text-center"><span class="wishlist-ico align-middle"></span></a>
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
							<li class="tab-item text-center mr-4"><a href="#beckers" class="inline-block py-4 px-4">후원자 <span class="text-brand">100</span></a></li>
							<li class="tab-item text-center mr-4"><a href="#comments" class="inline-block py-4 px-4">응원하기 <span class="text-brand">70</span></a></li>
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
							<ul class="campaign-update">
								<li class="relative px-4 mb-8">
									<span class="round-circle"></span>
									<div class="update-title mb-4">
										<p class="text-lg font-bold">2020-04-30</p>
										<h2 class="text-brand font-bold">후원 현황입니다.</h2>
									</div>
									<div class="update-content">
										<p>웅대한 가치를 청춘이 끓는다. 인간에 것은 심장은 이상은 우는 되려니와, 그들의 봄바람이다. 이것은 사람은 청춘의 작고 관현악이며, 심장의 청춘의 것이다. 석가는 과실이 하여도 힘있다. 그들은 미묘한 피고 방지하는 있다.</p>
										<p>가지에 같이, 귀는 현저하게 심장은 찾아다녀도, 무엇을 봄바람이다. 원질이 가는 가는 긴지라 피어나는 봄날의 미묘한 그와 뿐이다. 청춘 끓는 천지는 미묘한 힘있다. 같으며, 같은 그들의 웅대한 구할 낙원을 인류의 사막이다. 온갖 되는 얼음 그러므로 이상 황금시대를 곳으로 천하를 것이다. 동력은 청춘의 피가 희망의 되는 있다. 이상은 찬미를 보배를 없으면, 있을 끝까지 속잎나고, 것이다.</p>
									</div>
								</li>
								<li class="relative px-4 mb-8">
									<span class="round-circle"></span>
									<div class="update-title mb-4">
										<p class="text-lg font-bold">2020-04-24</p>
										<h2 class="text-brand font-bold">국가는 지역간의 균형있는 발전을 위하여 지역경제를 육성할 의무를 진다.</h2>
									</div>
									<div class="update-content">
										<p>제1항의 탄핵소추는 국회재적의원 3분의 1 이상의 발의가 있어야 하며, 그 의결은 국회재적의원 과반수의 찬성이 있어야 한다. 다만, 대통령에 대한 탄핵소추는 국회재적의원 과반수의 발의와 국회재적의원 3분의 2 이상의 찬성이 있어야 한다.</p>
										<p>국가는 균형있는 국민경제의 성장 및 안정과 적정한 소득의 분배를 유지하고, 시장의 지배와 경제력의 남용을 방지하며, 경제주체간의 조화를 통한 경제의 민주화를 위하여 경제에 관한 규제와 조정을 할 수 있다.</p>
									</div>
								</li>
								<li class="relative px-4 mb-8">
									<span class="round-circle"></span>
									<div class="update-title mb-4">
										<p class="text-lg font-bold">2020-04-10</p>
										<h2 class="text-brand font-bold">Lorem Ipsum</h2>
									</div>
									<div class="update-content">
										Lorem ipsum dolor sit amet consectetur, adipisicing elit. Corporis labore sed culpa neque sequi repudiandae, eos eveniet reprehenderit, debitis quisquam ad cumque accusamus ea officiis sit veritatis amet, deserunt ratione.
									</div>
								</li>
								<li class="relative px-4 mb-8">
									<span class="round-circle"></span>
									<div class="update-title mb-4">
										<p class="text-lg font-bold">2020-04-20</p>
										<h2 class="text-brand font-bold">캠페인이 시작되었습니다.</h2>
									</div>
									<div class="update-content">
										<img src="/project_Ma/img/img_main/main_tree_01.jpg"><br/>
										거선의 용기가 밥을 그리하였는가? 전인 것은 풀밭에 뜨거운지라, 얼음과 현저하게 아니더면, 주며, 뿐이다. 방황하여도, 것이다.보라, 어디 안고, 두기 수 얼음이 얼마나 교향악이다. 갑 인생을 뛰노는 사는가 붙잡아 황금시대다. 구하지 길을 같이 같이, 기쁘며, 공자는 이것이다. 되는 같이, 무엇을 위하여 물방아 있다. 인생을 두손을 이것이야말로 끝에 싶이 힘있다. 투명하되 이는 트고, 뼈 인생에 봄날의 끓는다. 끝에 풀이 더운지라 넣는 원질이 열락의 생의 약동하다. 할지라도 생명을 소담스러운 같은 창공에 그것은 이상의 사막이다. 같은 그들은 무엇을 아니다.
									</div>
								</li>
							</ul>
							<ul class="pagenation flex items-center justify-center mx-4">
								<li class="page-item disabled"><a class="page-link block py-1 px-2 hover:text-brand pointer-events-none" href="#"><i class="xi-angle-left-min"></i></a></li>
								<li class="page-item acitve"><a class="page-link block py-1 px-2 hover:text-brand text-brand" href="#">1</a></li>
								<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">2</a></li>
								<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">3</a></li>
								<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#"><i class="xi-angle-right-min"></i></a></li>
							</ul>
						</div><!--업데이트-->
						<div id="beckers" class="tab-content-item"><!--후원자-->
							<table class="table-fixed w-full m-4 text-left">
								<thead class="text-lg">
									<tr class="border-b-2 border-gray">
										<th class="p-4 w-1/3">이름</th>
										<th class="p-4 w-1/3">후원금액</th>
										<th class="p-4 w-1/3">후원일자</th>
									</tr>
								</thead>
								<tbody class="text-gray-darkest">
									<tr class="border-b border-gray border-dashed">
										<td class="p-4">홍길동</td>
										<td class="p-4">10,000원</td>
										<td class="p-4">2020-04-27</td>
									</tr>
									<tr class="border-b border-gray border-dashed">
										<td class="p-4">익명</td>
										<td class="p-4">10,000원</td>
										<td class="p-4">2020-04-27</td>
									</tr>
									<tr class="border-b border-gray border-dashed">
										<td class="p-4">익명</td>
										<td class="p-4">공개하지 않음</td>
										<td class="p-4">2020-04-27</td>
									</tr>
									<tr class="border-b border-gray border-dashed">
										<td class="p-4">김철수</td>
										<td class="p-4">공개하지 않음</td>
										<td class="p-4">2020-04-27</td>
									</tr>
									<tr class="border-b border-gray border-dashed">
										<td class="p-4">가나다</td>
										<td class="p-4">50,000원</td>
										<td class="p-4">2020-04-27</td>
									</tr>
									<tr class="border-b border-gray border-dashed">
										<td class="p-4">김영희</td>
										<td class="p-4">30,000원</td>
										<td class="p-4">2020-04-27</td>
									</tr>
									<tr class="border-b border-gray border-dashed">
										<td class="p-4">홍길동</td>
										<td class="p-4">10,000원</td>
										<td class="p-4">2020-04-27</td>
									</tr>
									<tr class="border-b border-gray border-dashed">
										<td class="p-4">홍길동</td>
										<td class="p-4">10,000원</td>
										<td class="p-4">2020-04-27</td>
									</tr>
									<tr class="border-b border-gray border-dashed">
										<td class="p-4">홍길동</td>
										<td class="p-4">10,000원</td>
										<td class="p-4">2020-04-27</td>
									</tr>
									<tr class="border-b border-gray border-dashed">
										<td class="p-4">홍길동</td>
										<td class="p-4">10,000원</td>
										<td class="p-4">2020-04-27</td>
									</tr>
									<tr class="border-b border-gray border-dashed">
										<td class="p-4">홍길동</td>
										<td class="p-4">10,000원</td>
										<td class="p-4">2020-04-27</td>
									</tr>
									<tr class="border-b border-gray border-dashed">
										<td class="p-4">홍길동</td>
										<td class="p-4">10,000원</td>
										<td class="p-4">2020-04-27</td>
									</tr>
									<tr class="border-b border-gray border-dashed">
										<td class="p-4">홍길동</td>
										<td class="p-4">10,000원</td>
										<td class="p-4">2020-04-27</td>
									</tr>
									<tr class="border-b border-gray border-dashed">
										<td class="p-4">홍길동</td>
										<td class="p-4">10,000원</td>
										<td class="p-4">2020-04-27</td>
									</tr>
									<tr class="border-b border-gray border-dashed">
										<td class="p-4">홍길동</td>
										<td class="p-4">10,000원</td>
										<td class="p-4">2020-04-27</td>
									</tr>
									<tr class="border-b border-gray border-dashed">
										<td class="p-4">홍길동</td>
										<td class="p-4">10,000원</td>
										<td class="p-4">2020-04-27</td>
									</tr>
									<tr class="border-b border-gray border-dashed">
										<td class="p-4">홍길동</td>
										<td class="p-4">10,000원</td>
										<td class="p-4">2020-04-27</td>
									</tr>
									<tr class="border-b border-gray border-dashed">
										<td class="p-4">홍길동</td>
										<td class="p-4">10,000원</td>
										<td class="p-4">2020-04-27</td>
									</tr>
									<tr class="border-b border-gray border-dashed">
										<td class="p-4">홍길동</td>
										<td class="p-4">10,000원</td>
										<td class="p-4">2020-04-27</td>
									</tr>
									<tr class="border-b border-gray border-dashed">
										<td class="p-4">홍길동</td>
										<td class="p-4">10,000원</td>
										<td class="p-4">2020-04-27</td>
									</tr>
								</tbody>
							</table>
							<ul class="pagenation flex items-center justify-center my-4">
								<li class="page-item disabled"><a class="page-link block py-1 px-2 hover:text-brand pointer-events-none" href="#"><i class="xi-angle-left-min"></i></a></li>
								<li class="page-item acitve"><a class="page-link block py-1 px-2 hover:text-brand text-brand" href="#">1</a></li>
								<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">2</a></li>
								<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">3</a></li>
								<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">4</a></li>
								<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">5</a></li>
								<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#"><i class="xi-angle-right-min"></i></a></li>
							</ul>
						</div><!--후원자-->
						<div id="comments" class="tab-content-item"><!--응원글-->
							<h1 class="my-4">응원·의견</h1>
							<div class="mb-8">
								<form method="POST" action="" enctype="multipart/form-data" onsubmit="return campaign_comment_validation()" class="campaign-comment-form">
									<label for="campaign_comment"></label>
									<textarea name="campaign_comment" id="campaign_comment" placeholder="로그인해야 응원글을 남길 수 있습니다." class="appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline h-24 bg-gray-lightest"></textarea>
									<div class="text-right">
										<input type="submit" value="응원하기" class="bg-brand hover:bg-brand-dark text-white font-bold py-2 px-4 rounded"/>
									</div>
								</form>
							</div>
							<ul class="campaign-comment-list">
							<c:if test="${commentLst!='' && commentLst!=null}">
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
							</c:if>
							<c:if test="${commentLst=='' || commentLst==null}">
								<p>아직 이 캠페인에 대한 응원·의견이 없습니다.</p>
							</c:if>
							</ul>
							<ul class="pagenation flex items-center justify-center my-4">
								<li class="page-item disabled"><a class="page-link block py-1 px-2 hover:text-brand pointer-events-none" href="#"><i class="xi-angle-left-min"></i></a></li>
								<li class="page-item acitve"><a class="page-link block py-1 px-2 hover:text-brand text-brand" href="#">1</a></li>
								<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">2</a></li>
								<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">3</a></li>
								<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">4</a></li>
								<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">5</a></li>
								<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#"><i class="xi-angle-right-min"></i></a></li>
							</ul>
						</div><!--응원글-->
						<div id="qna" class="tab-content-item"><!--문의-->
							<h1 class="my-4">Q&A</h1>
							<div>
								<form method="POST" action="" enctype="multipart/form-data" class="campaign-qna-form" onsubmit="return campaign_qna_validation(this);">
									<div class="mb-4">
										<input type="text" name="qna_title" id="qna_title" placeholder="제목" class="appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline bg-gray-lightest">
									</div>
									<div class="mb-4">
										<textarea name="qna_question" id="qna_question" placeholder="로그인해야 문의 작성이 가능합니다." class="appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline h-24 bg-gray-lightest"></textarea>
									</div>
									<div class="text-right mb-4">
										<lable for="is_secret" class="mr-4"><span class="mr-2">비밀글</span><input type="checkbox" name="is_secret" id="is_secret"/></lable>
										<input type="submit" value="등록" class="bg-brand hover:bg-brand-dark text-white font-bold py-2 px-4 rounded"/>
									</div>
								</form>
							</div>
							<div class="campaign-qna-wrapper w-full">
								<div class="table table-fixed w-full text-center font-bold border-b-2 border-gray">
									<div class="table-cell w-24 p-4">답변상태</div>
									<div class="table-cell p-4">제목</div>
									<div class="table-cell w-24 p-4">작성자</div>
									<div class="table-cell w-32 p-4">작성일</div>
								</div>
								<ul class="campaign-qna-list w-full">
									<li>
										<div class="qna-container table table-fixed w-full text-center border-b border-gray">
											<div class="table-cell w-24 p-4">미답변</div>
											<div class="table-cell py-4 px-8 text-left"><a class="qna-title block" href="#qna100">문의드립니다. <span class="text-cta"><i class="xi-new"></i></span></a></div>
											<div class="table-cell w-24 p-4">김*희</div>
											<div class="table-cell w-32 p-4">2020-04-27</div>
										</div>
										<div id="qna100" class="qna-content px-8 bg-gray-lightest pl-24 border-b border-gray hidden">
											<div class="qna-user py-4 border-b border-gray">
												리워드 관련 문의드립니다~
											</div>
										</div>
									</li>
									<li>
										<div class="qna-container table table-fixed w-full text-center border-b border-gray">
											<div class="table-cell w-24 p-4">답변완료</div>
											<div class="table-cell p-4 px-8 text-left"><a class="qna-title" href="#qna99">문의드립니다.</a></div>
											<div class="table-cell w-24 p-4">홍*동</div>
											<div class="table-cell w-32 p-4">2020-04-27</div>
										</div>
										<div id="qna99" class="qna-content px-8 bg-gray-lightest pl-24 border-b border-gray hidden">
											<div class="qna-user py-4 border-b border-gray">
												있는 시들어 가슴에 갑 자신과 풀밭에 것은 생명을 때에, 있으랴? 때까지 앞이 풍부하게 이 가치를 청춘 관현악이며, 이 같은 쓸쓸하랴? 있는 인생에 불어 오아이스도 힘있다. 청춘 뜨고, 얼마나 그들의 사랑의 과실이 싹이 노년에게서 듣는다. 소리다.이것은 더운지라 찬미를 같이, 그러므로 열락의 않는 있는 칼이다. 그들의 아니한 장식하는 청춘 목숨이 용기가 예수는 것이다. 별과 오직 두기 인간에 구하지 수 있다. 발휘하기 그들의 듣기만 봄바람이다. 피고, 인간은 원질이 그들은 약동하다. 스며들어 바로 꽃이 것이다.
											</div>
											<div class="qna-reply py-4 pl-8 relative">
												<span class="absolute left-0 text-lg"><i class="xi-subdirectory-arrow"></i></span>
												<div class="comment-author font-bold pb-4 mb-4 text-success border-b border-gray border-dashed">나무심기 운동본부<span class="text-gray-dark text-sm font-normal ml-4">2020-04-27</span></div>
												<div class="comment-text text-gray-darkest">
													문의 답변입니다.
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="qna-container table table-fixed w-full text-center border-b border-gray">
											<div class="table-cell w-24 p-4">답변완료</div>
											<div class="table-cell p-4 px-8 text-left"><a class="qna-title" href="#qna98">문의드립니다.</a></div>
											<div class="table-cell w-24 p-4">가*다</div>
											<div class="table-cell w-32 p-4">2020-04-26</div>
										</div>
										<div id="qna98" class="qna-content px-8 bg-gray-lightest pl-24 border-b border-gray hidden">
											<div class="qna-user py-4 border-b border-gray">
												있는 시들어 가슴에 갑 자신과 풀밭에 것은 생명을 때에, 있으랴? 때까지 앞이 풍부하게 이 가치를 청춘 관현악이며, 이 같은 쓸쓸하랴? 있는 인생에 불어 오아이스도 힘있다. 청춘 뜨고, 얼마나 그들의 사랑의 과실이 싹이 노년에게서 듣는다. 소리다.이것은 더운지라 찬미를 같이, 그러므로 열락의 않는 있는 칼이다. 그들의 아니한 장식하는 청춘 목숨이 용기가 예수는 것이다. 별과 오직 두기 인간에 구하지 수 있다. 발휘하기 그들의 듣기만 봄바람이다. 피고, 인간은 원질이 그들은 약동하다. 스며들어 바로 꽃이 것이다.
											</div>
											<div class="qna-reply py-4 pl-8 relative">
												<span class="absolute left-0 text-lg"><i class="xi-subdirectory-arrow"></i></span>
												<div class="comment-author font-bold pb-4 mb-4 text-success border-b border-gray border-dashed">나무심기 운동본부<span class="text-gray-dark text-sm font-normal ml-4">2020-04-27</span></div>
												<div class="comment-text text-gray-darkest">
													문의 답변입니다.
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="qna-container table table-fixed w-full text-center border-b border-gray">
											<div class="table-cell w-24 p-4">답변완료</div>
											<div class="table-cell p-4 px-8 text-left">비밀글 <i class="xi-lock-o"></i></div>
											<div class="table-cell w-24 p-4">김*수</div>
											<div class="table-cell w-32 p-4">2020-04-27</div>
										</div>
									</li>
									<li>
										<div class="qna-container table table-fixed w-full text-center border-b border-gray">
											<div class="table-cell w-24 p-4">답변완료</div>
											<div class="table-cell p-4 px-8 text-left">비밀글 <i class="xi-lock-o"></i></div>
											<div class="table-cell w-24 p-4">김*수</div>
											<div class="table-cell w-32 p-4">2020-04-25</div>
										</div>
									</li>		
								</ul>
							</div>
							<ul class="pagenation flex items-center justify-center my-4">
								<li class="page-item disabled"><a class="page-link block py-1 px-2 hover:text-brand pointer-events-none" href="#"><i class="xi-angle-left-min"></i></a></li>
								<li class="page-item acitve"><a class="page-link block py-1 px-2 hover:text-brand text-brand" href="#">1</a></li>
								<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">2</a></li>
								<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">3</a></li>
								<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#"><i class="xi-angle-right-min"></i></a></li>
							</ul>
						</div><!--문의-->
					</div>
				</div>
				<!--리워드-->
				
				<div id="donate" class="rewards w-1/4">
				<c:if test="${vo.camRewardStatus == 1}">
				<c:forEach var="rvo" items="${rwList}">
					<div class="reward-item relative my-4 p-8 bg-white border border-gray">
						<p class="text-lg mb-4 font-bold">${rvo.rewardPrice}원 후원</p>
						<div class="mb-4">
							<p class="mb-2 text-gray-darkest">${rvo.rewardName}</p>
							<p class="text-gray-dark text-sm">${rvo.rewardContent}</p>
						</div>
						<div class="mb-4 text-sm">
							<p class="text-gray-dark">배송비</p>
							<p>${rvo.deliveryPrice}원</p>
						</div>
						<div class="mb-8 text-sm">
							<p class="text-gray-dark">리워드 발송 시작일</p>
							<p>${rvo.deliveryExYear}년 ${rvo.deliveryExMonth}월</p>
							<p>${rvo.deliveryExDateDetail}</p>
						</div>
						<div class="text-sm">
							<p class="text-brand mb-2">제한수량 ${rvo.rewardQuantity}개 <span class="ml-2 px-2 bg-brand-light text-brand">90개 남음</span></p>
							<p>10개 후원됨</p>
						</div>
						<a href="<%=projectPath %>/payment/paymentProcess.do?reward_no=${rvo.rewardNo}&reward_status=${vo.camRewardStatus}" class="overlay absolute block top-0 bottom-0 left-0 w-full bg-brand opacity-0 hover:opacity-75 duration-300">
							<span class="donate-this absolute text-white font-bold text-lg">후원하기</span>
						</a>
					</div>
				</c:forEach>
				</c:if>
				<c:if test="${vo.camRewardStatus == 0}">
					<div class="reward-item relative my-4 p-8 bg-white border border-gray">
						<p>리워드 없이 후원하기</p>
						<a href="<%=projectPath %>/payment/paymentProcess.do?reward_status=${vo.camRewardStatus}" class="overlay absolute block top-0 bottom-0 left-0 w-full bg-brand opacity-0 duration-300">
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
