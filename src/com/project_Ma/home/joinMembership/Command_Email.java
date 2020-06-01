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
		//���̹��� ���� ȯ�漳������ imap.smtp ��������� �����Ͽ��� �Ѵ� 
		p.put("mail.smtp.host", "smtp.naver.com");
		p.put("mail.smtp.port","25");
		p.put("defaultEncoding","UTF-8");
		p.put("mail.smtp.auth","true");
		System.out.println("1111111111");
		try {
			Session ses = Session.getDefaultInstance(p, new Authenticator() {
				String un = "insunok0715@naver.com";//���̹� �̸��� �ּ� 
				String pw = "wjd1234!";//���̹��� �̸��� ��й�ȣ 
				
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(un, pw);
				}
			});
			
			ses.setDebug(false);
		
			MimeMessage mM = new MimeMessage(ses);//���Ͽ� ���� ��ü 
			mM.setFrom(new InternetAddress("insunok0715@naver.com"));//������ ��� �̸��� �ּ� 
			InternetAddress[] toAddr = new InternetAddress[1];
			toAddr[0] =new InternetAddress(email);
			
			mM.setRecipients(Message.RecipientType.TO, toAddr);
			mM.setSubject("이메일 인증 코드입니다. "); //������
			
			
			String content = "이메일 인증 코드입니다.\n";
				   content+="인증코드:"+sesId;
			
				   
			mM.setText(content);
			System.out.println();
			Transport.send(mM);
			
			
			request.setAttribute("code", "ok");
			System.out.println("���� �߼� ���� -->"+email);
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("���� �߼� ����  -->"+e.getMessage());
		}
		return "/joinMembership/emailCode.jsp";
	
	}

}
