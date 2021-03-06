<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/include/loginCheck.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="w-full max-w-screen-xl my-0 mx-auto">
		<div class="w-full h-40 text-center text-4xl my-8" style="line-height:160px;">후원이 정상적으로 완료되었습니다.</div>
		<!------------------------------- 리워드 -------------------------------------->
		<div class="w-full my-5"style="background:rgb(240,255,255)">
			<div class="mx-8 py-2">
				<div class="my-5 text-xl">펀딩정보</div>
				<div class="text-4xl underline">${cvo.cam_title}</div>
				<div class="text-xl">by <span class="underline">${cvo.user_id}</span></div>
				<hr class="my-5">
				<div class="flex items-center justify-between my-2 text-xl">
					<span>펀딩번호</span>
					<span>${cvo.cam_no}</span>
				</div>
				<div class="flex items-center justify-between my-2 text-xl">
					<span>펀딩날짜</span>
					<span>${vo.donate_date}</span>
				</div>
				<div class="flex items-center justify-between my-2 text-xl">
					<span>펀딩마감일</span>
					<span>${cvo.cam_end}</span>
				</div>
				<div class="flex items-center justify-between my-2 text-xl">
					<span>펀딩모금액</span>
					<span>${cvo.cam_goal_price}</span>
				</div>
				<div class="flex items-center justify-between my-2 text-xl">
					<span>펀딩상태</span>
					<span>진행중</span>
				</div>
			</div>
		</div><!------------------------------- 리워드 -------------------------------------->
		<!---------------------------------- 결제내역 ---------------------------------------->
		<c:if test="${cvo.cam_reward_status==1}">
			<div class="w-full mt-5"style="background:rgb(240,255,255)">
				<div class="mx-8 py-2">
					<div class="my-5 text-xl">결제내역</div>
					<div class="text-3xl">${rvo.reward_name}</div>
					<div class="flex items-center justify-between my-2 text-xl">
						<span>배송메모</span>
						<span>${vo.delivery_memo}</span>
					</div>
					<div class="text-xl">발송 시작일 : 결제완료 후 2~3일 후</div>
				</div>
			</div>
		</c:if>
		<div class="w-full mb-5" style="background:rgb(175,238,238)">
			<div class="mx-8 py-2">
				<div class="flex items-center justify-between my-2 text-xl">
					<span>펀딩금액</span>
					<span>${vo.funding_price}</span>
				</div>
				<!--<div class="flex items-center justify-between my-2 text-xl">
					<span>마일리지 차감금액</span>
					<span>${vo.mileage}</span>
				</div>-->
				<div class="flex items-center justify-between my-2 text-xl">
					<span>추가 후원금액</span>
					<span>${vo.add_price}원</span>
			    </div>
			    <c:if test="${cvo.cam_reward_status==1}">
				    <div class="flex items-center justify-between my-2 text-xl">
						<span>배송비</span>
						<span>3,000원</span>
			   		 </div>
			    </c:if>
				<hr/>
				<div class="flex items-center justify-between my-2 text-xl">
					<span>최종 결제 금액</span>
					<span>${vo.total_price}원</span>
			    </div>
			 </div>
		</div>
		<div class="w-full my-5"style="background:rgb(240,255,255)">
			<div class="mx-8 py-2">
				<div class="my-5 text-xl">결제정보</div>
				<div class="flex items-center justify-between my-2 text-xl">
					<span>결제방법</span>
					<span>신용(체크)카드</span>
			    </div>
			    <div class="flex items-center justify-between my-2 text-xl">
					<span>카드번호</span>
					<span>************${vo.payment_card_num}</span>
			    </div>
			</div>
		</div>
		<c:if test="${cvo.cam_reward_status == 1}">
			<div class="w-full mt-5 mb-16"style="background:rgb(240,255,255)">
				<div class="mx-8 py-2">
					<div class="my-5 text-xl">배송지 정보</div>
					<div class="text-xl">${vo.reciever}</div>
					<div class="text-xl">${vo.reward_phone}</div>
					<div class="my-2 text-xl">|${vo.reward_addr_num}|${vo.reward_addr_main} ${vo.reward_addr_sub}</div>
					<hr/>
					<div class="my-2 text-xl">배송상태</div>
					<div class="my-2 text-danger text-xl">배송 준비중</div>
				</div>
				
			</div>
		</c:if>
		<!---------------------------------- 결제내역 ---------------------------------------->
		<div class="w-24 h-10 border my-5 mx-auto text-center rounded home leading-9"><a href="<%=projectPath%>/index.do">홈으로</a></div>

</div> 





</body>
</html>