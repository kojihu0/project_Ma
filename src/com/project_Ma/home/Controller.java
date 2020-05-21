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
	
	//���� class�� ������ �켱 ����.
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
			System.out.println("Properties error" + ie.getMessage());
			ie.getStackTrace();
		}
		//---properties file -> class for Map add
		try {
			Enumeration propertiesKeyList = propertiesObj.propertyNames();
			
			while(propertiesKeyList.hasMoreElements()) {
				//key�� ���ؼ� �ش� key�� value���� ClassName�� ����.
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
			System.out.println("properties error" + e.getMessage());
			e.getStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//---uri 
		String uri 		= request.getRequestURI();
		String contextPath 	= request.getContextPath();
		
		//���� �ּ�.
		String commandAddr = uri.substring(contextPath.length());
		
		//confirm
		System.out.println("commandAddr : " + commandAddr);
		
		//Command_Interface�� map�� ���� �� ����.
		Command_Interface commandInter = map.get(commandAddr);
		
		//processStart()->viewFileName �޾ƿ��� 
		String viewFileName = commandInter.processStart(request, response);
		
		//requestDispatcher->Ŭ���̾�Ʈ�� ������ ����.
		RequestDispatcher reqeustDispatcher = request.getRequestDispatcher(viewFileName);
		reqeustDispatcher.forward(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
