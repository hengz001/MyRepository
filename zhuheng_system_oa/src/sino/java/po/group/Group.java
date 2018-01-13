package sino.java.po.group;

import java.io.Serializable;
import java.util.Set;

import sino.java.po.user.User;

public class Group implements Serializable{
	
	private static final long serialVersionUID = -4601637009929368018L;

	private int g_id;
	
	private String g_name;
	
	private String g_sn;
	
	private int flag;
	
	private Set<User> users;

	public int getG_id() {
		return g_id;
	}

	public void setG_id(int g_id) {
		this.g_id = g_id;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public String getG_sn() {
		return g_sn;
	}

	public void setG_sn(String g_sn) {
		this.g_sn = g_sn;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}
}
