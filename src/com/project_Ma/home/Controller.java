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
	
	//
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
			System.out.println("Properties 파일을 인풋 하는 과정에서 에러 발생.." + ie.getMessage());
			ie.getStackTrace();
		}
		//---properties file -> class for Map add
		try {
			Enumeration propertiesKeyList = propertiesObj.propertyNames();
			
			while(propertiesKeyList.hasMoreElements()) {
				//key 문자열 생성 후 프로퍼티에 있는 키 값을 저장, 그리고 그 후 클래스 이름에 해당 키 값을 넣어 값을 가져온 뒤 저장.
				String key 			= (String)propertiesKeyList.nextElement();
				String className 	= propertiesObj.getProperty(key);
				
				//--key  and className Confirm
				System.out.println("key : " + key + "    className : " + className);
				
				//--String�� ��üȭ.
				Class 				commandClass = Class.forName(className);	 //getDeclaredConstructors() class ���� ��� constructor�� �����Ѵ�.
				Command_Interface 	commandInter = (Command_Interface)commandClass.getDeclaredConstructors()[0].newInstance();
				//--Map�� ����.
				map.put(key, commandInter);
			}	
		}catch(Exception e) {
			System.out.println("properties  mapping에서 에러 발생." + e.getMessage());
			e.getStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//---uri 
		String uri 		= request.getRequestURI();
		String contextPath 	= request.getContextPath();
		
		//---commandAddr 저장.
		String commandAddr = uri.substring(contextPath.length());
		
		//confirm
		System.out.println("commandAddr : " + commandAddr);
		
		//Command_Interface에 map의 커맨드 주소값에 저장되어있는 값을 불러와서 저장.
		Command_Interface commandInter = map.get(commandAddr);
		
		//processStart()->viewFileName
		String viewFileName = commandInter.processStart(request, response);
		
		//requestDispatcher
		RequestDispatcher reqeustDispatcher = request.getRequestDispatcher(viewFileName);
		reqeustDispatcher.forward(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
