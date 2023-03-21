package bean;

import javax.tools.JavaCompiler;

public class NewCustomer implements Java.io.Serializable{
	
	private int id;
	private String login;
	private String password;
	
	public int getId() {
		return id;
	}
	public String getLogin() {
		return login;
	}
	public String getPassword() {
		return password;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
