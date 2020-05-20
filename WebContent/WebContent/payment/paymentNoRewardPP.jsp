<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<div class="w-full max-w-screen-xl my-12 mx-auto">
				<div class="flex my-5">
					<div class="border w-40 h-8 text-center bg-danger text-white rounded">펀딩금액</div>
					<div>
						<a id="a"><div class="ml-24">펀딩금액이 많은이들에게 큰도움이 됩니다.</div></a>
						<div class="ml-24 mt-3"><input type="text" class="border h-12 text-center" id="fund" >원을 후원합니다</div>
						<div class="text-danger ml-24 hidden" id="a1">펀딩금액을 입력해주세요.</div>
						<div class="text-danger ml-24 hidden" id="a2">숫자를 입력해주세요.</div>
					</div>
				</div>
				<div class="flex my-5">
					<div class="border w-40 h-8 text-center bg-danger text-white rounded">후원금 더하기(선택)</div>
					<div>
						<a id="z"><div class="ml-24">후원금을 더하여 펀딩할 수 있습니다. 추가 후원금을 입력하시겠습니까?</div></a>
						<div class="ml-24 mt-3"><input type="text" class="border h-12 text-center" id="addFund">원을 추가로 후원합니다</div>
						<div class="text-danger ml-24 hidden" id="z1">숫자를 입력해주세요.</div>
					</div>
				</div>
				<div class="flex my-5">
					<div class="border w-40 h-8 text-center bg-danger text-white rounded">공개여부(선택)</div>
					<div>
						<div class="ml-24">참여자 목록에 참여자 이름과 펀딩금액이 공개됩니다. 혹시,조용히 후원하고 싶으시다면,비공개로 선택해주세요.</div>
						<div class="flex">
							<label class="inline-flex items-center">
								<div class="ml-24 mt-3"><input type="checkbox" class="border h-12 mr-2 w-5 h-5"></div>
					    		<span style="position:relative; top:2px;">이름 비공개</span>
					    	</label>
					    	<label class="inline-flex items-center">
								<div class="ml-24 mt-3"><input type="checkbox" class="border h-12 mr-2 w-5 h-5"></div>
					    		<span style="position:relative; top:2px;">펀딩 금액 비공개</span>
					    	</label>
						</div>
					</div>
					
				</div>
				<div class="flex my-5">
					<div class="border w-40 h-8 text-center bg-danger text-white rounded">마일리지 사용</div>
					<div> 
						<div class="flex">
							<div class="ml-24"><input type="checkbox" class="border mr-2 w-5 h-5" id="mBox"></div>
							<a id="mile1"><div style="position:relative; top:-3px;">모두사용(보유 마일리지 <span id="mileage">1234
							</span>M)</div></a>
						</div>
						<input type="text" class="border h-12 ml-24 mt-3 text-center" id="mTxt">M 사용하기
						<div class="text-danger ml-24 hidden" id="txt">입력하신 값이 보유하신 마일리지보다 높습니다. 사용불가 합니다.</div>
						<div class="text-danger ml-24 hidden" id="mile2">숫자를 입력해주세요.</div>
					</div> 
				</div>
				<div class="flex my-5">
					<div class="border w-40 h-8 text-center bg-danger text-white rounded">최종금액</div>
					<div>
						<div class="ml-24">총 <span id="total">0</span>원을 후원합니다</div>
					</div>
				</div>
				<div class="my-5 text-xl">결제 예약</div>
				<div class="border w-40 h-8 text-center bg-danger text-white rounded">결제예약 수단 선택</div>
				<a id="e"><div class="flex my-5">
					<div><input type="checkbox" class="border mr-2 border-gray-400 w-5 h-5" id="card"></div>
					<div class="text-lg" style="position:relative; top:-4px">신용(체크)카드</div> 
					<div class="text-danger ml-5 hidden" id="e1">결제예약 수단을 선택해주세요.</div>
				</div></a>
				<div class="mb-10">현재 신용(체크)카드 결제만 제공중으로 결제에 어려움이 있으시다면 죄송합니다. 다른 결제 수단도 곧 추가할 예정이오니 양해부탁드립니다.</div>
				<a id="g"><div class="border w-40 h-8 text-center bg-danger text-white rounded my-5">결제 정보 입력</div></a>
				<div class="border mb-12" style="width:950px; background:rgb(240,128,128);">
					<div class="flex" style="width:950px;">
						<div class="w-1/2 my-4 mx-3">
							<div class="mx-2 my-3">신용(체크카드)번호</div>
							<div class="flex">
								<input type="text" class="w-16 h-10 mx-2 border bg-white rounded text-center cn1" maxlength="4">
								<input type="text" class="w-16 h-10 mx-2 border bg-white rounded text-center cn2" maxlength="4">
								<input type="text" class="w-16 h-10 mx-2 border bg-white rounded text-center cn3" maxlength="4">
								<input type="text" class="w-16 h-10 mx-2 border bg-white rounded text-center cn4" maxlength="4">
							</div>
							<div class="text-white mx-2 hidden" id="g1">신용(체크카드)번호 16자리를 입력해주세요</div>
						</div>
						<div class="w-1/2 my-4 mx-3">
							<div class="mx-2 my-3">유효기간</div>
							<div class="flex">
								<div class="inline-block relative w-40 mx-2">
									<select class="block appearance-none w-full bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline month">
										<option>월</option>
									    <option>01</option>
									    <option>02</option>
									    <option>03</option>
									    <option>04</option>
									    <option>05</option>
									    <option>06</option>
									    <option>07</option>
									    <option>08</option>
									    <option>09</option>
									    <option>10</option>
									    <option>11</option>
									    <option>12</option>
						  	 		</select>
						  		    <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
				    			    	<svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
				  				    </div>
			 					</div>
			 					<div class="inline-block relative w-40 mx-2">
									<select class="block appearance-none w-full bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline year">
										<option>년</option>
									    <option>2020</option>
									    <option>2021</option>
									    <option>2022</option>
									    <option>2023</option>
									    <option>2024</option>
									    <option>2025</option>
									    <option>2026</option>
									    <option>2027</option>
									    <option>2028</option>
									    <option>2029</option>
									    <option>2030</option>
									    <option>2031</option>
						  	 		</select>
						  		    <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
				    			    	<svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
				  				    </div>
			 					</div>
							</div>
							<div class="text-white mx-2 hidden" id="j1">유효기간을 선택해주세요.</div>
						</div>
					</div>
					<div class="flex" style="width:950px">
						<div class="w-1/2 my-4 mx-3">
							<div class="mx-2 my-3">비밀번호 앞 2자리</div>
							<div class="flex">
								<input type="text" class="w-16 h-10 mx-2 border bg-white rounded text-center pw" maxlength="2">
								<div class="leading-10">●●</div>
							</div>
							<div class="text-white mx-3 hidden" id="h1">비밀번호 앞2자리를 입력해주세요.</div>
						</div>
						<div class="w-1/2 my-4 mx-3">
							<div class="mx-2 my-3">생년월일(주민등록번호 앞 6자리)</div>
							<input type="text" class="w-40 h-10 border mx-2 bg-white rounded text-center birth" maxlength="10">
							<div class="mx-2 mt-1 text-gray">법인카드의 경우 사업자등록번호 10자리 입력</div>
							<div class="text-white mx-2 hidden" id="i1">생년월일(주민등록번호 앞 6자리) 또는 사업자등록번호 10자리를 입력해주세요.</div>
						</div>
					</div>
				</div>
				<a id="k"><div class="h-40 w-full border overflow-y-auto mt-5">
					<div class="text-center text-lg my-5">제 1조 결제</div>
					①회원은회사가 제공하는 결제수단을 통하여 후원에 참여할 수 있습니다.<br>
					②후원 취소는 프로젝트의 후원 마감기한 이내에만 가능하며, 후원 금액을 수정하고 싶은 경우는 이전 결과를 취소한 후 재결제를 하여야 합니다. <br>
					③회원은 하나의 프로젝트에 중복으로 참여할 수 있으며, 참여시 최저금액은 각 펀딩의 최저금액 이상입니다.<br>
					④신용카드 및 체크카드로 결제 시 최저 금액은 각 펀딩의 최저금액 이상입니다.<br>
					⑤회사에 운영하는 마일리지 정책에 따라 리워드 마일리지를 사용하여 결제할 수 있습니다.<br>
					⑥<br>
					⑦<br>
					⑧<br>
					⑨<br>
					⑩
				</div></a>
				<div class="mt-2">
					<label class="inline-flex items-center">
						  <input type="checkbox" name="chk" class="border mr-2 w-5 h-5" id="clause1">
						  <span>본인은 위 리워드 서비스 결제 및 취소와 환불규정 등의 주의사항을 모두 읽어보았으며 이에 동의합니다.</span>
				    </label>
			    </div>
			    <div class="text-danger hidden" id="k1">동의사항 확인부탁드립니다.</div>
			    
			    <a id="l"><div class="h-40 w-full border overflow-y-auto" style="margin-top:70px;">
					<div class="text-center text-lg my-5">제 3자에 대한 개인정보 제공 동의</div>
					<div>
						'펀딩하기'를 통한 결제 서비스를 제공하기 위해, 이용자의 사전 동의 아래 제3자(프로젝트 메이커)에게 제공합니다.<br>
						메이커에게 전달되는 개인 정보는 기재된 목적 달성 후 파기에 대한 책임이 메이커에게 있으면, 파기하지 않아 생기는 문제에 대한 법적 책임은 메이커에게 있습니다.<br>
						아래 내용에 대하여 동의를 거부하실 수 있으며, 거부시 서비스 이용이 제한됩니다.<br>
						<br>
						<span class="text-lg">개인 정보 이용 내역</span><br>
						1<br>2<br>3<br>4<br>5<br>
					</div>
				</div></a>
				<div class="mt-2">
					<label class="inline-flex items-center">
						  <input type="checkbox" name="chk" class="border mr-2 w-5 h-5" id="clause2">
						  <span>본인은 제3자에 대한 개인정보제공에 동의합니다.</span>
				    </label>
			    </div>
			    <div class="text-danger hidden" id="l1">동의사항 확인부탁드립니다.</div>
			    
			    <a id="m"><div class="h-40 w-full border overflow-y-auto" style="margin-top:70px;">
					<div class="text-center text-lg my-5">책임 규정</div>
					<div>
						ChariTree는 플랫폼을 제공하는 중개자(통신판매중개자)로 크라우드펀딩을 받는 당사자가 아님니다.<br>
						보삼품 제공 등에 관한 지연, 제품의 하자 등으로 인한 일체의 법적책임은 펀딩을 받는 프로젝트 개설자가 부담합니다.<br>
						하지만 와디즈는 프로젝트 진행자와 후원자간의 원할한 의사소통을 위해 최선의 노력을 다하고 있습니다. 
					</div>
				</div></a>
				<div class="mt-2">
					<label class="inline-flex items-center">
						  <input type="checkbox" name="chk" class="border mr-2 w-5 h-5" id="clause3">
						  <span>본인은 위 내용을 확인하였으며 이에 동의합니다.</span>
				    </label>
			    </div>
			    <div class="text-danger hidden" id="m1">동의사항 확인부탁드립니다.</div>
			    
			    <div class="mt-2 float-right">
			    	<label class="inline-flex items-center">
						  <input type="checkbox" id="chkAll" class="border mr-2 w-5 h-5">
						  <span>모두 동의합니다.</span>
				    </label>
			    </div>
			    <a href="/project_Ma/payment/paymentCompleted.html" id="pay"><div class="w-32 h-10 border my-20 mx-auto text-center rounded ">
					<div class="justify-center leading-9">결제 예약하기</div>
				</div></a>
			</div>

</body>
</html>