package com.project_Ma.home.DAO;

import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.CampaignVO;
import com.project_Ma.home.VO.PaymentVO;
import com.project_Ma.home.VO.RewardVO;

public class PaymentDAO extends ConnectionDB{

	public PaymentDAO() {
	}
	public void payment(RewardVO vo) {
		try {
			connDB();
			sql="select reward_price from reward where reward_no=? ";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getReward_no());
			result = pstmt.executeQuery();
			
			if(result.next()) {
				vo.setReward_price(result.getInt(1));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}
	public int insertPayRecord(PaymentVO vo, CampaignVO cvo) {
		int result=0;
		try {
			connDB();
			sql="insert into payment(payment_no, cam_no, user_id, reward_no, funding_price, add_price, price_anonymous, name_anonymous, mileage, total_price, donate_date, reward_addr_num, reward_addr_main, reward_addr_sub, reward_phone "
			   +" , reward_tel, payment_status,  delivery_memo, reciever, reward_email)values(payment_sq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, to_date(sysdate,'yy-mm-dd'), ?, ?, ?, ?, ?, '결제 대기중', ?, ?, ?)  ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cvo.getCam_no());
			pstmt.setString(2, vo.getUser_id());
			pstmt.setInt(3, vo.getReward_no());
			pstmt.setInt(4, vo.getFunding_price());
			pstmt.setInt(5, vo.getAdd_price());
			pstmt.setInt(6, vo.getPrice_anonymous());
			pstmt.setInt(7, vo.getName_anonymous());
			pstmt.setInt(8, vo.getMileage());
			pstmt.setInt(9, vo.getTotal_price());
			pstmt.setString(10, vo.getReward_addr_num());
			pstmt.setString(11, vo.getReward_addr_main());
			pstmt.setString(12, vo.getReward_addr_sub());
			pstmt.setString(13, vo.getReward_phone());
			pstmt.setString(14, vo.getReward_tel());
			pstmt.setString(15, vo.getDelivery_memo());
			pstmt.setString(16, vo.getReciever());
			pstmt.setString(17, vo.getReward_email());
			
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("결제 등록 ...."+e.getMessage());
		}finally {
			closeDB();
		}
		return result;
	}
	
	public void getFundingPrice(PaymentVO vo) {
		try {
			connDB();
			sql="select funding_price from payment p join reward r on p.reward_no = r.reward_no and reward_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getReward_no());
			
			result = pstmt.executeQuery();
			if(result.next()) {
				vo.setFunding_price(result.getInt(1));
			}
		}catch(Exception e) {
			System.out.println("펀딩금액 구하기 에러...."+e.getMessage());
		}finally {
			closeDB();
		}
	}
	
	public void getpaymentinfo(CampaignVO cvo, RewardVO rvo, PaymentVO vo) {
		try {
			connDB();
			sql="select c.cam_title, c.user_id, c.cam_end, r.reward_name from campaign c join reward r on c.reward_no = r.reward_no and reward_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getReward_no());
			
			result = pstmt.executeQuery();
			while(result.next()) {
				cvo.setCam_title(result.getString(1));
				cvo.setUser_id(result.getString(2));
				cvo.setCam_end(result.getString(3));
				rvo.setReward_name(result.getString(4));
			}
		}catch(Exception e) {
			System.out.println("결제예약완료 에러..."+e.getMessage());
		}finally {
			closeDB();
		}
	}

}
