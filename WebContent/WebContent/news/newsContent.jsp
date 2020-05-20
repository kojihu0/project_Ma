<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>newsContent</title>
</head>
<body>

	<div class="document w-full max-w-screen-xl my-0 mx-auto py-16">
				<div class="document-header pb-8 border-b-2 border-gray">
					<h1 class="mb-4 font-bold">ChariTree에서 알려드립니다.</h1>
					<div class="flex">
						<div class="mr-8"><span class="font-bold mr-2">작성자</span>관리자</div>
						<div><span class="font-bold mr-2">작성일</span>2020-05-01</div> 
					</div>
				</div>
				<div class="document-content mx-4 py-8">
					<img src="<%=projectPath %>/img/chariTree_logo.png">
					<p>법관이 중대한 심신상의 장해로 직무를 수행할 수 없을 때에는 법률이 정하는 바에 의하여 퇴직하게 할 수 있다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다.</p>
					<p>대통령이 제1항의 기간내에 공포나 재의의 요구를 하지 아니한 때에도 그 법률안은 법률로서 확정된다. 국회의원은 그 지위를 남용하여 국가·공공단체 또는 기업체와의 계약이나 그 처분에 의하여 재산상의 권리·이익 또는 직위를 취득하거나 타인을 위하여 그 취득을 알선할 수 없다. 국가는 주택개발정책등을 통하여 모든 국민이 쾌적한 주거생활을 할 수 있도록 노력하여야 한다.</p>
					<p>군인 또는 군무원이 아닌 국민은 대한민국의 영역안에서는 중대한 군사상 기밀·초병·초소·유독음식물공급·포로·군용물에 관한 죄중 법률이 정한 경우와 비상계엄이 선포된 경우를 제외하고는 군사법원의 재판을 받지 아니한다. 전직대통령의 신분과 예우에 관하여는 법률로 정한다. 나는 헌법을 준수하고 국가를 보위하며 조국의 평화적 통일과 국민의 자유와 복리의 증진 및 민족문화의 창달에 노력하여 대통령으로서의 직책을 성실히 수행할 것을 국민 앞에 엄숙히 선서합니다.</p>
					<p>국회는 선전포고, 국군의 외국에의 파견 또는 외국군대의 대한민국 영역안에서의 주류에 대한 동의권을 가진다. 새로운 회계연도가 개시될 때까지 예산안이 의결되지 못한 때에는 정부는 국회에서 예산안이 의결될 때까지 다음의 목적을 위한 경비는 전년도 예산에 준하여 집행할 수 있다. 국무회의는 정부의 권한에 속하는 중요한 정책을 심의한다.</p>
					<p>법관은 헌법과 법률에 의하여 그 양심에 따라 독립하여 심판한다. 대통령의 임기는 5년으로 하며, 중임할 수 없다. 제3항의 승인을 얻지 못한 때에는 그 처분 또는 명령은 그때부터 효력을 상실한다. 이 경우 그 명령에 의하여 개정 또는 폐지되었던 법률은 그 명령이 승인을 얻지 못한 때부터 당연히 효력을 회복한다.</p>
				</div>
				<div class="document-footer">
					<div class="share text-2xl text-gray-darker my-4 text-right">
						<button title="페이스북에 공유하기" data-sns="facebook" data-url="charitree.fezze.name" class="btn-share-sns inline-block w-8 h-10 leading-10 text-center hover:text-brand duration-300"><i class="xi-facebook"></i></button>
						<button title="카카오톡에 공유하기" data-sns="kakaotalk" data-url="charitree.fezze.name" data-text="ChariTree" class="btn-share-sns inline-block w-8 h-10 leading-10 text-center hover:text-brand duration-300"><i class="xi-kakaotalk"></i></button>
						<button title="트위터에 공유하기" data-sns="twitter" data-url="charitree.fezze.name" data-text="ChariTree" class="btn-share-sns inline-block w-8 h-10 leading-10 text-center hover:text-brand duration-300"><i class="xi-twitter"></i></button>
						<button title="URL 복사" data-clipboard-text="https://charitree.fezze.name" class="copy_url inline-block w-8 h-10 leading-10 text-center hover:text-brand duration-300"><i class="xi-link"></i></button>
					</div>
					<div class="flex justify-between">
						<a class="block bg-brand hover:bg-brand-dark text-white py-2 px-4" href="#">이전 글</a>  
						<a class="block bg-brand hover:bg-brand-dark text-white py-2 px-4" href="<%=projectPath %>/news/article.do">목록으로</a>
						<a class="block bg-brand hover:bg-brand-dark text-white py-2 px-4" href="#">다음 글</a>
					</div>
				</div>
			</div>
				
			<!-- 위로 이동 -->  
			<div class="page_up_div text-2xl border border-gray text-center rounded h-12 w-12 bg-black opacity-75 text-white">
					<a id="scrollToTop" class="align-middle" href="#"><i class="xi-angle-up"></i></a>  
			</div>   

</body>
</html>