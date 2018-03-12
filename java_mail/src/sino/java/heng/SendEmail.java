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
		//�ռ���
		String to = "383849945@qq.com";
		//������
		String from = "heng.zhu@gemen.com.cn";
		//������
		String host = "smtp.gemen.com.cn";
		//��ȡϵͳ����
		Properties properties = System.getProperties();
		//�����ʼ�������
		properties.setProperty("mail.smtp.host", host);
		
		properties.setProperty("mail.smtp.auth", "true");
		//��ȡĬ��Session����
		Session session = Session.getDefaultInstance(properties,new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication("heng.zhu@gemen.com.cn", "3250101z");
			}
		});
		
		try {
			//����Ĭ��MimeMessage����
			MimeMessage message = new MimeMessage(session);
			//set from
			message.setFrom(new InternetAddress(from));
			//set to
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			//set subject
			message.setSubject("This is the Subject Line!");
			//������Ϣ��
			message.setText("This is actual message");
			//������Ϣ
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
