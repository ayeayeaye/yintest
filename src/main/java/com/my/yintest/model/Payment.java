package com.my.yintest.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="payment_history")
public class Payment {

	@Id
	@Column(name="payment_id")
	private int payId;	
	
	@Column(name="pay_device")
	private int payForDevice; 
	
	@Column(name="total_credit_amount")
	private double totalCreditAmt; 
	@Column(name="pay_amount")
	private double payAmt; 
	@Column(name="current_credit_amount")
	private double currentCreditAmt; 
	
	@Column(name="pay_day")
	private Timestamp payDay;
	
	@Column(name="pay_serve_agent")
	private int payAgent;  	
	@Column(name="pay_comment")
	private String payComment;
	
	@ManyToOne
	@JoinColumn(name="pay_device", insertable=false, updatable=false)
	private Device payDeviceModel;

	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Payment(int payId, int payForDevice, double totalCreditAmt, double payAmt, double currentCreditAmt,
			Timestamp payDay, int payAgent, String payComment, Device payDeviceModel) {
		super();
		this.payId = payId;
		this.payForDevice = payForDevice;
		this.totalCreditAmt = totalCreditAmt;
		this.payAmt = payAmt;
		this.currentCreditAmt = currentCreditAmt;
		this.payDay = payDay;
		this.payAgent = payAgent;
		this.payComment = payComment;
		this.payDeviceModel = payDeviceModel;
	}

	public int getPayId() {
		return payId;
	}

	public void setPayId(int payId) {
		this.payId = payId;
	}

	public int getPayForDevice() {
		return payForDevice;
	}

	public void setPayForDevice(int payForDevice) {
		this.payForDevice = payForDevice;
	}

	public double getTotalCreditAmt() {
		return totalCreditAmt;
	}

	public void setTotalCreditAmt(double totalCreditAmt) {
		this.totalCreditAmt = totalCreditAmt;
	}

	public double getPayAmt() {
		return payAmt;
	}

	public void setPayAmt(double payAmt) {
		this.payAmt = payAmt;
	}

	public double getCurrentCreditAmt() {
		return currentCreditAmt;
	}

	public void setCurrentCreditAmt(double currentCreditAmt) {
		this.currentCreditAmt = currentCreditAmt;
	}

	public Timestamp getPayDay() {
		return payDay;
	}

	public void setPayDay(Timestamp payDay) {
		this.payDay = payDay;
	}

	public int getPayAgent() {
		return payAgent;
	}

	public void setPayAgent(int payAgent) {
		this.payAgent = payAgent;
	}

	public String getPayComment() {
		return payComment;
	}

	public void setPayComment(String payComment) {
		this.payComment = payComment;
	}

	public Device getPayDeviceModel() {
		return payDeviceModel;
	}

	public void setPayDeviceModel(Device payDeviceModel) {
		this.payDeviceModel = payDeviceModel;
	}

	@Override
	public String toString() {
		return "Payment [payId=" + payId + ", payForDevice=" + payForDevice + ", totalCreditAmt=" + totalCreditAmt
				+ ", payAmt=" + payAmt + ", currentCreditAmt=" + currentCreditAmt + ", payDay=" + payDay + ", payAgent="
				+ payAgent + ", payComment=" + payComment + ", payDeviceModel=" + payDeviceModel + "]";
	}
	
	
}
