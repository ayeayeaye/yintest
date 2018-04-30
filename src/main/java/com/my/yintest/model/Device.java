package com.my.yintest.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="device_list")
public class Device {

	
	@Id
	@Column(name="device_id")
	private int deviceId;	
	
	@Column(name="usage_command")
	private String usageCommand; 
	
	@Column(name="visit_time")
	private Timestamp visitTime;
	@Column(name="system_time")
	private Date systemTime; 
	
	@Column(name="GPS_Lat")
	private String GPSLat;
	@Column(name="GPS_Long")
	private String GPSLong;
	
	@Column(name="device_status")
	private String devStatus;
	@Column(name="charging_status")
	private String chargeStatus;
	@Column(name="DC_usage_status")
	private String DCStatus; 
	@Column(name="USB_usage_status")
	private String USBStatus; 
	@Column(name="battery_usage_status")
	private String batteryStatus; 
	
	@Column(name="dev_by_cust")
	private int devByCust;
	
	
	@ManyToOne
	@JoinColumn(name="dev_by_cust", insertable=false, updatable=false)
	private Customer deviceCustModel;
	
	@OneToMany(mappedBy = "payDeviceModel", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<Payment> devPaymentList = new ArrayList<Payment>();
	
	public Device() {
		super();
		// TODO Auto-generated constructor stub
	}





	public Device(int deviceId, String usageCommand, Timestamp visitTime, Date systemTime, String gPSLat, String gPSLong,
			String devStatus, String chargeStatus, String dCStatus, String uSBStatus, String batteryStatus,
			int devByCust, Customer deviceCustModel, List<Payment> devPaymentList) {
		super();
		this.deviceId = deviceId;
		this.usageCommand = usageCommand;
		this.visitTime = visitTime;
		this.systemTime = systemTime;
		GPSLat = gPSLat;
		GPSLong = gPSLong;
		this.devStatus = devStatus;
		this.chargeStatus = chargeStatus;
		DCStatus = dCStatus;
		USBStatus = uSBStatus;
		this.batteryStatus = batteryStatus;
		this.devByCust = devByCust;
		this.deviceCustModel = deviceCustModel;
		this.devPaymentList = devPaymentList;
	}


	public int getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(int deviceId) {
		this.deviceId = deviceId;
	}

	public String getUsageCommand() {
		return usageCommand;
	}


	public void setUsageCommand(String usageCommand) {
		this.usageCommand = usageCommand;
	}
	
	public Timestamp getVisitTime() {
		return visitTime;
	}

	public void setVisitTime(Timestamp visitTime) {
		this.visitTime = visitTime;
	}

	public Date getSystemTime() {
		return systemTime;
	}

	public void setSystemTime(Date systemTime) {
		this.systemTime = systemTime;
	}

	public String getGPSLat() {
		return GPSLat;
	}

	public void setGPSLat(String gPSLat) {
		GPSLat = gPSLat;
	}

	public String getGPSLong() {
		return GPSLong;
	}

	public void setGPSLong(String gPSLong) {
		GPSLong = gPSLong;
	}

	public String getDevStatus() {
		return devStatus;
	}

	public void setDevStatus(String devStatus) {
		this.devStatus = devStatus;
	}

	public String getChargeStatus() {
		return chargeStatus;
	}

	public void setChargeStatus(String chargeStatus) {
		this.chargeStatus = chargeStatus;
	}

	public String getDCStatus() {
		return DCStatus;
	}

	public void setDCStatus(String dCStatus) {
		DCStatus = dCStatus;
	}

	public String getUSBStatus() {
		return USBStatus;
	}

	public void setUSBStatus(String uSBStatus) {
		USBStatus = uSBStatus;
	}

	
	public int getDevByCust() {
		return devByCust;
	}

	public void setDevByCust(int devByCust) {
		this.devByCust = devByCust;
	}


	public String getBatteryStatus() {
		return batteryStatus;
	}


	public void setBatteryStatus(String batteryStatus) {
		this.batteryStatus = batteryStatus;
	}


	public Customer getDeviceCustModel() {
		return deviceCustModel;
	}


	public void setDeviceCustModel(Customer deviceCustModel) {
		this.deviceCustModel = deviceCustModel;
	}


	
	public List<Payment> getDevPaymentList() {
		return devPaymentList;
	}


	public void setDevPaymentList(List<Payment> devPaymentList) {
		this.devPaymentList = devPaymentList;
	}

	@Override
	public String toString() {
		return "Device [deviceId=" + deviceId + ", usageCommand=" + usageCommand + ", visitTime=" + visitTime
				+ ", systemTime=" + systemTime + ", GPSLat=" + GPSLat + ", GPSLong=" + GPSLong + ", devStatus="
				+ devStatus + ", chargeStatus=" + chargeStatus + ", DCStatus=" + DCStatus + ", USBStatus=" + USBStatus
				+ ", batteryStatus=" + batteryStatus + ", devByCust=" + devByCust + ", deviceCustModel="
				+ deviceCustModel + ", devPaymentList=" + devPaymentList + "]";
	}
	
}
