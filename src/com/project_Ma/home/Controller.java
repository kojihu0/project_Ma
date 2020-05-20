package com.project_Ma.home;

//io
import java.io.FileInputStream;
//error
import java.io.IOException;
import java.util.Enumeration;

//collection
import java.util.Properties;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
//servlet
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/*.do")
public class Controller extends HttpServlet {
	//MapCollection
	Map<String, Command_Interface> map = new HashMap<String, Command_Interface>(); 
	
	//상위 class의 생성자 우선 실행.
    public Controller() {
        super();       
    }

	public void init(ServletConfig config) throws ServletException {
		String 		propertiesFile 	= config.getInitParameter("propertiesConfig"); 
		Properties 	propertiesObj 	= new Properties();
		//---properties file input.
		try {
			FileInputStream fileInputStream = new FileInputStream(propertiesFile);
			propertiesObj.load(fileInputStream);
		}catch(IOException ie) {
			System.out.println("Properties 파일을 입출력 과정에서 문제가 생겼습니다." + ie.getMessage());
			ie.getStackTrace();
		}
		//---properties file -> class for Map add
		try {
			Enumeration propertiesKeyList = propertiesObj.propertyNames();
			
			while(propertiesKeyList.hasMoreElements()) {
				//key를 통해서 해당 key의 value값을 ClassName에 저장.
				String key 			= (String)propertiesKeyList.nextElement();
				String className 	= propertiesObj.getProperty(key);
				
				//--key  and className Confirm
				System.out.println("key : " + key + "    className : " + className);
				
				//--String을 객체화.
				Class 				commandClass = Class.forName(className);	 //getDeclaredConstructors() class 안의 모든 constructor에 접근한다.
				Command_Interface 	commandInter = (Command_Interface)commandClass.getDeclaredConstructors()[0].newInstance();
				//--Map에 삽입.
				map.put(key, commandInter);
			}	
		}catch(Exception e) {
			System.out.println("properties파일을 객체화 하여 Map에 추가하는 도중에 에러 발생." + e.getMessage());
			e.getStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//---uri 
		String uri 		= request.getRequestURI();
		String contextPath 	= request.getContextPath();
		
		//접속 주소.
		String commandAddr = uri.substring(contextPath.length());
		
		//confirm
		System.out.println("commandAddr : " + commandAddr);
		
		//Command_Interface에 map의 벨류 값 대입.
		Command_Interface commandInter = map.get(commandAddr);
		
		//processStart()->viewFileName 받아오기 
		String viewFileName = commandInter.processStart(request, response);
		
		//requestDispatcher->클라이언트로 데이터 전송.
		RequestDispatcher reqeustDispatcher = request.getRequestDispatcher(viewFileName);
		reqeustDispatcher.forward(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
