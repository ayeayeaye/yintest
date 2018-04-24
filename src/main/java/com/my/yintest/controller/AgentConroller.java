package com.my.yintest.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.my.yintest.javabean.CustomerProfile;
import com.my.yintest.model.Address;
import com.my.yintest.model.Device;
import com.my.yintest.repository.CustomerRepository;
import com.my.yintest.service.AddressService;
import com.my.yintest.service.CustomerService;
import com.my.yintest.service.DeviceService;
import com.my.yintest.service.PhotoService;

@Controller
@RequestMapping("/agent")
public class AgentConroller {

	@Autowired
	CustomerService cusService;
	@Autowired
	AddressService adddService;
	@Autowired
	PhotoService ptoService;
	@Autowired
	DeviceService deviceService;
	
	@RequestMapping("/register/customer")
	public ModelAndView createNewCustomer() {		
		ModelAndView moView =  new ModelAndView("agent-register-customer");
		moView.addObject("custPro", new CustomerProfile());
		return moView;		
	}
	
	@RequestMapping("/registered/customer")
	public String createNewCustomerG() {		
		return "agent-register-customer";		
	}
	
	@RequestMapping(value="/registered/customer",method=RequestMethod.POST)
	public ModelAndView createNewCustomerP(@ModelAttribute ("custPro") CustomerProfile custPro, 
			@RequestParam("nricFile") MultipartFile nricFile, @RequestParam("faceFile") MultipartFile faceFile,@RequestParam("houseFile") MultipartFile houseFile,
			BindingResult result, HttpServletRequest request, HttpSession session) throws IOException 
	{		
		ModelAndView moView =  new ModelAndView();
		
        if (result.hasErrors())
        {
            moView.setViewName("agent-register-customer");
        } 
        else
        {      
			if(uploadPhoto(nricFile, faceFile, houseFile, request )!=true)
			{
				moView.setViewName("agent-register-customer");
			}
			else
			{
		        //save UserProfile
				cusService.saveUser(custPro.getCustomer());	       
		        //To add/update foreign key after saving parent  
		        int maxUseId = cusService.getLastCustId();
	
		        //save Address
		        custPro.getAddress().setAddByCust(maxUseId);
		        adddService.saveAddress(custPro.getAddress());
		        //save Photo
		        custPro.getPhoto().setCustByPhoto(maxUseId);
		        custPro.getPhoto().setNricPhoto(nricFile.getOriginalFilename());
		        custPro.getPhoto().setFacePhoto(faceFile.getOriginalFilename());
		        custPro.getPhoto().setHousePhoto(houseFile.getOriginalFilename());
		        ptoService.savePhoto(custPro.getPhoto());
				
				moView.setViewName("success");
				moView.addObject("userName", custPro.getCustomer().getCustName());
			}
		
        }
                
		return moView;				
	}
	
	
	private boolean uploadPhoto(MultipartFile nricFile,MultipartFile faceFile,MultipartFile houseFile, HttpServletRequest request)
			throws IOException  {	
		
		boolean uploading = true; 
		//String project_folder_location = "C:/Users/YIN THU AYE/git/ayeayeaye";
		//String upload_location = project_folder_location +request.getContextPath() +"/src/main/webapp/photo/";

		/*For live host*/
		String upload_location = "Desktop";
		System.out.println("***"+upload_location+"***");
	
		try {
			FileCopyUtils.copy(nricFile.getBytes(), new File(upload_location+nricFile.getOriginalFilename()));
			FileCopyUtils.copy(faceFile.getBytes(), new File(upload_location+houseFile.getOriginalFilename()));
			FileCopyUtils.copy(houseFile.getBytes(), new File(upload_location +faceFile.getOriginalFilename()));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			uploading=false;
		}catch(NullPointerException e)
		{
			uploading=false;
		}
		return uploading;
	}
}
