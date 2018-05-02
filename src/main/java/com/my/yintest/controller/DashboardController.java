package com.my.yintest.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.yintest.javabean.CustomerProfile;
import com.my.yintest.javabean.DeviceStatusProfile;
import com.my.yintest.model.Device;
import com.my.yintest.service.CustomerService;
import com.my.yintest.service.DeviceService;



@Controller
@RequestMapping("/dashboard")
public class DashboardController {
	
	@Autowired
	DeviceService deviceService;
	@Autowired
	CustomerService custService;
	
	@RequestMapping("/view")
	public String home(Model model) {		
		model.addAttribute("custList", custService.getAllCust());
		
		//Trim status data for highcharts 
		ArrayList<Device> devList = deviceService.getAllDevice();
		
		List<String> powerStaList = new ArrayList<String>();
		
		ArrayList<DeviceStatusProfile> devStaProList = new ArrayList<DeviceStatusProfile>();
		for (int i = 0; i < devList.size(); i++) {
			
			String[] dcStringAry =devList.get(i).getDCStatus().split(",");
			for (String each: dcStringAry) {
				double d = Double.parseDouble(each);
				String s = Double.toString(d);
				powerStaList.add(s);
			}
			
			devStaProList.add(new DeviceStatusProfile(
					devList.get(i),
					Arrays.asList(devList.get(i).getChargeStatus().split(",")),
					Arrays.asList(devList.get(i).getDCStatus().split(",")),
					Arrays.asList(devList.get(i).getUSBStatus().split(",")),
					powerStaList,
					Arrays.asList(devList.get(i).getBatteryStatus().split(","))
					));
		}
		model.addAttribute("devStaProList", devStaProList);
		
		return "popup-dashboard";
	}
	

}