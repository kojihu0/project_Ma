package com.project_Ma.home.DAO;

import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.CampaignVO;
import com.project_Ma.home.VO.PaymentVO;
import com.project_Ma.home.VO.RewardVO;

public class PaymentDAO extends ConnectionDB{

	public PaymentDAO() {
	}
//	//마일리지 값 구하기 
//	public void mileageValue(PaymentVO vo){
//		try { 
//			connDB();
//			sql="select mileage_before from user_mileage where user_id=?";//user_mileage에서 마일리지값을 가져와서 보여준다..
//			pstmt= conn.prepareStatement(sql);
//			pstmt.setString(1,vo.getUser_id());
//			result = pstmt.executeQuery();
//			if(result.next()) {
//				vo.setMileageBefore(result.getInt(1));
//			}
//		}catch(Exception e) {
//			System.out.println("마일리지값 출력 실패"+e.getMessage());
//		}finally{
//			closeDB();
//		}
//	}
	
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
            sql="insert into payment("
            		+ " payment_no,"
            		+ " cam_no, "
            		+ " user_id, ";
	    			sql += " reward_no, ";
	    	
            	    sql += " funding_price, "
            		+ " add_price, "
            		+ " price_anonymous, "
            		+ " name_anonymous, "
            		+ " total_price, "
            		+ " donate_date, "
            		+ " reward_addr_num, "
            		+ " reward_addr_main, "
            		+ " reward_addr_sub, "
            		+ " reward_phone, "
            		+ " reward_tel, "
            		+ " payment_status,  "
            		+ " delivery_memo, "
            		+ " reciever, "
            		+ " reward_email"
            		+ ")"
            		+ "values(payment_sq.nextval, ?, ?";
            		if(vo.getReward_no() > 0) {
            			sql += ",?"	;
            		}else {
            			sql += ", 0";
            		}
            		sql += ", ?, ?, ?, ?, ?, to_date(sysdate,'yy-mm-dd'), ?, ?, ?, ?, ?, '결제 대기중', ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, cvo.getCam_no());
            pstmt.setString(2, vo.getUser_id());
            if(vo.getReward_no() > 0) {
            	
            	System.out.println(sql + "리워드 있는 것 sql" );
            	pstmt.setInt(3, vo.getReward_no());
	            pstmt.setInt(4, vo.getFunding_price());
	            pstmt.setInt(5, vo.getAdd_price());
	            pstmt.setInt(6, vo.getPrice_anonymous());
	            pstmt.setInt(7, vo.getName_anonymous());
	            pstmt.setInt(8, vo.getTotal_price());
	            pstmt.setString(9, vo.getReward_addr_num());
	            pstmt.setString(10, vo.getReward_addr_main());
	            pstmt.setString(11, vo.getReward_addr_sub());
	            pstmt.setString(12, vo.getReward_phone());
	            pstmt.setString(13, vo.getReward_tel());
	            pstmt.setString(14, vo.getDelivery_memo());
	            pstmt.setString(15, vo.getReciever());
	            pstmt.setString(16, vo.getReward_email());
            }else {
            	System.out.println(sql + "리워드 없는 것 sql" );
                pstmt.setInt(3, vo.getFunding_price());
                pstmt.setInt(4, vo.getAdd_price());
                pstmt.setInt(5, vo.getPrice_anonymous());
                pstmt.setInt(6, vo.getName_anonymous());
                pstmt.setInt(7, vo.getTotal_price());
                pstmt.setString(8, vo.getReward_addr_num());
                pstmt.setString(9, vo.getReward_addr_main());
                pstmt.setString(10, vo.getReward_addr_sub());
                pstmt.setString(11, vo.getReward_phone());
                pstmt.setString(12, vo.getReward_tel());
                pstmt.setString(13, vo.getDelivery_memo());
                pstmt.setString(14, vo.getReciever());
                pstmt.setString(15, vo.getReward_email());
            }
            result=pstmt.executeUpdate();

        }catch(Exception e) {
            System.out.println("결제 등록 ...."+e.getMessage());
        }finally {
            closeDB();
        }
        return result;
    }
	
	public void getrewardPrice(PaymentVO vo) {
		try {
			connDB();
			sql="select reward_price from reward WHERE reward_no=?";
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
			sql="select"
					+ " c.cam_title,"
					+ " c.user_id,"
					+ " to_char(c.cam_end, 'YYYY-MM-DD'),"
					+ " r.reward_name,"
					+ " c.cam_goal_price"
			+ " from campaign c join reward r on c.cam_no = r.cam_no and r.reward_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getReward_no());
			
			result = pstmt.executeQuery();
			while(result.next()) {
				cvo.setCam_title(result.getString(1));
				cvo.setUser_id(result.getString(2));
				cvo.setCam_end(result.getString(3));
				rvo.setReward_name(result.getString(4));
				cvo.setCam_goal_price(result.getInt(5));
			}
		}catch(Exception e) {
			System.out.println("결제예약완료 에러..."+e.getMessage());
		}finally {
			closeDB();
		}
	}

	public void getdonatedate(PaymentVO vo) {
        try {
            connDB();
            sql="select to_char(donate_date, 'YYYY-MM-DD') from payment where reward_no=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, vo.getReward_no());

            result = pstmt.executeQuery();
            if(result.next()) {
                vo.setDonate_date(result.getString(1));
            }

        }catch(Exception e) {
            System.out.println("펀딩 결제 날짜 에러...."+e.getMessage());
        }finally{
            closeDB();
        }
    }
	
}
