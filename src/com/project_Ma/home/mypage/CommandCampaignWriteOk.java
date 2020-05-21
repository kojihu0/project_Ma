package com.project_Ma.home.mypage;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.CampaignDAO;
import com.project_Ma.home.DAO.RewardDAO;
import com.project_Ma.home.VO.CampaignVO;
import com.project_Ma.home.VO.RewardVO;

public class CommandCampaignWriteOk implements Command_Interface {

	public CommandCampaignWriteOk() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String imgPath = req.getServletContext().getRealPath("/uploads") + "/img/campaign";
		req.setCharacterEncoding("UTF-8");
		System.out.println(imgPath);
		
		int maxSize = 1024 * 1024 * 5; //5MB
		
		DiskFileItemFactory fac = new DiskFileItemFactory();
		
		ServletFileUpload upload = new ServletFileUpload(fac);
		upload.setFileSizeMax(maxSize);
		try {
			List fileItems;
			fileItems = upload.parseRequest(req);
			Iterator<FileItem> iter = fileItems.iterator();
			
			while(iter.hasNext()) {
				FileItem item = iter.next();
				
				if(item.isFormField()) { //input
					String value = item.getString();
				}
				else { //file
					String fileName = item.getName();
				}
			}
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		CampaignVO vo = new CampaignVO();
		HttpSession session = req.getSession();
		int rewardStatus = 0;
//		if(mr.getParameter("cam_reward_status") != null && mr.getParameter("cam_reward_status") == "") {
//			rewardStatus = 1;
//		}
//		else {
//			rewardStatus = 0;
//		}
		
		//파일업로드
//		Enumeration imgFileList = mr.getFileNames();
//		List<String> newImgFileList = new ArrayList<String>();
//		int idx=0;
//		
//		while(imgFileList.hasMoreElements()) {
//			String oldImgName = (String)imgFileList.nextElement();
//			String newImgName = mr.getFilesystemName(oldImgName);
//			idx++;
//			if(newImgName != null) {
//				newImgFileList.add(newImgName);
//				
//			}
//		}
//		vo.setCamImgList(newImgFileList);
//		//System.out.println(newImgFileList.get(0));
//		
//		//vo.setUserid((String) session.getAttribute("user_id"));
//		vo.setUserid("sarangmoa");
//		vo.setCamTitle(mr.getParameter("cam_title"));
//		vo.setCamStart(mr.getParameter("cam_start"));
//		vo.setCamEnd(mr.getParameter("cam_end"));
//		vo.setGoalPrice(Integer.parseInt(mr.getParameter("goal_price").replace(",", "")));
//		vo.setMinPrice(Integer.parseInt(mr.getParameter("min_price").replace(",", "")));
//		vo.setMaxPrice(Integer.parseInt(mr.getParameter("max_price").replace(",", "")));
//		vo.setCamRewardStatus(rewardStatus);
//		vo.setCamContent(mr.getParameter("cam_content"));
//		vo.setCamDesc(mr.getParameter("cam_desc"));
		
//		CampaignDAO dao = new CampaignDAO();
//		int camInsCnt = dao.insertCam(vo);
//		int rwInsCnt;
		
		
		//캠페인추가 실패 시 업로드된 이미지 삭제
//		if(camInsCnt <= 0) {
//			for(String deleteImg : newImgFileList) {
//				if(deleteImg != null) {
//					File f = new File(imgPath, deleteImg);
//					f.delete();
//				}
//			}
//		}
		
//		if(vo.getCamRewardStatus() == 1) {
//			RewardVO rvo = new RewardVO();
//			rvo.setCamNo(camInsCnt);
//			
//			RewardDAO rdao = new RewardDAO();
//			rvo.setRewardName(mr.getParameter("reward"));
//		}
		
//		req.setAttribute("camInsCnt", camInsCnt);
		return "/mypage/campaignWriteOk.jsp";
	}
	
}
