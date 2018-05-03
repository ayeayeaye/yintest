package com.my.yintest.javabean;


public enum DeviceStatus {
	ON(1), OFF(2), TAMPER(3), FULLYPAID(4);
	

	   int devStaNo;
	   
	   DeviceStatus(int devStaNo) {
		   this.devStaNo = devStaNo;
	   }
	   public int showStatusNo() {
	      return devStaNo;
	   } 
}
