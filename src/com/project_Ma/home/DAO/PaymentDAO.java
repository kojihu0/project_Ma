package com.project_Ma.home.DAO;

import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.PaymentVO;

public class PaymentDAO extends ConnectionDB{

	public PaymentDAO() {
	}
	public void payment(PaymentVO vo) {
		try {
			connDB();
			sql="select * reward_price from reward where reward_no=? ";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getReward_no());
			result = pstmt.executeQuery();
			
			if(result.next()) {
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}

}
