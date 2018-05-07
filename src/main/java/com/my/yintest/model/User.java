package com.my.yintest.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user_list")
public class User {

	@Id
	@Column(name="user_id")
	private int userId;
	@Column(name="user_name")
	private String userName;
	@Column(name="password")
	private String password;
	
	@Column(name = "is_Admin")
	private boolean isAdmin;
	@Column(name = "is_Supervisor")
	private boolean isSupervisor;
	@Column(name = "is_Agent")
	private boolean isAgent;
	@Column(name = "is_SubAgent")
	private boolean isSubAgent;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(int userId, String userName, String password, boolean isAdmin, boolean isSupervisor, boolean isAgent,
			boolean isSubAgent) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.isAdmin = isAdmin;
		this.isSupervisor = isSupervisor;
		this.isAgent = isAgent;
		this.isSubAgent = isSubAgent;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public boolean isSupervisor() {
		return isSupervisor;
	}

	public void setSupervisor(boolean isSupervisor) {
		this.isSupervisor = isSupervisor;
	}

	public boolean isAgent() {
		return isAgent;
	}

	public void setAgent(boolean isAgent) {
		this.isAgent = isAgent;
	}

	public boolean isSubAgent() {
		return isSubAgent;
	}

	public void setSubAgent(boolean isSubAgent) {
		this.isSubAgent = isSubAgent;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", password=" + password + ", isAdmin=" + isAdmin
				+ ", isSupervisor=" + isSupervisor + ", isAgent=" + isAgent + ", isSubAgent=" + isSubAgent + "]";
	}
	
}
