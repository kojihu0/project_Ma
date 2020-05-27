<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html> 
<head>
<meta http-equiv="Content-Type" charset="text/html; UTF-8">
<title>paymentProcess</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	$("input:checkbox").on("click", function(){
		if($("#name_anonymous").prop("checked")){
			$("#name_anonymous").val(1);
		}else{
			$("#name_anonymous").val(0);
		}
		if($("#price_anonymous").prop("checked")){
			$("#price_anonymous").val(1);
		}else{
			$("#price_anonymous").val(0);
		}
	});
});
	
	
	function openDaumZipAddress() {
		new daum.Postcode({
			oncomplete:function(data) {
				
				jQuery("#reward_addr_num").val(data.zonecode);
				jQuery("#reward_addr_main").val(data.address);
				jQuery("#reward_addr_sub").focus();
			}
		}).open();
	}
</script>
</head>
<body>
<form method="post" action="<%=projectPath%>/payment/paymentCompletedOk.do" onsubmit="return pay()">
	<div class="w-full max-w-screen-xl my-12 mx-auto">
				<div class="flex my-5">
					<div class="border w-40 h-8 text-center bg-danger text-white rounded">펀딩금액</div>
					<div>
						<a id="a"><div class="ml-24">펀딩금액이 많은이들에게 큰도움이 됩니다.</div></a>
						<div class="ml-24 mt-3"><input type="text" class="border h-12 text-center rounded" name="funding_price" id="fund" value="${vo.reward_price}" >원을 후원합니다</div>
						<div class="text-danger ml-24 hidden" id="a1">펀딩금액을 입력해주세요.</div>
						<div class="text-danger ml-24 hidden" id="a2">숫자를 입력해주세요.</div>
					</div>
				</div>
				<div class="flex my-5">
					<div class="border w-40 h-8 text-center bg-danger text-white rounded">후원금 더하기(선택)</div>
					<div> 
						<a id="z"><div class="ml-24">후원금을 더하여 펀딩할 수 있습니다. 추가 후원금을 입력하시겠습니까?</div></a>
						<div class="ml-24 mt-3"><input type="text" class="border h-12 text-center rounded" name="add_price" id="addFund">원을 추가로 후원합니다</div>
						<div class="text-danger ml-24 hidden" id="z1">숫자를 입력해주세요.</div>
					</div>
				</div>
				<div class="flex my-5">
					<div class="border w-40 h-8 text-center bg-danger text-white rounded">공개여부(선택)</div>
					<div>
						<div class="ml-24">참여자 목록에 참여자 이름과 펀딩금액이 공개됩니다. 혹시,조용히 후원하고 싶으시다면,비공개로 선택해주세요.</div>
						<div class="flex">
							<label class="inline-flex items-center">
								<div class="ml-24 mt-3"><input type="checkbox" name="name_anonymous" class="border h-12 mr-2 w-5 h-5" id="name_anonymous" value="0"></div>
					    		<span style="position:relative; top:2px;">이름 비공개</span>
					    	</label>
					    	<label class="inline-flex items-center">
								<div class="ml-24 mt-3"><input type="checkbox" name="price_anonymous" class="border h-12 mr-2 w-5 h-5" id="price_anonymous" value="0"></div>
					    		<span style="position:relative; top:2px;">펀딩 금액 비공개</span>
					    	</label>
						</div>
					</div>
					
				</div>
				<div class="flex my-5">
					<div class="border w-40 h-8 text-center bg-danger text-white rounded">마일리지 사용</div>
					<div> 
						<div class="flex">
							<div class="ml-24"><input type="checkbox" class="border mr-2 w-5 h-5" id="mBox"/></div>
							<a id="mile1"><div style="position:relative; top:-3px;">모두사용(보유 마일리지 <span id="mileage">1234</span>M)</div></a>
						</div>
						<input type="text" class="border h-12 ml-24 mt-3 text-center rounded" name="mileage" id="mTxt">M 사용하기
						<div class="text-danger ml-24 hidden" id="txt">입력하신 값이 보유하신 마일리지보다 높습니다. 사용불가 합니다.</div>
						<div class="text-danger ml-24 hidden" id="mile2">숫자를 입력해주세요.</div>
					</div> 
				</div>
				<div class="flex my-5">
					<div class="border w-40 h-8 text-center bg-danger text-white rounded">최종금액</div>
					<div>
						<div class="ml-24 leading-8">총 <span id="total" name="total_price">0</span>원을 후원합니다</div>
					</div>
				</div>
				<div class="my-5 text-xl">배송지 정보</div>
				<div class="flex my-5">
					<div>수령인<i class="xi-star text-xl" style="color:rgb(255,153,000)"></i></div>
					<a id="b"><input type="text" class="border h-8 ml-24 rounded" name="reciever" id="name"/></a>
					<div class="text-danger ml-5 hidden" id="b1">수령인을 한글(2~7자리)로 입력해주세요.</div>
				</div>
				<div class="flex my-5">
					<div>이메일<i class="xi-star text-xl" style="color:rgb(255,153,000)"></i></div>
					<a id="f"><div>  
						<input type="text" name="id" class="border h-8 ml-24 rounded email1"/>@  
						<input id="domain" name="domain" type="text" class="border h-8 text-center rounded email2"/> 	
						<div class="inline-block relative w-40">
							<select id="email" onclick="inputDomain()" class="block appearance-none w-full bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline">
								<option>직접입력</option>
							    <option>naver.com</option>
							    <option>daum.net</option>
							    <option>gmail.com</option>
							    <option>hotmail.com</option>
							    <option>nate.com</option>
							    <option>korea.com</option>
							    <option>chollian.net</option>
						  	 </select>
						  	 <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
				    			<svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
				  			</div>
			 			</div>
			 			<div class="text-danger hidden" id="f1" style="margin-left:250px">이메일을 입력해주세요.</div>
			 			<div class="text-danger hidden" id="f2" style="margin-left:250px">잘못된 이메일형식입니다. 다시입력해주세요.</div>
					</div></a>
				</div>
					<div class="flex my-5">
					<div>연락처1<i class="xi-star text-xl" style="color:rgb(255,153,000)"></i></div>
					<a id="c"><div class="ml-24 flex">
					     <div class="h-8 w-40 text-center">010</div>
				 		- <input type="text" name="reward_phone1" class="border h-8 ml-1 mr-1 text-center rounded tel1" maxlength="4"/>
						- <input type="text" name="reward_phone2" class="border h-8 ml-1 text-center rounded tel2" maxlength="4"/>
					</div></a>
					<div class="text-danger ml-5 hidden" id="c1">연락처를 입력해주세요.</div>
					<div class="text-danger ml-5 hidden" id="c2">숫자 4자리를 입력해주세요.</div>
				</div>
				<div class="flex my-5">
					<a id="n"><div>연락처2</div></a>
					<div>
						<div class="inline-block relative w-40 ml-24">
							<select name="reward_tel1" class="block appearance-none w-full bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline">
								   <option>02</option>
								   <option>051</option>
								   <option>053</option>
								   <option>032</option>
								   <option>062</option>
								   <option>042</option>
								   <option>052</option>
								   <option>044</option>
								   <option>031</option>
								   <option>033</option>
								   <option>043</option>
								   <option>063</option>
								   <option>061</option>
								   <option>054</option>
								   <option>055</option>
								   <option>064</option>
							  </select>
							<div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
					    		<svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
					  		</div>
				 		</div>
				 		- <input name="reward_tel2" type="text" class="border h-8 text-center rounded tel3" maxlength="4"/>
						- <input name="reward_tel3" type="text" class="border h-8 text-center rounded tel4" maxlength="4"/>
						<div class="text-danger hidden" style="margin-left:300px;"id="n1">숫자를 입력해주세요.</div>
						<div class="text-danger hidden" style="margin-left:300px;" id="n2">잘못된 연락처입니다. 다시 입력해주세요.</div>
					</div>
				</div>
				<div class="flex my-5">
					<div>배송지<i class="xi-star text-xl" style="color:rgb(255,153,000)"></i></div>
					<a id="d"><div class="ml-24">
						<div class="flex">
							<input id="reward_addr_num" name="reward_addr_num" type="text" class="border h-8 w-32 rounded addr1 text-center" maxlength="5" readonly/>
							<input type="button" onClick="openDaumZipAddress();" class="ml-3 border rounded w-20" value="주소검색"/>
							<div class="text-danger ml-5 hidden" id="d1">주소를 입력해주세요.</div>
							<div class="text-danger ml-5 hidden" id="d2">잘못된 형식입니다. 다시 입력해주세요</div>
						</div>
						<input id="reward_addr_main" name="reward_addr_main" type="text" class="border mt-3 h-8 rounded addr2" style="width:630px" readonly>
						<div><input id="reward_addr_sub" name="reward_addr_sub" type="text" class="border mt-3 h-8 rounded" style="width:315px"placeholder="상세주소"></div>
					</div></a>
				</div>
				<div class="flex my-5">
					<div>배송메모</div>
					<div class="ml-20">
						<textarea id="delivery_memo" name="delivery_memo" class="border rounded" style="width:640px; height:100px;" maxlength="100"></textarea>
						<div><span id="txtLength">0</span>/100</div>
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
				<div class="border mb-12" style="width:950px; background:rgb(204,204,204);">
					<div class="flex" style="width:950px;">
						<div class="w-1/2 my-4 mx-3">
							<div class="mx-2 my-3">신용(체크카드)번호</div>
							<div class="flex">
								<input type="text" class="w-16 h-10 mx-2 border bg-white rounded text-center cn1" maxlength="4">
								<input type="text" class="w-16 h-10 mx-2 border bg-white rounded text-center cn2" maxlength="4">
								<input type="text" class="w-16 h-10 mx-2 border bg-white rounded text-center cn3" maxlength="4">
								<input type="text" name="payment_card_num" class="w-16 h-10 mx-2 border bg-white rounded text-center cn4" maxlength="4">
							</div>
							<div class="text-danger mx-2 hidden" id="g1">신용(체크카드)번호 16자리를 입력해주세요</div>
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
							<div class="text-danger mx-2 hidden" id="j1">유효기간을 선택해주세요.</div>
						</div>
					</div>
					<div class="flex" style="width:950px">
						<div class="w-1/2 my-4 mx-3">
							<div class="mx-2 my-3">비밀번호 앞 2자리</div>
							<div class="flex">
								<input type="text" class="w-16 h-10 mx-2 border bg-white rounded text-center pw" maxlength="2">
								<div class="leading-10">●●</div>
							</div>
							<div class="text-danger mx-3 hidden" id="h1">비밀번호 앞2자리를 입력해주세요.</div>
						</div>
						<div class="w-1/2 my-4 mx-3">
							<div class="mx-2 my-3">생년월일(주민등록번호 앞 6자리)</div>
							<input type="text" class="w-40 h-10 border mx-2 bg-white rounded text-center birth" maxlength="10">
							<div class="mx-2 mt-1 text-danger">법인카드의 경우 사업자등록번호 10자리 입력</div>
							<div class="text-danger mx-2 hidden" id="i1">생년월일(주민등록번호 앞 6자리) 또는 사업자등록번호 10자리를 입력해주세요.</div>
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
						'펀딩하기'를 통한 결제 및 리워드 전달 서비스를 제공하기 위해, 이용자의 사전 동의 아래 제3자(프로젝트 메이커)에게 제공합니다.<br>
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
			    <div class="w-32 h-10 border my-20 mx-auto text-center rounded ">
					<input type="submit" value="결제 예약하기"class="justify-center leading-9 h-full w-full" id="payReser"/></div>
			</div>
		</form>
</body>
</html>