<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	 <div id="myInformation" class="tab-content"><!-- 내정보 탭-->
		<div id="explain" class="w-full max-w-screen-xl my-2 mx-auto border-solid border-gray border-b  my-1 text-4xl py-4">캠페인 수정</div>
			<div class="w-full max-w-screen-xl my-0 mx-auto py-8">
				<div class="w-full max-w-screen-md my-0 mx-auto py-8">
					<form id="campaignEditor" method="POST" action="" enctype="multipart/form-data" onsubmit="return editor_validation(this)">
						<!--캠페인 정보-->
						
						<div class="mb-8 px-4">
							<div class="mb-4">
								<label for="campaign_title" class="inline-block my-4">캠페인 제목</label>
								<input type="text" name="campaign_title" id="campaign_title" class="appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline">
							</div>
							<div class="mb-4">
								<label for="campaign_img" class="inline-block my-4">이미지</label>
								<p class="text-sm text-gray-dark mb-2">5MB이하의 이미지(jpeg, gif, png, bmp) 파일만 최대 3장 업로드 가능합니다.</p>
								<div class="bg-gray-lightest rounded pt-4 pl-4">
									<input type="file" name="campaign_img[]" id="campaign_img" accept="image/png, image/jpeg, image/gif, image/bmp" multiple/>
									<div id="imgPrevew" class="flex flex-wrap w-full mt-4"></div>
								</div>
							</div>
							<div class="mb-4">
								<label for="campaign_story" class="inline-block my-4">캠페인 스토리</label>
								<textarea name="campaign_story" id="campaign_story" class="appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline"></textarea>
							</div>
							<div class="mb-4">
								<label for="short_desc" class="inline-block my-4">간략 설명</label>
								<textarea name="short_desc" id="short_desc" placeholder="캠페인에 대한 간략한 설명" class="appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline"></textarea>
							</div>
							<div class="mb-4 flex">
								<div class="w-1/2 pr-2">
									<label for="campaign_start" class="inline-block my-4">시작일</label>
									<input type="text" name="start_date" id="start_date" readonly placeholder="YYYY-MM-DD" class="datepicker-ymd appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline">
								</div>
								<div class="w-1/2 pl-2">
									<label for="campaign_end" class="inline-block my-4">종료일</label>
									<input type="text" name="end_date" id="end_date" readonly placeholder="YYYY-MM-DD" class="datepicker-ymd appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline">
								</div>
							</div>
							<div class="mb-4 flex">
								<div class="w-1/2 pr-2">
									<label for="campaign_start" class="inline-block my-4">최저금액</label>
									<div class="relative">
										<input type="text" name="min_money" value="0" id="min_money" class="min_money appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline">
										<div class="absolute inset-y-0 right-0 py-2 px-3 text-gray-darkest">원</div>
									</div>
								</div>
								<div class="w-1/2 pl-2">
									<label for="campaign_end" class="inline-block my-4">최대금액</label>
									<div class="relative">
										<input type="text" name="max_money" value="0" id="max_money" class="max_money appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline">
										<div class="absolute inset-y-0 right-0 py-2 px-3 text-gray-darkest">원</div>
									</div>
								</div>
							</div>
							<div class="mb-4 pr-4">
								<label for="goal" class="block mt-8 mb-4">목표금액</label>
								<div class="relative w-1/2">
									<input type="text" name="goal" id="goal" value="0" class="goal appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline">
									<div class="absolute inset-y-0 right-0 py-2 px-3 text-gray-darkest">원</div>
								</div>
							</div>
						</div>
						<!--캠페인 정보-->
						<!--리워드 정보-->
						<h2 class="mb-4 border-b border-solid border-gray-dark pb-4">리워드 정보</h2>
						<div class="reward-wrap mb-8">
							<div id="reward-fieldset-1" data-number="1" class="reward-fieldset bg-gray-lightest px-4 mb-4">
								<div class="mb-4 py-4 border-b border-gray">
									<h3 id="reward-title-1" class="reward-title">리워드<span class="reward-number">1</span></h3>
								</div>
								<div class="mb-4">
									<label for="reward_name" class="inline-block my-4">리워드명</label>
									<input type="text" name="reward[reward_name_1]" id="reward_name_1" data-name="reward_name" class="appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline">
								</div>
								<div class="mb-4">
									<label for="reward_desc" class="inline-block my-4">리워드 설명</label>
									<textarea name="reward[reward_desc_1]" id="reward_desc_1" data-name="reward_desc" placeholder="리워드에 대한 간략한 설명" class="appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline h-24"></textarea>
								</div>
								<div class="mb-4 flex">
									<div class="w-1/3 pr-8">
										<label for="reward_limit" class="inline-block my-4">리워드 수량</label>
										<input type="number" name="reward[reward_limit_1]" data-name="reward_limit" min="0" id="reward_limit_1" class="number-only appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline">
									</div>
									<div class="w-1/3 pr-8">
										<label for="del_fee" class="inline-block my-4">배송비</label>
										<div class="relative">
											<input type="text" name="reward[del_fee_1]" id="del_fee_1" data-name="del_fee" class="appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline">
											<div class="absolute inset-y-0 right-0 py-2 px-3 text-gray-darkest">원</div>
										</div>
									</div>
								</div>
								<div class="mb-4">
									<label for="del_date" class="inline-block my-4 w-full">배송일정</label>
									<div class="flex">
										<div class="w-1/3 flex">
											<div class="inline-block relative w-1/2 mr-2"><!--select-->
												<select name="reward[del_year_1]" id="del_year_1" data-name="del_year" class="del_year block appearance-none w-full bg-white border border-gray hover:border-gray-dark px-4 py-2 pr-8 rounded leading-tight focus:outline-none focus:shadow-outline">
													<option value="0">년</option>
												</select>
												<div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2">
													<i class="xi-angle-down-min"></i>
												</div><!--select-->
											</div>
											<div class="inline-block relative w-1/2 mr-2"><!--select-->
												<select name="reward[del_month_1]" id="del_month_1" data-name="del_month" class="block appearance-none w-full bg-white border border-gray hover:border-gray-dark px-4 py-2 pr-8 rounded leading-tight focus:outline-none focus:shadow-outline">
													<option value="0">월</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
												</select>
												<div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2">
													<i class="xi-angle-down-min"></i>
												</div><!--select-->
											</div>
										</div>
										<div class="w-2/3">
											<input type="text" name="reward[del_date_detail_1]" id="del_date_detail_1" data-name="del_date_detail" placeholder="상세일정 ex) 21~말일 배송 예정입니다." class="datepicker-ym appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline">
										</div>
									</div>
								</div>
								<div class="reward-ctrl-btn py-4 flex justify-end">
									<button data-number="1" class="add-reward-row bg-brand hover:bg-brand-dark text-white text-sm py-1 px-2 ml-2 rounded">리워드 추가 <i class="xi-plus"></i></button>
									
								</div>
							</div><!--reward-fieldset-->
						</div>
						<!--리워드 정보-->
						<div class="text-center my-8">
							<input type="submit" value="캠페인수정" class="bg-brand hover:bg-brand-dark text-white font-bold py-2 px-4 rounded">
						</div>
					</form>
				</div>
			</div>
		</div>
		<footer id="footer" class="bg-gray-darkest text-gray text-sm">
			<div class="footer-menu w-full bg-gray-dark">
				<div class="w-full max-w-screen-xl my-0 mx-auto flex justify-between text-white px-8 xl:px-0">
					<div>
						<a href="/project_Ma/terms/tos.html" class="inline-block py-4 mr-8">이용약관</a>
						<a href="/project_Ma/terms/private.html" class="inline-block py-4">개인정보 처리방침</a>
					</div>
					<div>
						<a href="/project_Ma/contact/serviceCenter.html" class="inline-block py-4 mr-8">고객센터</a>
						<a href="/project_Ma/news/notice.html" class="inline-block py-4">공지사항</a>
					</div>
				</div>
			</div>
			<div class="w-full max-w-screen-xl my-0 mx-auto flex justify-between mt-8 px-8 xl:px-0">
				<div>
					<p>서울 마포구 백범로 23 구프라자 3층 | 사업자 이영범 | 사업등록번호 000-00-00000<br/>
						TEL 02-0000-0000 | FAX 02-0000-0000 | E-mail test@test.or.kr</p>
				</div>
				<div class="text-right">
					<a href="/project_Ma/index.html"><img class="w-64" src="/project_Ma/img/chariTree_logo_footer.png"></a>
				</div>
			</div>
			<div class="w-full max-w-screen-xl my-0 mx-auto py-8 px-8 xl:px-0 text-xs">
				<span class="mr-2">Copyright©2020 BitCamp All right reserved.</span><span>아이콘 제작자 <a href="https://www.flaticon.com/kr/authors/smalllikeart" title="smalllikeart">smalllikeart</a> from <a href="https://www.flaticon.com/kr/" title="Flaticon">www.flaticon.com</a></span>
			</div>
		</footer>
		<div id="searchModal" class="modal w-full h-screen bg-black opacity-75 fixed top-0 z-50 hidden">
			<div class="close text-white inline-block text-xl absolute top-0 right-0 p-4 cursor-pointer"><i class="xi-close"></i></div>
			<form method="GET" id="searchForm" class="w-full max-w-sm">
				<div class="flex items-center border-b border-b-2 border-white py-2">
					<input class="appearance-none bg-transparent border-none w-full text-white mr-3 py-1 px-2 leading-tight focus:outline-none" type="text" name="search_text" placeholder="검색" aria-label="Full name">
					<button class="flex-shrink-0 text-white py-1 px-2" id="searchSubmit"><i class="xi-search"></i></button>
				</div>
			</form>
		</div>

</body>
</html>