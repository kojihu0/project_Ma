package com.project_Ma.home.editorImgUpload;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.project_Ma.home.Command_Interface;

public class CommandEditorImgUpload implements Command_Interface {

	public CommandEditorImgUpload() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String currentUrl = req.getRequestURI();
		String path = req.getServletContext().getRealPath("/img/campaign");
		int uploaded = 0;
		String filename = "";
		String url = "";
		int maxSize = 1024*1024*5;
		
		DiskFileItemFactory df = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(df);
		upload.setHeaderEncoding("UTF-8");
		upload.setFileSizeMax(maxSize);
		
		try {
			List<FileItem> fileItem = upload.parseRequest(req);
			Iterator<FileItem> i = fileItem.iterator();
			while(i.hasNext()) {
				FileItem fi = i.next();
				if(!fi.isFormField()) {
					String uploadFileName = fileItem.get(0).getName();
					String fileId = UUID.randomUUID().toString().replace("-", "").substring(0, 7);
					String ext = FilenameUtils.getExtension(uploadFileName);
					filename = fileId+"."+ext;
					
					File uploadFile = new File(path, filename);
					
					fileItem.get(0).write(uploadFile);
					
					uploaded = 1;
					url = "http://"+req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/img/campaign/"+filename;
				}
			}
		}catch (Exception e) {
			System.out.println("파일업로드에러");
			e.printStackTrace();
		}
		req.setAttribute("uploaded", uploaded);
		req.setAttribute("filename", filename);
		req.setAttribute("url", url);
		
		return "/editorImgUpload/editorImgUpload.jsp";
	}

}
