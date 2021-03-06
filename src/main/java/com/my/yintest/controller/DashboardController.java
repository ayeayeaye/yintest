package com.my.yintest.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.my.yintest.javabean.DeviceStatus;
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
	
	@RequestMapping("/view1")
	public String viewDashboard(Model model) {		
		model.addAttribute("custList", custService.getAllCust());
				
		ArrayList<Device> devList = deviceService.getAllDevice();
		
		/*Calculate power usage status*/
		List<String> powerStaList = new ArrayList<String>();		
		ArrayList<DeviceStatusProfile> devStaProList = new ArrayList<DeviceStatusProfile>();
		for (int i = 0; i < devList.size(); i++) {			
			String[] dcStringAry =devList.get(i).getDCStatus().split(",");
			for (String each: dcStringAry) {
				double d = Double.parseDouble(each);
				double d1 = d*12;
				String s = Double.toString(d1);
				powerStaList.add(s);
			}
			
			/*Convert device Number status  to String status*/
			int i1 =Integer.parseInt(devList.get(i).getDevStatus());
			for (DeviceStatus each : DeviceStatus.values()) {			
				if( i1 == each.showStatusNo())
				{
					String s =each.toString();
					devList.get(i).setDevStatus(s);
				}
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
		
		return "popup-dashboard-1";
	}

	@RequestMapping("/view3")
	public String viewDashoard3(Model model) {		
		model.addAttribute("custList", custService.getAllCust());
				
		ArrayList<Device> devList = deviceService.getAllDevice();
		
		/*Calculate power usage status*/
		List<String> powerStaList = new ArrayList<String>();		
		ArrayList<DeviceStatusProfile> devStaProList = new ArrayList<DeviceStatusProfile>();
		for (int i = 0; i < devList.size(); i++) {			
			String[] dcStringAry =devList.get(i).getDCStatus().split(",");
			for (String each: dcStringAry) {
				double d = Double.parseDouble(each);
				double d1 = d*12;
				String s = Double.toString(d1);
				powerStaList.add(s);
			}
			
			/*Convert device Number status  to String status*/
			int i1 =Integer.parseInt(devList.get(i).getDevStatus());
			for (DeviceStatus each : DeviceStatus.values()) {			
				if( i1 == each.showStatusNo())
				{
					String s =each.toString();
					devList.get(i).setDevStatus(s);
				}
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
		
		return "popup-dashboard-3";
	}
	
	@RequestMapping("/view4")
	public String viewDashoard4(Model model) {		
		model.addAttribute("custList", custService.getAllCust());
				
		ArrayList<Device> devList = deviceService.getAllDevice();
		
		/*Calculate power usage status*/
		List<String> powerStaList = new ArrayList<String>();		
		ArrayList<DeviceStatusProfile> devStaProList = new ArrayList<DeviceStatusProfile>();
		for (int i = 0; i < devList.size(); i++) {			
			String[] dcStringAry =devList.get(i).getDCStatus().split(",");
			for (String each: dcStringAry) {
				double d = Double.parseDouble(each);
				double d1 = d*12;
				String s = Double.toString(d1);
				powerStaList.add(s);
			}
			
			/*Convert device Number status  to String status*/
			int i1 =Integer.parseInt(devList.get(i).getDevStatus());
			for (DeviceStatus each : DeviceStatus.values()) {			
				if( i1 == each.showStatusNo())
				{
					String s =each.toString();
					devList.get(i).setDevStatus(s);
				}
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
		
		return "popup-dashboard-4";
	}
}