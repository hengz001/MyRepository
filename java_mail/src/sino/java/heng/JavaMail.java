package sino.java.heng;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class JavaMail {
	public static void main(String[] args) {
		JavaMail jm = new JavaMail();
		try {
			jm.mailSend();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	public void mailSend() throws MessagingException{ 
		// 1.����һ���������ʼ��������Ự���� Session
		 Properties props = new Properties();
		 props.setProperty("mail.transport.protocol", "SMTP");
		 props.setProperty("mail.smtp.host", "smtp.163.com");
		 props.setProperty("mail.smtp.port", "25");
		 // ָ����֤Ϊtrue
		 props.setProperty("mail.smtp.auth", "true");
		 props.setProperty("mail.smtp.timeout","1000");
		 // ��֤�˺ż����룬������Ҫ�ǵ�������Ȩ��
		 Authenticator auth = new Authenticator() {
			 public PasswordAuthentication getPasswordAuthentication(){
				 return new PasswordAuthentication("15953185712@163.com", "czxsqm521");
			 }
		 };
		 Session session = Session.getInstance(props, auth);

		// 2.����һ��Message�����൱�����ʼ�����
		Message message = new MimeMessage(session);
		// ���÷�����
		message.setFrom(new InternetAddress("15953185712@163.com"));
		// ���÷��ͷ�ʽ�������
		message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress("heng.zhu@gemen.com.cn"));
		// ��������
		message.setSubject("�ʼ����Ͳ���");
		// ��������
		message.setContent("Hello", "text/html;charset=utf-8");

		// 3.���� Transport���ڽ��ʼ�����
		Transport.send(message);
		System.out.println("---------end------------");
	}
}
