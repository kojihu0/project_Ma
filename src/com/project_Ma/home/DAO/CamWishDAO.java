package com.project_Ma.home.DAO;

import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.WishlistVO;

public class CamWishDAO extends ConnectionDB {
	public CamWishDAO(){}
	public void selectCamWish(WishlistVO vo) {
		try {
			connDB();
			sql = "select wish_no, user_id, cam_no from user_wish"
					+ " where user_id=? and cam_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserid());
			pstmt.setInt(2, vo.getCamNo());
			System.out.println(sql);
			if(result.next()) {
				vo.setWishNo(result.getInt(1));
				vo.setUserid(result.getString(2));
				vo.setCamNo(result.getInt(3));
			}
		} catch (Exception e) {
			System.out.println("위시리스트 조회 에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
	public int insertCamWishlist(WishlistVO vo) {
		int cnt = 0;
		try {
			connDB();
			sql = "insert into user_wish(wish_no, user_id, cam_no, wish_regi)"
					+ " values(wish_sq.nextval, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserid());
			pstmt.setInt(2, vo.getCamNo());
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("위시리스트 등록 에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return cnt;
	}
}
