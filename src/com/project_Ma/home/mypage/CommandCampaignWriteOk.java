package com.project_Ma.home.mypage;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
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
import com.project_Ma.home.VO.CampaignVO;
import com.project_Ma.home.VO.RewardVO;

public class CommandCampaignWriteOk implements Command_Interface {

	public CommandCampaignWriteOk() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String imgPath = req.getServletContext().getRealPath("/img/campaign");
		
		req.setCharacterEncoding("UTF-8");
		System.out.println(imgPath);
		
		CampaignVO vo = new CampaignVO();
		RewardVO rvo = new RewardVO();
		
		HttpSession session = req.getSession();
		
		vo.setUserid((String) session.getAttribute("user_id"));
		vo.setUserid("sarang1"); //테스트
		
		List<String> uploadFileList = new ArrayList<String>();
		int maxSize = 1024 * 1024 * 15; //15MB
		
		DiskFileItemFactory fac = new DiskFileItemFactory();
		
		//파일업로드 핸들러
		ServletFileUpload upload = new ServletFileUpload(fac);
		upload.setHeaderEncoding("UTF-8");
		upload.setFileSizeMax(maxSize); //최대파일사이즈
		
		try {
			List fileItems = upload.parseRequest(req);
			Iterator<FileItem> iter = fileItems.iterator();
			
			while(iter.hasNext()) {
				FileItem item = iter.next();
			
				if(item.isFormField()) { //input
					String inputValue = item.getFieldName();
					if(inputValue.equals("cam_title")) {
						vo.setCamTitle(item.getString("UTF-8"));
					}
					if(inputValue.equals("cam_start")) {
						vo.setCamStart(item.getString("UTF-8"));
					}
					if(inputValue.equals("cam_end")) {
						vo.setCamEnd(item.getString("UTF-8"));
					}
					if(inputValue.equals("cam_goal_price")) {
						vo.setCamGoalPrice(Integer.parseInt(item.getString("UTF-8").replace(",", "")));
					}
					if(inputValue.equals("cam_min_price")) {
						vo.setCamMinPrice(Integer.parseInt(item.getString("UTF-8").replace(",", "")));
					}
					if(inputValue.equals("cam_max_price")) {
						vo.setCamMaxPrice(Integer.parseInt(item.getString("UTF-8").replace(",", "")));
					}
					if(inputValue.equals("cam_content")) {
						vo.setCamContent(item.getString("UTF-8"));
					}
					if(inputValue.equals("cam_desc")) {
						vo.setCamDesc(item.getString("UTF-8"));
					}
					if(inputValue.equals("cam_reward_status")) {
						if(item.getString("UTF-8") != null && !item.getString("UTF-8").equals("")) { //리워드 있음
							vo.setCamRewardStatus(1);
							
						}
						else { //리워드 없음
							vo.setCamRewardStatus(0);
						}
					}
				}
				else { //file
					String fileName = item.getName();
					
					String fileId = UUID.randomUUID().toString().replace("-", ""); //고유한 파일이름 생성
					String filExtension = FilenameUtils.getExtension(fileName); //파일확장자
					String newFileName= fileId+"."+filExtension; //전체파일이름(파일명+확장자)
					uploadFileList.add(newFileName);
					
					File uploadedFile = new File(imgPath, newFileName);
					
					item.write(uploadedFile);
					vo.setCamImgList(uploadFileList);
				}
			}
		} catch (Exception e) {
			System.out.println("파일업로드에러");
			e.printStackTrace();
		}
		
		CampaignDAO dao = new CampaignDAO();
		int camInsCnt = dao.insertCam(vo);
		int rwInsCnt;
		
		
		//캠페인추가 실패 시 업로드된 이미지 삭제
		if(camInsCnt <= 0) {
			for(int i=0; i<uploadFileList.size(); i++) {
				if(uploadFileList.get(i) != null) {
					File f = new File(imgPath, uploadFileList.get(i));
					f.delete();
				}
			}
		}
		
//		if(vo.getCamRewardStatus() == 1) {
//			rvo.setCamNo(camInsCnt);
//			
//			RewardDAO rdao = new RewardDAO();
//			rvo.setRewardName(mr.getParameter("reward"));
//		}
		
		req.setAttribute("camInsCnt", camInsCnt);
		return "/mypage/campaignWriteOk.jsp";
	}
	
}
