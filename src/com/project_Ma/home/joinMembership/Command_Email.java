package com.project_Ma.home.joinMembership;

import java.io.IOException;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;


public class Command_Email implements Command_Interface {

	public Command_Email() {
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("user_email");
		System.out.println(email);
		String sesId = request.getSession().getId();
		Properties p = new Properties();
		//네이버의 메일 환경설정에서 imap.smtp 사용함으로 변경하여야 한다 
		p.put("mail.smtp.host", "smtp.naver.com");
		p.put("mail.smtp.port","25");
		p.put("defaultEncoding","UTF-8");
		p.put("mail.smtp.auth","true");
		System.out.println("1111111111");
		try {
			Session ses = Session.getDefaultInstance(p, new Authenticator() {
				String un = "insunok0715@naver.com";//네이버 이메일 주소 
				String pw = "wjd1234!";//네이버의 이메일 비밀번호 
				
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(un, pw);
				}
			});
			
			ses.setDebug(false);
		
			MimeMessage mM = new MimeMessage(ses);//메일에 담을 객체 
			mM.setFrom(new InternetAddress("insunok0715@naver.com"));//보내는 사람 이메일 주소 
			InternetAddress[] toAddr = new InternetAddress[1];
			toAddr[0] =new InternetAddress(email);
			
			mM.setRecipients(Message.RecipientType.TO, toAddr);
			mM.setSubject("이메일 인증코드 테스트 중 ..."); //제목세팅
			
			
			String content = "이 이메일은 회원가입을 위한 인증코드 입니다\n";
				   content+="인증코드:"+sesId;
			
				   
			mM.setText(content);
			System.out.println();
			Transport.send(mM);
			
			
			request.setAttribute("code", "ok");
			System.out.println("메일 발송 성공 -->"+email);
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("메일 발송 오류  -->"+e.getMessage());
		}
		return "/joinMembership/emailCode.jsp";
	
	}

}
