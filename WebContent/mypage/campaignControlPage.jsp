<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<ul class="mpMenu flex">
			  <li class="flex-1 mr-2">
			    <a class="text-center block border  rounded py-3 px-5 bg-danger hover:bg-danger-dark text-white" href="<%=projectPath %>/mypage/coporatePage.do">법인 정보</a>
			  </li>
			  <li class="flex-1 mr-2">
			    <a class="text-center block border  rounded py-3 px-5 bg-danger-dark hover:bg-danger-dark text-white" href="<%=projectPath %>/mypage/campaignControlPage.do">캠페인 관리</a>
			  </li>
			  <li class="flex-1 mr-2">
			    <a class="text-center block border  rounded py-3 px-5 bg-danger hover:bg-danger-dark text-white" href="<%=projectPath%>/mypage/campaignWrite.do">캠페인 등록</a>
			  </li>
			 </ul>
			 <!--캠페인관리-->
		 	 <div id="explain" class="w-full max-w-screen-xl my-2 mx-auto border-solid border-gray border-b  my-1 text-4xl py-4">캠페인 관리</div>
	 			
	 				<table id="table" class="table-auto">
					  <thead>
					    <tr>
					      <th class="px-4 py-2">등록 번호</th>
					      <th class="px-4 py-2">캠페인 명</th>
					      <th class="px-4 py-2">등록 일자</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr class="text-center">
					      <td class="border px-4 py-2">1</td>
					      <td class="border px-4 py-2"><a href="/project_Ma/mypage/campaign_update.html">기아에 허덕이는 아프리카 국민들을 위한 펀딩 프로젝트</a></td>
					      <td class="border px-4 py-2">858</td>
					    </tr>
					    <tr class="text-center">
					      <td class="border px-4 py-2">2</td>
					      <td class="border px-4 py-2">Adam</td>
					      <td class="border px-4 py-2">112</td>
					    </tr>
					    <tr class="text-center">
					      <td class="border px-4 py-2">3</td>
					      <td class="border px-4 py-2">Chris</td>
					      <td class="border px-4 py-2">1,280</td>
					    </tr>
					  </tbody>
					</table>
			</div><!-- 페이지 내용 #content -->
</body>
</html>
