package sino.java.services.impl;

import org.springframework.stereotype.Service;

import sino.java.po.User;
import sino.java.services.UserServices;

@Service
public class UserServicesImpl implements UserServices{

	public void save(User user) {
		System.out.println("services SUCCESS");
	}

}
