package com.my.yintest.javabean;

public enum DeviceStatus {
	ON, OFF;
	
	public String toString() {
		return name().charAt(0) + name().substring(1).toLowerCase();
	}
}
