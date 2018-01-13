package test;

import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyTest {
	
	public void testOne(){
		String config = "configs/spring/spring.xml";
		System.out.println("------------------------->");
		ApplicationContext ac = new ClassPathXmlApplicationContext(config);
		SessionFactory sf = ac.getBean(SessionFactory.class);
		System.out.println(sf);
		System.out.println("------------------------->");

	}
}
