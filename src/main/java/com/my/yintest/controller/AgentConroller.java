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
import org.springframework.ui.Model;
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
import com.my.yintest.model.Customer;
import com.my.yintest.model.Device;
import com.my.yintest.model.Photo;
import com.my.yintest.repository.CustomerRepository;
import com.my.yintest.service.AddressService;
import com.my.yintest.service.CustomerService;
import com.my.yintest.service.DeviceService;
import com.my.yintest.service.PhotoService;

@Controller
@RequestMapping("/agent")
public class AgentConroller {

/*	@Autowired
	CustomerService cusService;*/
	@Autowired
	AddressService adddService;
	@Autowired
	PhotoService ptoService;
	@Autowired
	DeviceService deviceService;
	
	
	private CustomerService cusService;
	
	@Autowired
	public void setCusService(CustomerService cusService) {
		this.cusService = cusService;
	}
	
	@RequestMapping("/register/customer")
	public String createNewCustomer(Model model) {		
		model.addAttribute("custNew", new Customer());
		model.addAttribute("addressNew", new Address());
		return "agent-register-customer" ;		
	}
	
	@RequestMapping(value="/registered/customer",method=RequestMethod.GET)
	public String createdNewCustomerG() {		
		return "agent-register-customer";		
	}
	
	@RequestMapping(value="/registered/customer",method=RequestMethod.POST)
	public String createdNewCustomerP(Model model, @ModelAttribute ("Customer") Customer customer, @ModelAttribute ("Address") Address address,		 
			@RequestParam("nricFile") MultipartFile nricFile, @RequestParam("faceFile") MultipartFile faceFile,@RequestParam("houseFile") MultipartFile houseFile,
			BindingResult result, HttpServletRequest request, HttpSession session) throws IOException 
	{		
		String modelView = "agent-register-customer";
		
        if (result.hasErrors())
        {
            modelView = "agent-register-customer";
        } 
        else
        {      
			if(uploadPhoto(nricFile, faceFile, houseFile, request )!=true)
			{
				modelView = "agent-register-customer";
			}
			else
			{
		        //save UserProfile
				cusService.saveUser(customer);	       
		        //To add/update foreign key after saving parent  
		        int maxUseId = cusService.getLastCustId();
	
		        //save Address
		        address.setAddByCust(maxUseId);
		        adddService.saveAddress(address);
		        //save Photo
		        Photo photo = new Photo();
		        photo.setCustByPhoto(maxUseId);
		        photo.setNricPhoto(nricFile.getOriginalFilename());
		        photo.setFacePhoto(faceFile.getOriginalFilename());
		        photo.setHousePhoto(houseFile.getOriginalFilename());
		        ptoService.savePhoto(photo);

				modelView = "success";
				model.addAttribute("userName", customer.getCustName());
			}
		
        }
                
		return modelView;				
	}
	
	private boolean uploadPhoto(MultipartFile nricFile,MultipartFile faceFile,MultipartFile houseFile, HttpServletRequest request)
			throws IOException  {	
		
		boolean uploading = true; 
		String project_folder_location = "C:/Users/YIN THU AYE/git/ayeayeaye";
		String upload_location = project_folder_location +request.getContextPath() +"/src/main/webapp/photo/";

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
