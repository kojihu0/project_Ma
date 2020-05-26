<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>serviceCenter</title>
<script>
var qna = 1;
$(function(){ 
	function qnaLoading(){
		var url ="<%=projectPath%>/contact/serviceCenterAjax.do";
	
		$.ajax({
			url : url,
			data : "pageNum="+qna,
			success: function(result){
				
				var tag1= result.indexOf("<hr id='zzz'>");
				var tag2= result.indexOf("<hr id='dddd'>");
				var tag3= result.substring(tag1 + 13,tag2);
				
				console.log("값이 왜 안가지?");
				
				$("#qna").html(tag3); 
	 
			}, 
			error: function(){ 
				console.log("게시판 ajax 에러");
			}
		}); 
	}
	qnaLoading();
	//페이지 번호 눌렀을 때 
	$(document).on("click", '#main_QnA_page li a' ,function(e){		
		e.preventDefault(); 		
		if($(this).text()==""){ 
			if($(this).find("i").attr("class") == "xi-angle-right-min"){
				qna++;
			}
			if($(this).find("i").attr("class") == "xi-angle-left-min"){
				qna--;
			}
		}else{
			
			qna = $(this).text();		
		}
	qnaLoading()
	});
	
});//$(document).ready(furnction(){}); end

</script>



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
						
					
					
					
					</div><!--문의-->
				</div>  
			</div>	 
</body>
</html>