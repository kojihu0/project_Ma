package com.project_Ma.home.DAO;

import com.project_Ma.home.ConnectionDB;
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
	public int insertPayRecord(PaymentVO vo) {
		int result=0;
		try {
			connDB();
			sql="insert into payment(payment_no, cam_no, user_id, reward_no, funding_price, add_price, price_anonymous, name_anonymous, mileage, total_price, donate_date, reward_addr_num, reward_addr_main, reward_addr_sub, reward_phone "
			   +" , reward_tel, payment_status,  delivery_memo, reciever, reward_email)values(payment_sq.nextval, 1, 'admin', 0, ?, ?, ?, ?, ?, ?, to_date(sysdate,'yy-mm-dd'), ?, ?, ?, ?, ?, '결제 대기중', ?, ?, ?)  ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, vo.getFunding_price());
			pstmt.setInt(2, vo.getAdd_price());
			pstmt.setInt(3, vo.getPrice_anonymous());
			pstmt.setInt(4, vo.getName_anonymous());
			pstmt.setInt(5, vo.getMileage());
			pstmt.setInt(6, vo.getTotal_price());
			pstmt.setString(7, vo.getReward_addr_num());
			pstmt.setString(8, vo.getReward_addr_main());
			pstmt.setString(9, vo.getReward_addr_sub());
			pstmt.setString(10, vo.getReward_phone());
			pstmt.setString(11, vo.getReward_tel());
			pstmt.setString(12, vo.getDelivery_memo());
			pstmt.setString(13, vo.getReciever());
			pstmt.setString(14, vo.getReward_email());
			
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("결제내역 에러...."+e.getMessage());
		}finally {
			closeDB();
		}
		return result;
	}

}
