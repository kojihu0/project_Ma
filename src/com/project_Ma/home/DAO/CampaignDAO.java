package com.project_Ma.home.DAO;

import java.sql.SQLException;
import java.sql.Savepoint;
import java.util.ArrayList;
import java.util.List;

import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.CamCommentVO;
import com.project_Ma.home.VO.CamNoticeVO;
import com.project_Ma.home.VO.CamQnaVO;
import com.project_Ma.home.VO.CampaignVO;
import com.project_Ma.home.VO.PaymentVO;
import com.project_Ma.home.VO.RewardVO;

public class CampaignDAO extends ConnectionDB implements CampaignService{

	public CampaignDAO() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<CampaignVO> allCamList() {
		
		return null;
	}

	@Override
	public List<CampaignVO> allCamList(CampaignVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void selectCam(CampaignVO vo) {
		try {
			connDB();
			sql = "select cam_no, cam.user_id, author.user_name, author.corpo_name, author.corpo_no, cam_title,"
					+ " to_char(cam_start, 'yyyy-mm-dd') cam_start, to_char(cam_end, 'yyyy-mm-dd') cam_end,"
					+ " cam_goal_price, cam_min_price, cam_max_price,"
					+ " cam_img, cam_reward_status, cam_content, cam_desc, cam_regi"
					+ " from campaign cam, user_info author where cam_no=? and cam.user_id=author.user_id";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getCamNo());
			result = pstmt.executeQuery();
			if(result.next()) {
				vo.setCamNo(result.getInt(1));
				vo.setUserid(result.getString(2));
				vo.setUserName(result.getString(3));
				vo.setCorpoName(result.getString(4));
				vo.setCorpoNo(result.getInt(5));
				vo.setCamTitle(result.getString(6));
				vo.setCamStart(result.getString(7));
				vo.setCamEnd(result.getString(8));
				vo.setCamGoalPrice(result.getInt(9));
				vo.setCamMinPrice(result.getInt(10));
				vo.setCamMaxPrice(result.getInt(11));
				vo.setCamImg(result.getString(12));
				vo.setCamRewardStatus(result.getInt(13));
				vo.setCamContent(result.getString(14));
				vo.setCamDesc(result.getString(15));
				vo.setCamRegi(result.getString(16));
			}
			
		} catch (Exception e) {
			System.out.println("캠페인선택에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}

	@Override
	public int insertCam(CampaignVO vo) {
		int cnt = 0;
		
		try {
			connDB();
			
			sql = "insert into campaign(cam_no, user_id, cam_title, cam_start, cam_end, cam_goal_price, cam_min_price, cam_max_price, "
					+ "cam_img, cam_reward_status, cam_content, cam_desc, cam_regi)"
					+ " values(cam_sq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getCamTitle());
			pstmt.setString(3, vo.getCamStart());
			pstmt.setString(4, vo.getCamEnd());
			pstmt.setInt(5, vo.getCamGoalPrice());
			pstmt.setInt(6, vo.getCamMinPrice());
			pstmt.setInt(7, vo.getCamMaxPrice());
			pstmt.setString(8, vo.getCamImg());
			pstmt.setInt(9, vo.getCamRewardStatus());
			pstmt.setString(10, vo.getCamContent());
			pstmt.setString(11, vo.getCamDesc());
			
			cnt = pstmt.executeUpdate();
			
			if(cnt>0) {
				sql = "select cam_sq.currval from campaign";
				pstmt = conn.prepareStatement(sql);
				result = pstmt.executeQuery(); 
				
				if(result.next()) {
					cnt = result.getInt(1);
				}
			}
		} catch (Exception e) {
			System.out.println("캠페인등록에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}
		System.out.println("캠페인등록 cnt값");
		return cnt;
	}
	
	public int insertCam(CampaignVO vo, List<RewardVO> rwList) {
		int cnt = 0;
		
		try {
			connDB();
			conn.setAutoCommit(false);
			
			sql = "insert into campaign(cam_no, user_id, cam_title, cam_start, cam_end, cam_goal_price, cam_min_price, cam_max_price, "
					+ "cam_img, cam_reward_status, cam_content, cam_desc, cam_regi)"
					+ " values(cam_sq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getCamTitle());
			pstmt.setString(3, vo.getCamStart());
			pstmt.setString(4, vo.getCamEnd());
			pstmt.setInt(5, vo.getCamGoalPrice());
			pstmt.setInt(6, vo.getCamMinPrice());
			pstmt.setInt(7, vo.getCamMaxPrice());
			pstmt.setString(8, vo.getCamImg());
			pstmt.setInt(9, vo.getCamRewardStatus());
			pstmt.setString(10, vo.getCamContent());
			pstmt.setString(11, vo.getCamDesc());
			
			cnt = pstmt.executeUpdate();
			
			if(cnt>0) {
				sql = "select cam_sq.currval from campaign"; //현재 등록한 캠페인의 시퀀스
				pstmt = conn.prepareStatement(sql);
				result = pstmt.executeQuery(); 
				cnt = 0;
				
				if(result.next()) { //현재 등록한 캠페인의 시퀀스가 존재
					//리워드 등록
					for(RewardVO rvo:rwList) {
						sql = "insert into reward(reward_no, cam_no, reward_name, reward_quantity, reward_price, reward_content, delivery_ex_date, delivery_ex_date_detail, delivery_price)"
								+ " values(reward_sq.nextval, ?, ?, ?, ?, ?, to_date(?, 'yyyy-mm'), ?, ?)";
						
						pstmt = conn.prepareStatement(sql);
						
						pstmt.setInt(1, result.getInt(1));
						pstmt.setString(2, rvo.getRewardName());
						pstmt.setInt(3, rvo.getRewardQuantity());
						pstmt.setInt(4, rvo.getRewardPrice());
						pstmt.setString(5, rvo.getRewardContent());
						pstmt.setString(6, rvo.getDeliveryExDate());
						pstmt.setString(7, rvo.getDeliveryExDateDetail());
						pstmt.setInt(8, rvo.getDeliveryPrice());
						
						cnt += pstmt.executeUpdate();
					}
					System.out.println("등록한 리워드"+cnt);
					if(cnt == rwList.size()) { //모든 리워드 등록 성공 시 커밋
						conn.commit();
					}
				}
			}
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
				System.out.println("트랜잭션 처리중 롤백에러");
			}
			
			System.out.println("캠페인등록에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}
		System.out.println("캠페인등록 cnt값");
		return cnt;
	}
	@Override
	public int updateCam(CampaignVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCam(CampaignVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public List<CamNoticeVO> camNoticeList(int camNo){
		List<CamNoticeVO> camNoticeList = new ArrayList<CamNoticeVO>();
		try {
			connDB();
			sql = "select notice_no, cam_no, to_char(cam_notice_date, 'yyyy-mm-dd'), cam_notice_title, cam_notice_content"
					+ " from cam_notice where cam_no=? order by cam_notice_date desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, camNo);
			result = pstmt.executeQuery();
			while(result.next()) {
				CamNoticeVO vo = new CamNoticeVO();
				vo.setCamNoticeNo(result.getInt(1));
				vo.setCamNo(result.getInt(2));
				vo.setCamNoticeDate(result.getString(3));
				vo.setCamNoticeTitle(result.getString(4));
				vo.setCamNoticeContent(result.getString(5));
			}
		} catch (Exception e) {
			System.out.println("캠페인 업데이트리스트 조회 에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return camNoticeList;
	}
	
	public List<PaymentVO> camDonatorList(int camNo){
		List<PaymentVO> camDonatorList = new ArrayList<PaymentVO>();
		try {
			connDB();
			sql = "";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, camNo);
			result = pstmt.executeQuery();
			while(result.next()) {
				
			}
		} catch (Exception e) {
			System.out.println("캠페인 후원자목록 조회 에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return camDonatorList;
	}
	
	public List<CamCommentVO> camCommentList(int camNo){
		List<CamCommentVO> camCommentList = new ArrayList<CamCommentVO>();
		try {
			connDB();
			sql = "select c.comment_no, c.user_id, c.cam_no, c.comment_content, c.comment_parent_no, to_char(c.comment_regi, 'yyyy-mm-dd hh:mi'),"
					+ " re.comment_no, re.user_id, re.cam_no, re.comment_content, re.comment_parent_no, to_char(re.comment_regi, 'yyyy-mm-dd hh:mi')"
					+ " from cam_comment c left outer join cam_comment re"
					+ " on c.comment_no=re.comment_parent_no"
					+ " where c.cam_no=? and c.comment_parent_no=0 order by c.comment_regi desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, camNo);
			result = pstmt.executeQuery();
			while(result.next()) {
				CamCommentVO vo = new CamCommentVO();
				vo.setCommentNo(result.getInt(1));
				vo.setUserid(result.getString(2));
				vo.setCamNo(result.getInt(3));
				vo.setCommentContent(result.getString(4));
				vo.setCommentParentNo(result.getInt(5));
				vo.setCommentDate(result.getString(6));
				vo.setReplyCommentNo(result.getInt(7));
				vo.setReplyUserid(result.getString(8));
				vo.setReplyCamNo(result.getInt(9));
				vo.setReplyCommentContent(result.getString(10));
				vo.setReplyCommentParentNo(result.getInt(11));
				vo.setReplyCommentDate(result.getString(12));
				camCommentList.add(vo);
			}
		} catch (Exception e) {
			System.out.println("캠페인 댓글목록 조회 에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return camCommentList;
	}
	
	public List<CamQnaVO> camQnaList(int camNo){
		List<CamQnaVO> camQnaList = new ArrayList<CamQnaVO>();
		try {
			connDB();
			sql = "";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, camNo);
			result = pstmt.executeQuery();
			while(result.next()) {
				
			}
		} catch (Exception e) {
			System.out.println("캠페인 업데이트내역 조회 에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return camQnaList;
	}
}
