<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>main page</title> 
</head>
<body>
	<!-- img slide --> 
			<div id="mainImgDiv" class="w-full my-0 mx-auto">
				<div class="w-full my-0 mx-auto bg-gray-lighter">
					<div class="slider single-item">
						<div class="slide-img w-full bg-cover relative" style="background-image:url('<%=projectPath%>/img/img_main/mainslider01.png')">
							<div class="slide-text absolute text-white"> 
								<h1 class="font-bold text-3xl mb-4">대통령은 헌법과 법률이<br> 정하는 바에 의하여 공무원을 임면한다.</h1>
								<p
								>정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다.</p>
							</div>
						</div>
						<div class="slide-img w-full bg-cover relative" style="background-image:url('<%=projectPath%>/img/img_main/mainslider02.png')">
							<div class="slide-text absolute text-white">
								<h1 class="font-bold text-3xl mb-4">모든 국민은 근로의 권리를 가진다.</h1>
								<p>국가는 사회적·경제적 방법으로 근로자의 고용의 증진과 적정임금의 보장에 노력하여야 하며,<br>법률이 정하는 바에 의하여 최저임금제를 시행하여야 한다.</p>
							</div>
						</div>
						<div class="slide-img w-full bg-cover relative" style="background-image:url('<%=projectPath%>/img/img_main/mainslider03.png')">
							<div class="slide-text absolute">
								<h1 class="font-bold text-3xl mb-4">밝은 그들의 것이다.<br>보라, 지혜는 가치를 듣기만 위하여서.</h1>
								<p>피가 그와 구하지 튼튼하며, 용감하고 생명을 끓는다.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- img slide end -->
			
			<!-- nowCampaign -->
			<div id="nowCampaign" class="rounded-lg mt-4 w-full max-w-screen-xl my-0 mx-auto">
				<!-- mainMoreDiv start -->
				<div id="mainMoreDiv_01" class="w-16">
					<div class="mid_title">
						이 캠페인은 어떠세요?<br /> <span id="mid_title_word" class="mid_title_word"> 당신의 작은 <span class="text-danger" >사랑</span>이 큰 도움이 됩니다 </span> 
						<button id="moreButton" class="text-2xl border-b">
							<a href="<%=projectPath %>/campaign/all_Campaign.do">more</a>  
						</button>
					</div>
				</div>
				 <!-- mainMoreDiv end -->
				 
				<!-- mid_Div_Campaign 이미지/프로젝트명/남은기간 -->
					<div id="mid_Div_Campaign" class="flex">
						<c:forEach var="lst" items="${list }"> 
							<div id="mid_cam_01" class="mx-2 flex-initial w-1/3">
								<div class="mid_cam_img rounded-lg my-4 my-0 mx-auto border-solid border-4 border-gray">
									<a href="<%=projectPath %>/campaign/detail_Campaign.do?no=${lst.cam_no}"><img src="<%=projectPath %>/img/${lst.cam_img_path}" alt="${lst.cam_title }" /></a>
								</div> 
								<div class="mid_cam_name"><a href="<%=projectPath %>/campaign/detail_Campaign.do?no=${lst.cam_no}">${lst.cam_title }</a></div>
								<div class="flex pre_date rounded-lg mt-2 my-0 mx-auto">
									<div class="mid-genre">자선캠페인</div>
									<div class="mid_bar_div flex-initial">
										<div id="mid_emptyBar_01" class="relative  h-2 rounded"> 
											<div id="mid_colorBar_01" class="relative bg-danger h-2 rounded"></div>
										</div>
									</div>
									<div class="mid_D_day w-1/3 flex-initial"> 
										<span class="percentage text-danger">50.00%</span><br/>${lst.cam_remainDay}&nbsp;일 남음.
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
			</div><!-- nowCampaign end -->

			<!-- otherCampaign start -->
			<div id="otherCampaign" class="w-full max-w-screen-xl my-0 mx-auto"> 
				<div class="flex">
					<div id="preCamDiv" class="flex-initial w-2/3 relative">
						<div id="pre_open_div" class="">
							주목하세요! 곧 오픈합니다!<br /> 
							<span id="mid_title_word_02" class="mid_title_word"> 도움이 필요해요<span class="text-danger" >기쁨</span>을나줘주세요.</span>
						</div>
					<!-- 오픈예정 캠페인 이미지, 캠페인명, 예정일 -->
					<div id="main_carousel" class="relative"> 
						<div id="carousel_Slick" class="flex">
						<c:forEach var="lst2" items="${exOpenList }">				
								<div class="carousel_Div flex-initial"> 
									<div class="carou_cam_img rounded-lg mb-4 mx-auto"> 
										<img src="<%=projectPath %>/img/${lst2.cam_img_path}" alt="${lst2.cam_title}" /> 
									</div>
									<div class="carou_cam_name rounded-lg my-0 mx-auto">${lst2.cam_title }</div>
									<div class="date_01 carou_cam_date rounded-lg mt-2 my-0 mx-auto"> 
										시작일 : ${lst2.cam_start }					
										<c:if test="${lst2.cam_remainDay > 0}">
											<span class="re_01 remainDay text-danger">${lst2.cam_remainDay }&nbsp;일 후 OPEN</span>
										</c:if>
										<c:if test="${lst2.cam_remainDay <= 0}">
											<span class="re_01 remainDay text-danger">&nbsp;OPEN!</span>
										</c:if>
									</div>
								</div>  
						</c:forEach>	
					   	</div><!-- main_carousel -->
					   		<div class="carousel-btn-wrap absolute bottom-0 right-0">
								<button type='button' class='slick-prev_02'><i class='xi-angle-left-min'></i></button>
								<button type='button' class='slick-next_02'><i class='xi-angle-right-min'></i></button>
							</div>
					</div>
				</div><!-- preCamDiv 오픈예정-->
				<!-- deadlineDiv -->
				<div id="deadlineDiv" class="flex-initial w-1/3">
					<div id="dead_Line_Div" class="mt-2 mt-8 my-4 mx-auto">
						끝이 가까워요!<br /> <span id="mid_title_word" class="mid_title_word">
							<span class="text-danger" >종료</span>임박! 어서오세요
						</span>
					</div>
					<div id="dead_scroll_Div" class="w-full overflow-y-scroll">
						<c:forEach var="lst3" items="${deadLineList }">
							<div class="dead_scroll_box flex w-full">
								<div class="d_box mx-2  flex-initial w-2/3">
									<div class="d_camBar  w-full my-2 h-8">
										<div id="d_emptyBar_01" class="relative mx-4  h-2 rounded">
											<div id="d_colorBar_01" class="relative  bg-danger h-2 rounded"></div>
										</div>
									</div>
									<div class="d_camName  w-full h-16">
										<c:if test="${lst3.cam_remainDay > 0}">
											<span>${lst3.cam_remainDay }일 후 마감</span>
										</c:if>
										<c:if test="${lst3.cam_remainDay <= 0}">
											<span>마 감!</span>
										</c:if>		
									</div>
									<div class="d_camTitle w-full h-16">${lst3.cam_title }</div>
								</div>
								<div class="d_Img  flex-initial w-1/3">
									<a href="<%=projectPath %>/campaign/detail_Campaign.do"><img src="<%=projectPath %>/img/${lst3.cam_img_path}" alt="${lst.cam_title }" /></a>
								</div>
							</div>
						</c:forEach>
					</div><!-- deadlineDiv -->
				</div>
			</div>
		</div><!-- otherCampaign end -->

			<div id="article_title" class="article_title w-full max-w-screen-xl my-0 mx-auto">		
				<p>최근 이슈<br/>  
				<span id="article_mini_ment" class="article_mini_ment"> 
					 모두<a  class="text-danger" href="#"> 함께 </a>힘내요
				</span></p>
			</div> 
			
			<!-- 동영상 -->   
			<div class="youtube flex w-full bg-gray-lightest"> 
				<div class="youtube_ment_01 flex-initial">     
					<span><a href="#">코로나</a></span><br/> 
					 당신의 도움이 필요합니다.<br/><br/>  
					<div class="article bg-white"> 
						<img src="/project_Ma/img/img_main/main_article_01.PNG"/>  
					</div> 
					<a href="#">
					 	<input type="button" id="resisterInput_02" class="bg-danger hover:bg-danger-light text-white font-bold py-2 px-4 border border-danger rounded"value="바로가기" />
					</a>    
				</div>   
  				    
				<div id="player" class="my-16">
					<div id="player_screen"> 
						<iframe src="https://www.youtube.com/embed/tue73y7EpSA" width="600" height="400"> 
						</iframe>
					</div> 
				</div>  
			</div> 

   			<!-- 위로 이동 -->  
			<div class="page_up_div text-2xl border border-gray text-center rounded h-12 w-12 bg-black opacity-75 text-white">
				<a id="scrollToTop" class="align-middle" href="#"><i class="xi-angle-up"></i></a>  
			</div>         
  
			<!-- siteReisterBanner start --> 
			<div id="siteReisterBanner"
				class="w-full max-w-screen-xl my-0 mx-auto">
				<div id="banner_ment_01" class="">
					<span>ChariTree</span>에서 당신을 기다립니다.
				</div>
				<div id="banner_ment_02" class="">여러분의 따스한 관심을 나누어주세요.</div>
				<a href="#"> <input type="button" id="resisterInput"
					class="bg-danger hover:bg-danger-light text-white font-bold py-2 px-4 border border-danger rounded"
					value="바로가기" />
				</a>
			</div> <!-- siteReisterBanner end -->
		<!---------------------------------------------->
		<!---------------------------------------------->
</body>
</html>