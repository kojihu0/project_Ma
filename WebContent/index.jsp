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
								<p>정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다.</p>
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
<<<<<<< HEAD
=======
				 <!-- mainMoreDiv end -->
>>>>>>> refs/heads/workBranch
				<!-- 이미지/프로젝트명/남은기간 -->
				<div id="mid_Div_Campaign" class="flex">
					<div id="mid_cam_01" class="mx-2 flex-initial w-1/3">
						<div
							class="mid_cam_img rounded-lg my-4 my-0 mx-auto border-solid border-4 border-gray">
							<a href="<%=projectPath %>/campaign/detail_Campaign.do"><img src="img/img_main/main_temple_01.jpg" alt="/project_Ma/campaign/campaign_detail.html" /></a>
						</div>

						<div class="mid_cam_name"><a href="<%=projectPath %>/campaign/detail_Campaign.do">문화재 복원 캠페인!</a></div>

						<div class="flex pre_date rounded-lg mt-2 my-0 mx-auto">
							<div class="mid-genre">자선캠페인</div>
							<div class="mid_bar_div flex-initial">
								<div id="mid_emptyBar_01" class="relative  h-2 rounded">
									<div id="mid_colorBar_01"
										class="relative bg-danger h-2 rounded"></div>
								</div>
							</div>
							<div class="mid_D_day w-1/3 flex-initial">
								<span class="percentage text-danger">50.00%</span><br /> 13일 남음
							</div>
						</div>
					</div> 
					<div id="mid_cam_02" class="mx-2 flex-initial w-1/3"> 
						<div class="mid_cam_img rounded-lg my-4 my-0 mx-auto border-solid border-4 border-gray">
							<a href="<%=projectPath %>/campaign/detail_Campaign.do"><img src="img/img_main/main_tree_01.jpg" alt="" /></a> 
						</div>
						<div class="mid_cam_name"><a href="<%=projectPath %>/campaign/detail_Campaign.do">나무를 심자!</a></div>

						<div class="flex pre_date rounded-lg mt-2 my-0 mx-auto">
							<div class="mid-genre">자선캠페인</div>
							<div class="mid_bar_div flex-initial">
								<div id="mid_emptyBar_02" class="relative  h-2 rounded">
									<div id="mid_colorBar_02" class="relative  bg-danger h-2 rounded"></div>
								</div>
							</div>
							<div class="mid_D_day w-1/3 flex-initial">
								<span class="percentage text-danger">85.00%</span><br /> 7일 남음
							</div>
						</div>
					</div> 
					<div id="mid_cam_03" class="mx-2 flex-initial w-1/3">
						<div class="mid_cam_img rounded-lg my-4 my-0 mx-auto border-solid border-4 border-gray">
							<a href="<%=projectPath %>/campaign/detail_Campaign.do"><img src="img/img_main/main_woman_01.jpg" alt="" /></a>
						</div>
						<div class="mid_cam_name"><a href="<%=projectPath %>/campaign/detail_Campaign.do"s>당신의 도움을 필요로 합니다!</a></div>

						<div class="flex pre_date rounded-lg mt-2 my-0 mx-auto">
							<div class="mid-genre">자선캠페인</div>
							<div class="mid_bar_div flex-initial">
								<div id="mid_emptyBar_03" class="relative  h-2 rounded">
									<div id="mid_colorBar_03"
										class="relative  bg-danger h-2 rounded"></div>
								</div>
							</div>
							<div class="mid_D_day w-1/3 flex-initial">
								<span class="percentage text-danger">75.00%</span><br /> 21일 남음
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- nowCampaign end -->

			<!-- otherCampaign start -->
			<div id="otherCampaign"
				class="w-full max-w-screen-xl my-0 mx-auto">
				<div class="flex">
					<div id="preCamDiv" class="flex-initial w-2/3 relative">
						<div id="pre_open_div" class="">
							주목하세요! 곧 오픈합니다!<br /> 
							<span id="mid_title_word_02" class="mid_title_word"> 도움이 필요해요<span class="text-danger" >기쁨</span>을
								나줘주세요.</span>
						</div>
					<!-- 오픈예정 캠페인 이미지, 캠페인명, 예정일 -->
					<div id="main_carousel" class="relative">
						<div id="carousel_Slick" class="flex">
							<div class="carousel_Div flex-initial">
								<div class="carou_cam_img rounded-lg mb-4 mx-auto">
									<img src="img/img_List/africa.jpg" alt="" />
								</div>

								<div class="carou_cam_name rounded-lg my-0 mx-auto">아프리카
									지원 캠페인</div>

								<div id="date_01" class="carou_cam_date rounded-lg mt-2 my-0 mx-auto">
									2020-05-01<span id="re_01" class="remainDay text-danger"></span>
								</div>
							</div> 

							<div class="carousel_Div flex-initial">
								<div class="carou_cam_img rounded-lg mb-4 mx-auto">
									<img src="img/img_List/dokdo.jpg" alt="" />
								</div>

								<div class="carou_cam_name rounded-lg my-0 mx-auto">독도는
									한국땅임.</div>

								<div id="date_02"
									class="carou_cam_date rounded-lg mt-2 my-0 mx-auto ">
									2020-06-26<span id="re_02" class="remainDay text-danger"></span>
								</div>
							</div>
							<div class="carousel_Div flex-initial">
								<div class="carou_cam_img rounded-lg mb-4 mx-auto">
									<img src="img/img_List/boyukwon.jpg" alt="" />
								</div>

								<div class="carou_cam_name rounded-lg my-0 mx-auto">아이가
									먼저다.훠훠훠</div>

								<div id="date_03" class="carou_cam_date rounded-lg my-0 mx-auto">
									2020-05-26 <span id="re_03" class="remainDay text-danger"></span>
								</div>

							</div>
							<div class="carousel_Div flex-initial">
								<div class="carou_cam_img rounded-lg mb-4 mx-auto">
									<img src="img/img_List/culture.jpg" alt="" />
								</div>

								<div class="carou_cam_name rounded-lg my-0 mx-auto">문화재
									복원할거임. 암튼 할거임.</div>

								<div id="date_04" class="carou_cam_date rounded-lg mt-2 my-0 mx-auto ">
									2020-05-27 <span id="re_04" class="remainDay text-danger "></span>
								</div>
							</div>
						</div>
						<div class="carousel-btn-wrap absolute bottom-0 right-0">
							<button type='button' class='slick-prev_02'><i class='xi-angle-left-min'></i></button>
							<button type='button' class='slick-next_02'><i class='xi-angle-right-min'></i></button>
						</div>
					</div><!-- main_carousel -->
				</div>
				<!-- deadlineDiv -->
				<div id="deadlineDiv" class="flex-initial w-1/3">
					<div id="dead_Line_Div" class="mt-2 mt-8 my-4 mx-auto">
						끝이 가까워요!<br /> <span id="mid_title_word" class="mid_title_word">
							<span class="text-danger" >종료</span>임박! 어서오세요
						</span>
					</div>
					<div id="dead_scroll_Div" class="w-full overflow-y-scroll">
						<div class="dead_scroll_box flex w-full">
							<div class="d_box mx-2  flex-initial w-2/3">
								<div class="d_camBar  w-full my-2 h-8">
									<div id="d_emptyBar_01" class="relative mx-4  h-2 rounded">
										<div id="d_colorBar_01" class="relative  bg-danger h-2 rounded"></div>
									</div>
								</div>
								<div class="d_camName  w-full h-16">
									<span>75%</span>
								</div>
								<div class="d_camTitle w-full h-16">사랑의 나눔</div>
							</div>
							<div class="d_Img  flex-initial w-1/3">
								<a href="<%=projectPath %>/campaign/detail_Campaign.do"><img src="<%=projectPath %>/img/img_main/main_woman_01.jpg" alt="" /></a>
							</div>
						</div>
						<div class="dead_scroll_box flex w-full">
							<div class="d_box mx-2  flex-initial w-2/3">
								<div class="d_camBar   w-full my-2 h-8">
									<div id="d_emptyBar_02" class="relative mx-4  h-2 rounded">
										<div id="d_colorBar_02" class="relative top-0  bg-danger h-2 rounded"></div>
									</div>
								</div>
								<div class="d_camName  w-full h-16">
									<span>50%</span>
								</div>
								<div class="d_camTitle w-full h-16">문화재 복원 캠페인</div>
							</div>
							<div class="d_Img rounded-lg flex-initial w-1/3">
								<a href="<%=projectPath %>/campaign/detail_Campaign.do"><img src="<%=projectPath %>/img/img_main/main_temple_01.jpg"
									alt="" /></a>
							</div>
						</div>
						<div class="dead_scroll_box flex w-full">
							<div class="d_box mx-2  flex-initial w-2/3">
								<div class="d_camBar w-full my-2 h-8">
									<div id="d_emptyBar_03"
										class="relative mx-4  h-2 rounded">
										<div id="d_colorBar_03" class="relative top-0  bg-danger h-2 rounded"></div>
									</div>
								</div>
								<div class="d_camName  w-full h-16">
									<span>85%</span>
								</div>
								<div class="d_camTitle w-full h-16">사랑 나무 심기</div>
							</div> 
							<div class="d_Img rounded-lg flex-initial w-1/3">
								<a href="<%=projectPath %>/campaign/detail_Campaign.do"><img src="<%=projectPath %>/img/img_List/tree.jpg" alt="" /></a>
							</div>
						</div>
							<div class="dead_scroll_box flex w-full">
								<div class="d_box mx-2 rounded-lg flex-initial w-2/3">
									<div class="d_camBar  w-full my-2 h-8">
										<div id="d_emptyBar_04" class="relative mx-4  h-2 rounded">
											<div id="d_colorBar_04" class="relative top-0  bg-danger h-2 rounded"></div>
										</div>
									</div>
									<div class="d_camName  w-full h-16">
										<span>15%</span>
									</div>
									<div class="d_camTitle w-full h-16">사랑의 나눔</div>
								</div>
								<div class="d_Img rounded-lg flex-initial w-1/3">
									<a href="<%=projectPath %>/campaign/detail_Campaign.do"><img src="img/img_List/africa.jpg" alt="" /></a>
								</div>
							</div>
							<div class="dead_scroll_box flex w-full">
								<div class="d_box mx-2 rounded-lg flex-initial w-2/3">
									<div class="d_camBar w-full my-2 h-8">
										<div id="d_emptyBar_05" class="relative mx-4  h-2 rounded">
											<div id="d_colorBar_05" class="relative top-0  bg-danger h-2 rounded"></div>
										</div>
									</div>
									<div class="d_camName  w-full h-16">
										<span>45%</span>
									</div>
									<div class="d_camTitle w-full h-16">사랑의 나눔</div>
								</div>
								<div class="d_Img rounded-lg flex-initial w-1/3">
									<a href="/project_Ma/campaign/campaign_detail.html"><img src="img/img_List/boyukwon.jpg" alt="" /></a>
								</div>
							</div>
						</div>
					</div><!-- deadlineDiv -->
				</div><!-- preCamDiv 오픈예정-->
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