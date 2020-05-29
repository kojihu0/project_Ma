package com.project_Ma.home.mypage;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.CampaignDAO;
import com.project_Ma.home.DAO.CamDetailDAO;
import com.project_Ma.home.DAO.RewardDAO;
import com.project_Ma.home.VO.CampaignVO;
import com.project_Ma.home.VO.CamDetailVO;
import com.project_Ma.home.VO.RewardVO;

public class CommandCampaignUpdateOk implements Command_Interface {
	String encode = "UTF-8";
	public CommandCampaignUpdateOk() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String imgPath = req.getServletContext().getRealPath("/img/campaign");
		
		req.setCharacterEncoding(encode);
		System.out.println(imgPath);
		
		CamDetailVO vo = new CamDetailVO();
		int rewardCnt = 0;
		HashMap<String, String> rewardList = new HashMap<String, String>();
		HttpSession session = req.getSession();
		
		vo.setUserid((String) session.getAttribute("user_id"));
		
		List<String> uploadFileList = new ArrayList<String>();
		List<String> crrFileList = new ArrayList<String>();
		HashMap<String, String> formFields = new HashMap<String, String>();
		int maxSize = 1024 * 1024 * 15; //15MB
		
		DiskFileItemFactory fac = new DiskFileItemFactory();
		
		//파일업로드 핸들러
		ServletFileUpload upload = new ServletFileUpload(fac);
		upload.setHeaderEncoding(encode);
		upload.setFileSizeMax(maxSize); //최대파일사이즈
		
		try {
			List fileItems = upload.parseRequest(req);
			Iterator<FileItem> iter = fileItems.iterator();
			
			while(iter.hasNext()) {
				FileItem item = iter.next();
				if(item.isFormField()) { //input
					formFields.put(item.getFieldName(), item.getString(encode));
					String inputName = item.getFieldName();
					int rewardSap = inputName.indexOf("[");
					if(inputName.equals("cam_no")) {
						vo.setCamNo(Integer.parseInt(item.getString(encode)));
					}
//					if(inputName.equals("cam_crr_img")) { //현재 업로드되어있는 이미지
//						vo.setCamCurrImg(item.getString(encode));
//					}
					if(inputName.equals("cam_title")) {
						vo.setCamTitle(item.getString(encode));
					}
					if(inputName.equals("cam_start")) {
						vo.setCamStart(item.getString(encode));
					}
					if(inputName.equals("cam_end")) {
						vo.setCamEnd(item.getString(encode));
					}
					if(inputName.equals("cam_goal_price")) {
						vo.setCamGoalPrice(Integer.parseInt(item.getString(encode).replace(",", "")));
					}
					if(inputName.equals("cam_min_price")) {
						vo.setCamMinPrice(Integer.parseInt(item.getString(encode).replace(",", "")));
					}
					if(inputName.equals("cam_max_price")) {
						vo.setCamMaxPrice(Integer.parseInt(item.getString(encode).replace(",", "")));
					}
					if(inputName.equals("cam_content")) {
						vo.setCamContent(item.getString(encode));
					}
					if(inputName.equals("cam_desc")) {
						vo.setCamDesc(item.getString(encode));
					}
					if(inputName.equals("cam_reward_status")) {
						if(item.getString(encode) != null && !item.getString(encode).equals("")) { //리워드 있음
							vo.setCamRewardStatus(1);
						}
						else { //리워드 없음
							vo.setCamRewardStatus(0);
						}
					}
					if(inputName.equals("reward_cnt")) {
						rewardCnt = Integer.parseInt(item.getString(encode));
					}
					if(rewardSap!=-1 && inputName.substring(0, rewardSap).equals("reward")) {
						rewardList.put(inputName, item.getString(encode));
					}
				}
				if(!item.isFormField()) { //file
					String fileName = item.getName();
					if(fileName!=null && !fileName.equals("")) { //새로운 파일이 있을때 업로드
						String fileId = UUID.randomUUID().toString().replace("-", ""); //고유한 파일이름 생성
						String filExtension = FilenameUtils.getExtension(fileName); //파일확장자
						String newFileName= fileId+"."+filExtension; //전체파일이름(파일명+확장자)
						uploadFileList.add(newFileName);
						
						File uploadedFile = new File(imgPath, newFileName);
						
						item.write(uploadedFile);
						vo.setCamImgList(uploadFileList);
						vo.setCamCurrImg(formFields.get("cam_crr_img"));
						System.out.println(vo.getCamCurrImgList().size()+"현재파일");
						for(int i=0; i<vo.getCamCurrImgList().size(); i++) { //원래 파일 삭제
							if(vo.getCamImgList().get(i) != null) {
								File f = new File(imgPath, vo.getCamImgList().get(i));
								f.delete();
							}
						}
					}
				}
			} //while
			
		} catch (Exception e) {
			System.out.println("파일업로드에러");
			e.printStackTrace();
		}
		System.out.println(formFields.get("cam_crr_img"));
		CamDetailDAO dao = new CamDetailDAO();
		int camInsCnt = 0;
		
		if(vo.getCamRewardStatus() == 1) {
			List<RewardVO> rwList = new ArrayList<RewardVO>();
			for(int i=1; i<=rewardCnt; i++) {
				RewardVO rvo = new RewardVO();
				rvo.setReward_name(rewardList.get("reward[reward_name_"+i+"]"));
				rvo.setReward_content(rewardList.get("reward[reward_desc_"+i+"]"));
				rvo.setReward_price(Integer.parseInt(rewardList.get("reward[reward_price_"+i+"]").replace(",", "")));
				rvo.setReward_quantity(Integer.parseInt(rewardList.get("reward[reward_limit_"+i+"]").replace(",", "")));
				rvo.setDelivery_price(Integer.parseInt(rewardList.get("reward[del_fee_"+i+"]").replace(",", "")));
				rvo.setDelivery_ex_year(rewardList.get("reward[del_year_"+i+"]"));
				rvo.setDelivery_ex_month(rewardList.get("reward[del_month_"+i+"]"));
				rvo.setDelivery_ex_date_detail(rewardList.get("reward[del_date_detail_"+i+"]"));
				rvo.setReward_no(Integer.parseInt(rewardList.get("reward[reward_no_"+i+"]")));
				rvo.setCam_no(vo.getCamNo());
				rwList.add(rvo);
			}
			camInsCnt = dao.updateCam(vo, rwList);
		}
		else {
			camInsCnt = dao.updateCam(vo);
		}
		//캠페인추가 실패 시 업로드된 이미지 삭제
		if(camInsCnt <= 0) {
			for(int i=0; i<uploadFileList.size(); i++) {
				if(uploadFileList.get(i) != null) {
					File f = new File(imgPath, uploadFileList.get(i));
					f.delete();
				}
			}
		}
		req.setAttribute("camInsCnt", camInsCnt);
		return "/mypage/campaignUpdateOk.jsp";
	}
	
}
