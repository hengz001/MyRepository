package sino.java.heng;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	public static void main(String[] args) {
		//收件人
		String to = "383849945@qq.com";
		//发件人
		String from = "heng.zhu@gemen.com.cn";
		//服务器
		String host = "smtp.gemen.com.cn";
		//获取系统属性
		Properties properties = System.getProperties();
		//设置邮件服务器
		properties.setProperty("mail.smtp.host", host);
		
		properties.setProperty("mail.smtp.auth", "true");
		//获取默认Session对象
		Session session = Session.getDefaultInstance(properties,new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication("heng.zhu@gemen.com.cn", "3250101z");
			}
		});
		
		try {
			//创建默认MimeMessage对象
			MimeMessage message = new MimeMessage(session);
			//set from
			message.setFrom(new InternetAddress(from));
			//set to
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			//set subject
			message.setSubject("This is the Subject Line!");
			//设置消息体
			message.setText("This is actual message");
			//发送消息
			Transport.send(message);
			System.out.println("Send message successfully...");
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
