package com.my.yintest.javabean;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Id;

import com.my.yintest.model.Address;
import com.my.yintest.model.Customer;
import com.my.yintest.model.Device;
import com.my.yintest.model.Photo;

public class DeviceStatusProfile {
	
	private Device device;
    private List<String> chargingDayList;
    private List<String> dcDayList;
    private List<String> usbDayList;
    private List<String> powerDayList;
    private List<String> batteryDayList;
    

	public DeviceStatusProfile() {
		super();
		// TODO Auto-generated constructor stub
	}


	public DeviceStatusProfile(Device device, List<String> chargingDayList, List<String> dcDayList,
			List<String> usbDayList, List<String> powerDayList, List<String> batteryDayList) {
		super();
		this.device = device;
		this.chargingDayList = chargingDayList;
		this.dcDayList = dcDayList;
		this.usbDayList = usbDayList;
		this.powerDayList = powerDayList;
		this.batteryDayList = batteryDayList;
	}


	public Device getDevice() {
		return device;
	}


	public void setDevice(Device device) {
		this.device = device;
	}


	public List<String> getChargingDayList() {
		return chargingDayList;
	}


	public void setChargingDayList(List<String> chargingDayList) {
		this.chargingDayList = chargingDayList;
	}


	public List<String> getDcDayList() {
		return dcDayList;
	}


	public void setDcDayList(List<String> dcDayList) {
		this.dcDayList = dcDayList;
	}


	public List<String> getUsbDayList() {
		return usbDayList;
	}


	public void setUsbDayList(List<String> usbDayList) {
		this.usbDayList = usbDayList;
	}


	public List<String> getPowerDayList() {
		return powerDayList;
	}


	public void setPowerDayList(List<String> powerDayList) {
		this.powerDayList = powerDayList;
	}


	public List<String> getBatteryDayList() {
		return batteryDayList;
	}


	public void setBatteryDayList(List<String> batteryDayList) {
		this.batteryDayList = batteryDayList;
	}


	@Override
	public String toString() {
		return "DeviceStatusProfile [device=" + device + ", chargingDayList=" + chargingDayList + ", dcDayList="
				+ dcDayList + ", usbDayList=" + usbDayList + ", powerDayList=" + powerDayList + ", batteryDayList="
				+ batteryDayList + "]";
	}

}
