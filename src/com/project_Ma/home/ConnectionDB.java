package com.project_Ma.home;

//sql
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.sql.DataSource;
//naming
import javax.naming.Context;
import javax.naming.InitialContext;

public class ConnectionDB {

	protected Connection 		conn 	= null;
	protected PreparedStatement pstmt 	= null;
	protected ResultSet 		result 	= null;
	protected String 			sql 	= "";
	
	public ConnectionDB() {
	}
	 
	public Connection connDB() {
		try {
			Context context 	= new InitialContext();
			Context envContext 	= (Context)context.lookup("java:comp/env");
			DataSource ds 		= (DataSource)envContext.lookup("jdbc/myOracle");
			
			conn = ds.getConnection();
		}catch(Exception e) {
			System.out.println("������ ���̽� ���ῡ�� ������ �߻��߽��ϴ�." + e.getMessage());
			e.getStackTrace();	
		}
		return conn;
	}//connDB end
	
	public void closeDB() {
		try {
			if(result != null) result.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch(Exception e) {
			System.out.println("DB ���� ���ῡ�� ������ �߻��߽��ϴ�." + e.getMessage());
			e.getStackTrace();
		}
	}//closeDB end
}//class end
