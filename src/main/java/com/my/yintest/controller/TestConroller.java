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
import org.springframework.ui.Model;
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
@RequestMapping("/test/device")
public class TestConroller {

	@Autowired
	CustomerService cusService;
	@Autowired
	AddressService adddService;
	@Autowired
	PhotoService ptoService;
	@Autowired
	DeviceService deviceService;

	@RequestMapping("locate/all")
	public String locatealldevice(Model model) {	
		model.addAttribute("addressList", adddService.getAllAddress());		
		model.addAttribute("photoList", ptoService.getAllPhoto()); 
		return "agent-locate-all-device";		
	}
	
	@RequestMapping("highchart")
	public ModelAndView testHC() {	
		ModelAndView moView = new ModelAndView("testHC");
		return moView;		
	}

	@RequestMapping("add")
	public String addDevice(Model model) {	
		model.addAttribute("dev", new Device());
		model.addAttribute("cusList", cusService.getAllCust());
		return "test-add-device";		
	}
	
	@RequestMapping(value="added",method=RequestMethod.GET)
	public String addedDeviceG(Model model) {		
		return "test-add-device";	
	}
	
	@RequestMapping(value="added",method=RequestMethod.POST)
	public String addedDeviceP(Model model,@ModelAttribute ("dev") Device device) {	
				
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		device.setVisitTime(timestamp);
		
		Date date = getitngTodayDate(); 
		device.setSystemTime(date);
		
/*		moView.addObject("timestamp", timestamp);
		moView.addObject("date", date);*/
		
		deviceService.saveDevice(device);
		return "success";		
	}
	
	@RequestMapping("show/chart")
	public ModelAndView viewalldevice() {	
		ModelAndView moView = new ModelAndView("device-show-chart");
/*		ArrayList<Device> devList = deviceService.getAllDevice();
		moView.addObject("devList", devList);*/
		moView.addObject("custProList", retrieveAllCustomerProfile());
		return moView;		
	}
	
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
