<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>news_event</title>
</head>
<body>

		<!-- card_box start --> 
			<div class="card_box w-full my-0 mx-auto max-w-screen-xl"> 
				<!-- notice-navigation -->
				<nav id="notice-navigation" class="flex items-center justify-between flex-wrap flex-grow w-3/4 my-0 mx-auto pt-8">
						<ul class="notice-menu flex flex-wrap flex-grow block text-lg">  
							<li id="tab_01" class="notice_menu_item rounded-lg bg-danger text-white text-center flex items-center mr-2"><a href="<%=projectPath %>/news/notice.do" class="border ">공지사항</a></li>
							<li id="tab_02" class="notice_menu_item rounded-lg bg-danger-dark text-white text-center flex items-center mr-2"><a href="<%=projectPath %>/news/event.do" class="border">이벤트</a></li>
							<li id="tab_03" class="notice_menu_item rounded-lg bg-danger text-white text-center flex items-center mr-2"><a href="<%=projectPath %>/news/article.do" class="border ">보도자료</a></li> 
						</ul>  					   
				</nav><!-- notice-navigation end -->  
			
			
					<!-- 공지사항 폼 -->
						<div class="w-full my-0 mx-auto  max-w-screen-xl">  
							<div class="card mx-auto">    
								<div class="max-w-sm w-full lg:max-w-full lg:flex">  
									<div class="border-b border-l border-gray-lighte lg:border-l-0 lg:border-gray-lighte bg-white px-4 py-8 flex justify-between leading-normal">
					  					<div class="w-2/3">  
					    					<div class="mb-8"> 
					      		 				<p class="text-sm">   
					        						<i class="xi-lock text-brand"></i>
					       		 					2020-04-26   
					      						</p>  
					      						<div class="text-gray-darkest font-bold text-xl mb-2"><a href="<%=projectPath %>/news/newsContent.do">
					      							후원왕을 뽑자!</a></div>
					      	  					<p class="text-gray-dark text-base">  
					      	  						<a href="<%=projectPath %>/news/newsContent.do"> 
					      	  							ChariTree에서 이벤트를 시작합니다. 이 이벤트는...<br/>
					      	  						</a> 
					      	  					</p>
					    	  		 		</div> 
					   						<div>   
					  							<div class="admin_name text-sm"> 
					        						<p class="text-gray-darkest leading-none"><a href="<%=projectPath %>/news/newsContent.do">관리자 : 정진범</a></p>
					      						</div>  
					    					</div>  
					 					</div>  	 
					 					<div class="notice_img_box h-48 flex-initial w-1/3 rounded-t lg:rounded-t-none lg:rounded-l text-center"   title=""> 
					  						<a href="<%=projectPath %>/news/newsContent.do"></a>     
					  					</div>  
					 				</div>
								</div>
							</div>
						</div><!-- 공지사항 폼 end -->
						
						<!-- 공지사항 폼 -->
						<div class="w-full my-0 mx-auto  max-w-screen-xl">  
							<div class="card mx-auto">    
								<div class="max-w-sm w-full lg:max-w-full lg:flex">  
									<div class="border-b border-l border-gray-lighte lg:border-l-0 lg:border-gray-lighte bg-white px-4 py-8 flex justify-between leading-normal">
					  					<div class="w-2/3">  
					    					<div class="mb-8"> 
					      		 				<p class="text-sm">   
					        						<i class="xi-lock text-brand"></i>
					       		 					2020-04-21   
					      						</p>  
					      						<div class="text-gray-darkest font-bold text-xl mb-2"><a href="/project_Ma/news/newsContent.html">oo 법인에서 이벤트를 개최합니다. 해당 이벤트는 많은 .....</a></div>
					      	  					<p class="text-gray-dark text-base">  
					      	  						<a href="/project_Ma/news/newsContent.html">해당 법인에서 개최하는 이벤트는 후원을 한 사람의 수를 통해서....<br/>
					      	  						많은 참가 부탁드립니다.. ...</a> 
					      	  					</p>
					    	  		 		</div> 
					   						<div>   
					  							<div class="admin_name text-sm"> 
					        						<p class="text-gray-darkest leading-none"><a href="#">관리자 : 정진범</a></p>
					      						</div>  
					    					</div>  
					 					</div>  	 
					 					<div class="notice_img_box h-48 flex-initial w-1/3 rounded-t lg:rounded-t-none lg:rounded-l text-center"   title=""> 
					  						<a href="/project_Ma/news/newsContent.html"><img class="notice_img object-cover" src="../img/img_List/culture.jpg"/></a>  
					  					</div> 
					 				</div>
								</div>
							</div>
						</div><!-- 공지사항 폼 end -->
						 
					<ul class="pagenation flex items-center justify-center my-4 pb-4">
						<li class="page-item disabled"><a class="page-link block py-1 px-2 hover:text-brand pointer-events-none" href="#"><i class="xi-angle-left-min"></i></a></li>
						<li class="page-item acitve"><a class="page-link block py-1 px-2 hover:text-brand text-brand" href="#">1</a></li>
						<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">2</a></li>
						<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#">3</a></li>
						<li class="page-item"><a class="page-link block py-1 px-2 hover:text-brand" href="#"><i class="xi-angle-right-min"></i></a></li>
					</ul> 
				</div><!-- card_box end -->
			</div>
			
					   	<!-- 위로 이동 -->  
			<div class="page_up_div text-2xl border border-gray text-center rounded h-12 w-12 bg-black opacity-75 text-white">
					<a id="scrollToTop" class="align-middle" href="#"><i class="xi-angle-up"></i></a>  
			</div>      
				

</body>
</html>