package com.my.yintest.controller;


import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.my.yintest.javabean.CustomerProfile;
import com.my.yintest.model.Address;
import com.my.yintest.model.Customer;
import com.my.yintest.model.Device;
import com.my.yintest.model.Photo;
import com.my.yintest.service.AddressService;
import com.my.yintest.service.CustomerService;
import com.my.yintest.service.DeviceService;
import com.my.yintest.service.PhotoService;


@Controller
@RequestMapping("/test")
public class TestConroller {

	@Autowired
	CustomerService cusService;
	@Autowired
	AddressService adddService;
	@Autowired
	PhotoService ptoService;
	@Autowired
	DeviceService deviceService;

	
	@RequestMapping("locate/all/device")
	public ModelAndView locatealldevice() {	
		ModelAndView moView = new ModelAndView("agent-locate-all-device");			
		moView.addObject("custProList", retrieveAllCustomerProfile());
		moView.addObject("devList", deviceService.getAllDevice());
		return moView;		
	}
	
	@RequestMapping("highchart")
	public ModelAndView testHC() {	
		ModelAndView moView = new ModelAndView("testHC");
		return moView;		
	}
	
	@RequestMapping("add/device")
	public ModelAndView addDevice() {	
		ModelAndView moView = new ModelAndView("test-add-device");
		moView.addObject("dev", new Device());
		moView.addObject("cusList", cusService.getAllCust());
		return moView;		
	}
	
	@RequestMapping(value="added/device",method=RequestMethod.POST)
	public ModelAndView addedDeviceP(@ModelAttribute ("dev") Device device) {	
		
		ModelAndView moView = new ModelAndView("success");
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		device.setVisitTime(timestamp);
		
		Date date = getitngTodayDate(); 
		device.setSystemTime(date);
		
/*		moView.addObject("timestamp", timestamp);
		moView.addObject("date", date);*/
		
		deviceService.saveDevice(device);
		return moView;		
	}
	
/*	@RequestMapping("visit/device")
	public ModelAndView viewalldevice() {	
		ModelAndView moView = new ModelAndView("view-all-device");
		ArrayList<Device> devList = deviceService.getAllDevice();
		moView.addObject("devList", devList);
		return moView;		
	}*/
	
/*	@RequestMapping(value="visited/device/{deviceId}")
	public String visiteddevice(@PathVariable Integer deviceId,  HttpSession session) {	
		
		Usage use = new Usage();
		use.setUseByDevice(deviceId);
		use.setVisitTime(getitngTodayDate());
		useService.saveUsage(use);
		return "success";		
	}*/
	
	/*Methods*/
	
	public ArrayList<CustomerProfile> retrieveAllCustomerProfile()
	{
		ArrayList<Customer> upList =cusService.getAllCust();
		ArrayList<Address> addList = adddService.getAllAddress();
		ArrayList<Photo> photoList = ptoService.getAllPhoto();
		ArrayList<Device> devList = deviceService.getAllDevice();
		
		ArrayList<CustomerProfile> custProList = new ArrayList<CustomerProfile>();
		for (int i = 0; i < upList.size(); i++) {
			custProList.add(new CustomerProfile(upList.get(i), photoList.get(i), addList.get(i), devList.get(i)));
		}
		
		return custProList;
	}
	

	
	public Date getitngTodayDate()
	{
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
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
