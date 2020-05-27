package com.project_Ma.home.DAO;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.CamCommentVO;
import com.project_Ma.home.VO.CamNoticeVO;
import com.project_Ma.home.VO.CamQnaVO;
import com.project_Ma.home.VO.CamDetailVO;
import com.project_Ma.home.VO.PaymentVO;
import com.project_Ma.home.VO.RewardVO;

public class CamDetailDAO extends ConnectionDB{

	public CamDetailDAO() {
		// TODO Auto-generated constructor stub
	}

	public List<CamDetailVO> allCamList() {
		
		return null;
	}

	public List<CamDetailVO> allCamList(CamDetailVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	public void selectCam(CamDetailVO vo) {
		try {
			connDB();
			sql = "select cam_no, cam.user_id, author.user_name, author.corpo_name, author.corpo_no, cam_title,"
					+ " to_char(cam_start, 'yyyy-mm-dd') cam_start, to_char(cam_end, 'yyyy-mm-dd') cam_end , to_char(cam_end-cam_start) cam_remain,"
					+ " cam_goal_price, cam_min_price, cam_max_price, cam_total_price, cam_total_donator,"
					+ " cam_img, cam_reward_status, cam_content, cam_desc, cam_regi"
					+ " from (select sum(total_price) cam_total_price, count(user_id) cam_total_donator"
					+ " from payment where cam_no=?) p,"
					+ " campaign cam join user_info author on cam.user_id=author.user_id"
					+ " where cam_no=? and cam.user_id=author.user_id";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getCamNo());
			pstmt.setInt(2, vo.getCamNo());
			
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
				vo.setCamRemain(result.getString(9));
				vo.setCamGoalPrice(result.getInt(10));
				vo.setCamMinPrice(result.getInt(11));
				vo.setCamMaxPrice(result.getInt(12));
				vo.setCamTotalPrice(result.getInt(13));
				vo.setCamTotalDonator(result.getInt(14));
				vo.setCamImg(result.getString(15));
				vo.setCamRewardStatus(result.getInt(16));
				vo.setCamContent(result.getString(17));
				vo.setCamDesc(result.getString(18));
				vo.setCamRegi(result.getString(19));
			}
			
		} catch (Exception e) {
			System.out.println("캠페인선택에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}

	public int insertCam(CamDetailVO vo) {
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
	
	public int insertCam(CamDetailVO vo, List<RewardVO> rwList) {
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
						pstmt.setString(2, rvo.getReward_name());
						pstmt.setInt(3, rvo.getReward_quantity());
						pstmt.setInt(4, rvo.getReward_price());
						pstmt.setString(5, rvo.getReward_content());
						pstmt.setString(6, rvo.getDelivery_ex_date());
						pstmt.setString(7, rvo.getDelivery_ex_date_detail());
						pstmt.setInt(8, rvo.getDelivery_price());
						
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
	
	public int updateCam(CamDetailVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteCam(CamDetailVO vo) {
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
				camNoticeList.add(vo);
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
			sql = "select user_name, (funding_price+add_price) funding_price,"
					+ " to_char(donate_date, 'yyyy-mm-dd') donate_date,"
					+ " price_anonymous, name_anonymous"
					+ " from payment p join user_info u on p.user_id=u.user_id where cam_no=?"
					+ " order by payment_no desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, camNo);
			result = pstmt.executeQuery();
			while(result.next()) {
				PaymentVO vo = new PaymentVO();
				vo.setUser_name(result.getString(1));
				vo.setFunding_price(result.getInt(2));
				vo.setDonate_date(result.getString(3));
				vo.setPrice_anonymous(result.getInt(4));
				vo.setName_anonymous(result.getInt(5));
				camDonatorList.add(vo);
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
	
	public int insertCamComment(CamDetailVO vo) {
		int cnt = 0;
		try {
			connDB();
			sql = "insert into cam_comment(comment_no, user_id, cam_no, comment_content, comment_parent_no, comment_regi)"
					+ " values(comment_sq.nextval, ?, ?, ?, 0, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserid());
			pstmt.setInt(2, vo.getCamNo());
			pstmt.setString(3, vo.getCamContent());
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("캠페인 코멘트 등록 에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return cnt;
	}
	public List<CamQnaVO> camQnaList(int camNo){
		List<CamQnaVO> camQnaList = new ArrayList<CamQnaVO>();
		try {
			connDB();
			sql = "select q.qna_no, q.user_id, q.cam_no, q.qna_title, q.qna_content,"
					+ " q.qna_secret, to_char(q.qna_regi, 'yyyy-mm-dd'), q.qna_parent_no," + 
					" a.qna_no, a.user_id, a.cam_no, a.qna_title, a.qna_content,"
					+ " a.qna_secret, to_char(a.qna_regi, 'yyyy-mm-dd'), a.qna_parent_no" + 
					" from cam_qna q left outer join cam_qna a"
					+ " on q.qna_no=a.qna_parent_no"
					+ " where q.cam_no=? and q.qna_parent_no=0 order by q.qna_regi desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, camNo);
			result = pstmt.executeQuery();
			while(result.next()) {
				CamQnaVO vo = new CamQnaVO();
				vo.setQnaNo(result.getInt(1));
				vo.setUserid(result.getString(2));
				vo.setCamNo(result.getInt(3));
				vo.setQnaTitle(result.getString(4));
				vo.setQnaContent(result.getString(5));
				vo.setQnaSecret(result.getString(6));
				vo.setQnaRegi(result.getString(7));
				vo.setQnaParentNo(result.getInt(8));
				vo.setAnsQnaNo(result.getInt(9));
				vo.setAnsUserid(result.getString(10));
				vo.setAnsCamNo(result.getInt(11));
				vo.setAnsQnaTitle(result.getString(12));
				vo.setAnsQnaContent(result.getString(13));
				vo.setAnsQnaSecret(result.getString(14));
				vo.setAnsQnaRegi(result.getString(15));
				vo.setAnsQnaParentNo(result.getInt(16));
				camQnaList.add(vo);
			}
		} catch (Exception e) {
			System.out.println("캠페인 문의내역 조회 에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return camQnaList;
	}
}