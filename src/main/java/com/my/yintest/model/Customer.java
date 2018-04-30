package com.my.yintest.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
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
	
    @OneToOne(fetch = FetchType.LAZY,cascade =  CascadeType.ALL, mappedBy = "addressCustModel")
	private Address cusAddress;
    @OneToOne(fetch = FetchType.LAZY,cascade =  CascadeType.ALL, mappedBy = "photoCusModel")
	private Photo custPhoto;
    @OneToOne(fetch = FetchType.LAZY,cascade =  CascadeType.ALL, mappedBy = "deviceCustModel")
	private Device custDevice;
	
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Customer(int custId, String custName, String nric, String mobile, String email, String job, double income,
			int noAdult, int noChild, String education, String houseType, String comment, Address cusAddress,
			Photo custPhoto, Device custDevice) {
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
		this.cusAddress = cusAddress;
		this.custPhoto = custPhoto;
		this.custDevice = custDevice;
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


	public Address getCusAddress() {
		return cusAddress;
	}

	public void setCusAddress(Address cusAddress) {
		this.cusAddress = cusAddress;
	}

	public Photo getCustPhoto() {
		return custPhoto;
	}

	public void setCustPhoto(Photo custPhoto) {
		this.custPhoto = custPhoto;
	}

	public Device getCustDevice() {
		return custDevice;
	}

	public void setCustDevice(Device custDevice) {
		this.custDevice = custDevice;
	}

	@Override
	public String toString() {
		return "Customer [custId=" + custId + ", custName=" + custName + ", nric=" + nric + ", mobile=" + mobile
				+ ", email=" + email + ", job=" + job + ", income=" + income + ", noAdult=" + noAdult + ", noChild="
				+ noChild + ", education=" + education + ", houseType=" + houseType + ", comment=" + comment
				+ ", cusAddress=" + cusAddress + ", custPhoto=" + custPhoto + ", custDevice=" + custDevice + "]";
	}

}
