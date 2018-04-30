package com.my.yintest.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.yintest.javabean.DeviceStatus;
import com.my.yintest.model.Device;
import com.my.yintest.service.CustomerService;
import com.my.yintest.service.DeviceService;


@Controller
@RequestMapping("/device")
public class DeviceController {
	
	@Autowired
	DeviceService devService;
	@Autowired
	CustomerService custService;
	
	@RequestMapping("/generate/dummy")
	public String home(Model model) {
		
		model.addAttribute("device", new Device());
		model.addAttribute("custList", custService.getAllCust());
		return "dummy-status";
	}
	
	@RequestMapping("/save")
	public String home(Model model, @ModelAttribute("device") Device newDevice) {
		
		/*1 V = 1000 mA*/
		
		//Charging Status - Input range: 0 ~ 3.999
		double[] inputAry1 = new double[12];
		double rangeMin1 = 0.0;
		double rangeMax1 = 3.999;
		Random r = new Random();
		
		for (int i = 0; i < inputAry1.length; i++) {
			double randomValue = rangeMin1 + (rangeMax1 - rangeMin1) * r.nextDouble(); 
			inputAry1[i] = (double)Math.round(randomValue * 1000d) / 1000 ;		
		}		
		model.addAttribute("inputChargingStatus", inputAry1);

		//DC Status - Output range: 0 ~ 3.999
		double[] inputAry2 = new double[12];
		for (int i = 0; i < inputAry2.length; i++) {
			double randomValue = rangeMin1 + (rangeMax1 - rangeMin1) * r.nextDouble(); 
			inputAry2[i] = (double)Math.round(randomValue * 1000d) / 1000 ;		
		}	
		model.addAttribute("outputDCStatus", inputAry2);
		
		
		//UsbPut Status - Usbput range: 0 ~ 1.000
		double[] inputAry3 = new double[12];
		for (int i = 0; i < inputAry3.length; i++) {
			double randomValue = Math.random()* 1.000;
			inputAry3[i] = (double)Math.round(randomValue * 1000d) / 1000 ;		
		}	
		model.addAttribute("usbStatus", inputAry3);
		
		
		//Power Consumption
		double[] inputAry4 = new double[12];
		for (int i = 0; i < inputAry4.length; i++) {
			double value =  (inputAry2[i] * 12)/1000 ;
			inputAry4[i] = (double)Math.round(value * 1000d) / 1000 ;
		}	
		model.addAttribute("powerConsumption", inputAry4);
		
		/*Save Device*/
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		newDevice.setVisitTime(timestamp);	
		Date date = getitngTodayDate(); 
		newDevice.setSystemTime(date);
		
	
		String chargingS = "";
		for (double d : inputAry1) {
			chargingS = chargingS + d +",";
		}
		newDevice.setChargeStatus(chargingS);
		
		String dcS = "" ;
		for (double d : inputAry2) {
			dcS = dcS + d +",";
		}
		newDevice.setDCStatus(dcS);
		
		String usbS = "";
		for (double d : inputAry3) {
			usbS = usbS + d +",";
		}
		newDevice.setUSBStatus(usbS);
		
		String batteryS = "";
		for (double d : inputAry4) {
			batteryS = batteryS + d +",";
		}
		newDevice.setBatteryStatus(batteryS);
		devService.saveDevice(newDevice);
		
		return "success";
	}
	
	public Date getitngTodayDate()
	{
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Date date = new Date();
		String todayDateS =  dateFormat.format(date);
		Date todayDateD = null;
		try {
			todayDateD = dateFormat.parse(todayDateS);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return todayDateD;
	}

}