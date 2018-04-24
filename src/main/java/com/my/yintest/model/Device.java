package com.my.yintest.model;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="device_list")
public class Device {

	
	@Id
	@Column(name="device_id")
	private int deviceId;	
	
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
	
/*	@Column(name="dev_by_cust")
	private int devByCust;
	
	
	@OneToOne (cascade=CascadeType.ALL)
	@JoinColumn(name="dev_by_customer", insertable=false, updatable=false)
	private Customer custDevModel;*/
	
	public Device() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Device(int deviceId, Timestamp visitTime, Date systemTime, String gPSLat, String gPSLong, String devStatus,
			String chargeStatus, String dCStatus, String uSBStatus) {
		super();
		this.deviceId = deviceId;
		this.visitTime = visitTime;
		this.systemTime = systemTime;
		GPSLat = gPSLat;
		GPSLong = gPSLong;
		this.devStatus = devStatus;
		this.chargeStatus = chargeStatus;
		DCStatus = dCStatus;
		USBStatus = uSBStatus;
	}

	public int getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(int deviceId) {
		this.deviceId = deviceId;
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

	@Override
	public String toString() {
		return "Device [deviceId=" + deviceId + ", visitTime=" + visitTime + ", systemTime=" + systemTime + ", GPSLat="
				+ GPSLat + ", GPSLong=" + GPSLong + ", devStatus=" + devStatus + ", chargeStatus=" + chargeStatus
				+ ", DCStatus=" + DCStatus + ", USBStatus=" + USBStatus + "]";
	}

	
}
