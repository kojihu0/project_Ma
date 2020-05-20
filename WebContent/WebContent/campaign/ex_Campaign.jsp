<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

			<div id="explain" class="w-full max-w-screen-xl my-2 mx-auto border-solid border-gray border-b  my-1 text-4xl py-4">기록보기</div>
	    <div class="w-full max-w-screen-xl my-2 mx-auto">
		    <div class="inline-block relative w-40 my-10">
				  <select class="block appearance-none w-full bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline">
				    <option>최신순</option>
				    <option>펀딩금액순</option>
				    <option>펀딩달성도순</option>
				    <option>마감순</option>
			  	  </select>
			  	    <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
	    				<svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
	  				</div>
			 </div>
		 </div>
		<div id="total" class="w-full max-w-screen-xl my-0 mx-auto flex flex-wrap mb-12">
				<div class=" w-1/3 px-4 mb-12"><a href="#">
					<img src="../img/img_List/medical1.jpg" class="rounded-md"/>
					<div class="text-2xl my-2 hover:text-danger">생명을 살리는 아름다운 후원</div>
					<div class="my-1 font-thin">MEDICAL</div>
					<div class="relative w-full h-2 rounded-md bg-info-light">
						<div class="absolute w-full h-full border-solid border-gray border bg-danger rounded-md">
						</div>
					</div> 
					<div class="my-1">
						완료 <span class="float-right text-danger"></span>
					</div> 
				</a></div>
					<div class="w-1/3 px-4"><a href="#">
					<img src="../img/img_List/tree5.jpg" class="rounded-md"/>
					<div class="text-2xl my-2 hover:text-danger">푸른세상 만들기</div>
					<div class="my-1 font-thin">푸른나라</div>
					<div class="relative w-full h-2 rounded-md bg-info-light">
						<div class="absolute w-full h-full border-solid border-gray border bg-danger rounded-md">
						</div>
					</div> 
					<div class="my-1">
						완료 <span class="float-right text-danger"></span>
					</div> 
				</a></div>
				<div class="w-1/3 px-4"><a href="#">
					<img src="../img/img_List/boyukwon2.jpg" class="rounded-md"/>
					<div class="text-2xl my-2 hover:text-danger">아이들의 꿈에 날개를 달아주세요.</div>
					<div class="my-1 font-thin">아이세상</div>
					<div class="relative w-full h-2 rounded-md bg-info-light">
						<div class="absolute w-full h-full border-solid border-gray border bg-danger rounded-md">
						</div>
					</div> 
					<div class="my-1">
						완료 <span class="float-right text-danger"></span>
						</div>
				</a></div>
				<div class="w-1/3 px-4"><a href="#">
					<img src="../img/img_List/culture3.jpg" class="rounded-md"/>
					<div class="text-2xl my-2 hover:text-danger">우리 문화재 살리기</div>
					<div class="my-1 font-thin">우리 문화재</div>
					<div class="relative w-full h-2 rounded-md bg-info-light">
						<div class="absolute w-full h-full border-solid border-gray border bg-danger rounded-md">
						</div>
					</div> 
					<div class="my-1">
						완료 <span class="float-right text-danger"></span>
					</div> 
				</a></div>
				<div class="w-1/3 px-4"><a href="#">
					<img src="../img/img_List/dokdo1.jpg" class="rounded-md"/>
					<div class="text-2xl my-2 hover:text-danger">독도는 우리땅!!!</div>
					<div class="my-1 font-thin">독도 지킴이</div>
					<div class="relative w-full h-2 rounded-md bg-info-light">
						<div class="absolute w-full h-full border-solid border-gray border bg-danger rounded-md">
						</div>
					</div> 
					<div class="my-1">
						완료 <span class="float-right text-danger"></span>
					</div> 
				</a></div>
				<div class="w-1/3 px-4"><a href="#">
					<img src="../img/img_List/tree1.jpg" class="rounded-md"/>
					<div class="text-2xl my-2 hover:text-danger">천만그루 나무심기</div>
					<div class="my-1 font-thin">아이나무</div>
					<div class="relative w-full h-2 rounded-md bg-info-light">
						<div class="absolute w-full h-full border-solid border-gray border bg-danger rounded-md">
						</div>
					</div> 
					<div class="my-1">
						완료 <span class="float-right text-danger"></span>
					</div> 
				</a></div>
			</div>
			<div class="w-full max-w-screen-xl my-0 mx-auto mb-12">
				<ul class="flex justify-center" id="page">
					<li class="hover:text-danger"><a href="#"><i class="xi-angle-left"></i></a></li>
					<li class="hover:text-danger text-danger"><a href="#">1</a></li>
					<li class="hover:text-danger"><a href="#">2</a></li>
					<li class="hover:text-danger"><a href="#">3</a></li>
					<li class="hover:text-danger"><a href="#">4</a></li>
					<li class="hover:text-danger"><a href="#">5</a></li>
					<li class="hover:text-danger"><a href="#"><i class="xi-angle-right"></i></a></li>
				</ul>
			
						
					<!-- 위로 이동 -->  
			<div class="page_up_div text-2xl border border-gray text-center rounded h-12 w-12 bg-black opacity-75 text-white">
					<a id="scrollToTop" class="align-middle" href="#"><i class="xi-angle-up"></i></a>  
			</div>   
			

</body>
</html>