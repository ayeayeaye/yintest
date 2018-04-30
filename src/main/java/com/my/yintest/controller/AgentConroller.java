package com.my.yintest.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.my.yintest.javabean.CustomerProfile;
import com.my.yintest.model.Address;
import com.my.yintest.model.Customer;
import com.my.yintest.model.Device;
import com.my.yintest.model.Payment;
import com.my.yintest.model.Photo;
import com.my.yintest.repository.CustomerRepository;
import com.my.yintest.service.AddressService;
import com.my.yintest.service.CustomerService;
import com.my.yintest.service.DeviceService;
import com.my.yintest.service.PaymentService;
import com.my.yintest.service.PhotoService;


@Controller
@RequestMapping("/agent")
public class AgentConroller {

/*	@Autowired
	CustomerService cusService;*/
	@Autowired
	AddressService addService;
	@Autowired
	PhotoService ptoService;
	@Autowired
	DeviceService deviceService;
	@Autowired
	PaymentService payService;
	
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
		        addService.saveAddress(address);
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
	
	@RequestMapping("/view/all/customer")
	public String viewAllCustomer(Model model) {
		model.addAttribute("addList", addService.getAllAddress());
		return "agent-view-all-customer" ;		
	}
	@RequestMapping(value="/customer/detail/{custId}")
	public String viewAUserInfo(Model model, @PathVariable Integer custId,  HttpSession session){
		model.addAttribute("cust", cusService.getCustomer(custId));		
		model.addAttribute("newPayment", new Payment());
		return "agent-customer-details";
	}

	@RequestMapping("/paid/{deviceId}")
	public String customPaidForDevice(Model model,  @ModelAttribute ("newPayment") Payment payment,  @PathVariable Integer deviceId,  HttpSession session) {
		//get Device for calculation
		List<Payment> payListbyDev =payService.findPaymentbyDeviceId(deviceId);
				
		/*dummy*/
		double dummyInitialCreditAmt = 200;
		int serveAgentId = 1;				
		payment.setPayForDevice(deviceId);			
		payment.setTotalCreditAmt(dummyInitialCreditAmt);
		
		if(payListbyDev.size() == 0 )
		{
			//start use - first pay
			payment.setCurrentCreditAmt(dummyInitialCreditAmt-payment.getPayAmt());
			
		}
		else
		{
			//paid at least one time
			double lastCredit =  payListbyDev.get(payListbyDev.size()-1).getCurrentCreditAmt();
			payment.setCurrentCreditAmt(lastCredit - payment.getPayAmt());
		}
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		payment.setPayDay(timestamp);
		payment.setPayAgent(serveAgentId);	
		payService.savePayment(payment);
		
		return "success" ;		
	}
	
	/*Method*/
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
