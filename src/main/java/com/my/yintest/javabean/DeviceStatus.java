package com.my.yintest.javabean;

public enum DeviceStatus {
	ON, OFF, TAMPER, FUllYPAID;
	
/*	public String toString() {
		return name().charAt(0) + name().substring(1).toLowerCase();
	}*/
	
	public String toString() {
		String returnStatus = null;

		switch (name()) {
		case "ON":
			returnStatus = "1";
			break;
		case "OFF":
			returnStatus = "2";
			break;
		case "TAMPER":
			returnStatus = "3";
			break;
		case "FUllYPAID":
			returnStatus = "4";
			break;
		default:
			break;
		}
		
		return returnStatus;
	}
}
