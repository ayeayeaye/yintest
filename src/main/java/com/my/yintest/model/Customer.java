package com.my.yintest.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="customer_list")
public class Customer {

	@Id
	@Column(name="customer_id")
	private int custId;	
	@Column(name="customer_name")
	private String custName;
	@Column(name="nric")
	private String nric;
	@Column(name="mobile")
	private String mobile;
	@Column(name="email")
	private String email;	
	@Column(name="job")
	private String job;
	@Column(name="income")
	private double income;
	@Column(name="no_adult")
	private int noAdult;
	@Column(name="no_child")
	private int noChild;
	@Column(name="education")
	private String education;
	@Column(name="house_type")
	private String houseType;
	@Column(name="comment")
	private String comment;
	
	@Column(name="cust_use_dev")
	private int custUseDev;	
	
	@OneToOne (cascade=CascadeType.ALL)
	@JoinColumn(name="cust_use_dev", insertable=false, updatable=false)
	private Device devModel;
	
	
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Customer(int custId, String custName, String nric, String mobile, String email, String job, double income,
			int noAdult, int noChild, String education, String houseType, String comment, int custUseDev,
			Device devModel) {
		super();
		this.custId = custId;
		this.custName = custName;
		this.nric = nric;
		this.mobile = mobile;
		this.email = email;
		this.job = job;
		this.income = income;
		this.noAdult = noAdult;
		this.noChild = noChild;
		this.education = education;
		this.houseType = houseType;
		this.comment = comment;
		this.custUseDev = custUseDev;
		this.devModel = devModel;
	}


	public int getCustId() {
		return custId;
	}



	public void setCustId(int custId) {
		this.custId = custId;
	}



	public String getCustName() {
		return custName;
	}



	public void setCustName(String custName) {
		this.custName = custName;
	}



	public String getNric() {
		return nric;
	}



	public void setNric(String nric) {
		this.nric = nric;
	}



	public String getMobile() {
		return mobile;
	}



	public void setMobile(String mobile) {
		this.mobile = mobile;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getJob() {
		return job;
	}



	public void setJob(String job) {
		this.job = job;
	}



	public double getIncome() {
		return income;
	}



	public void setIncome(double income) {
		this.income = income;
	}



	public int getNoAdult() {
		return noAdult;
	}



	public void setNoAdult(int noAdult) {
		this.noAdult = noAdult;
	}



	public int getNoChild() {
		return noChild;
	}



	public void setNoChild(int noChild) {
		this.noChild = noChild;
	}



	public String getEducation() {
		return education;
	}



	public void setEducation(String education) {
		this.education = education;
	}



	public String getHouseType() {
		return houseType;
	}



	public void setHouseType(String houseType) {
		this.houseType = houseType;
	}



	public String getComment() {
		return comment;
	}



	public void setComment(String comment) {
		this.comment = comment;
	}


	public int getCustUseDev() {
		return custUseDev;
	}


	public void setCustUseDev(int custUseDev) {
		this.custUseDev = custUseDev;
	}


	public Device getDevModel() {
		return devModel;
	}


	public void setDevModel(Device devModel) {
		this.devModel = devModel;
	}


	@Override
	public String toString() {
		return "Customer [custId=" + custId + ", custName=" + custName + ", nric=" + nric + ", mobile=" + mobile
				+ ", email=" + email + ", job=" + job + ", income=" + income + ", noAdult=" + noAdult + ", noChild="
				+ noChild + ", education=" + education + ", houseType=" + houseType + ", comment=" + comment
				+ ", custUseDev=" + custUseDev + ", devModel=" + devModel + "]";
	}


}
