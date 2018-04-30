package com.my.yintest.controller;

import com.my.yintest.javabean.CustomerProfile;
import com.my.yintest.model.Address;
import com.my.yintest.model.Customer;
import com.my.yintest.model.Photo;
import com.my.yintest.service.CustomerService;

import static org.hamcrest.CoreMatchers.instanceOf;
import static org.mockito.Mockito.verifyZeroInteractions;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.fileUpload;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.io.File;
import java.io.FileInputStream;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


public class AgentControllerTest {
	
	@Mock
	private CustomerService customerService;
	
	
	@InjectMocks
	private AgentConroller agentConroller;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup()
	{
		MockitoAnnotations.initMocks(this);
		mockMvc = MockMvcBuilders.standaloneSetup(agentConroller).build();
	}
	
	@Test
	public void testcreateNewCustomer() throws Exception{
		verifyZeroInteractions(customerService);
		
		mockMvc.perform(get("/agent/register/customer"))
				.andExpect(status().isOk())
				.andExpect(view().name("agent-register-customer"))
				.andExpect(model().attribute("custNew", instanceOf(Customer.class)))
				.andExpect(model().attribute("addressNew", instanceOf(Address.class)));
	}
	
/*	@Test
	public void testcreatedNewCustomerP() throws Exception{
		
		//Customer customer = new Customer();
		File f1 = new File( "C:\\Users\\YIN THU AYE\\git\\ayeayeaye\\yintest\\src\\main\\webapp\\photo\\a1.jpg");
		System.out.println(f1.isFile()+"  "+f1.getName()+ " "+f1.exists());
		FileInputStream fi1 = new FileInputStream(f1);
		MockMultipartFile fstmp1 = new MockMultipartFile("upload", f1.getName(), "multipart/form-data",fi1);
		
		File f2 = new File( "C:\\Users\\YIN THU AYE\\git\\ayeayeaye\\yintest\\src\\main\\webapp\\photo\\a2.jpg");
		System.out.println(f2.isFile()+"  "+f2.getName()+f2.exists());
		FileInputStream fi2 = new FileInputStream(f2);
		MockMultipartFile fstmp2 = new MockMultipartFile("upload", f2.getName(), "multipart/form-data",fi2);
		
		File f3 = new File( "C:\\Users\\YIN THU AYE\\git\\ayeayeaye\\yintest\\src\\main\\webapp\\photo\\a3.jpg");
		System.out.println(f3.isFile()+"  "+f3.getName()+f3.exists());
		FileInputStream fi3 = new FileInputStream(f3);
		MockMultipartFile fstmp3 = new MockMultipartFile("upload", f3.getName(), "multipart/form-data",fi3);
		
		
		mockMvc.perform(fileUpload("/agent/registered/customer").file(fstmp1).file(fstmp2).file(fstmp3)
				.param("nricFile", "nricFile")
				.param("faceFile" , "faceFile")
				.param("houseFile" , "houseFile").contentType(MediaType.MULTIPART_FORM_DATA))
				.andExpect(status().isOk())
				.andExpect(view().name("success"))
				.andExpect(model().attribute("custNew", instanceOf(Customer.class)))
				.andExpect(model().attribute("addressNew", instanceOf(Address.class)));

	}*/
/*	@Test
	public void testcreatedNewCustomerP() throws Exception{
		
		//Customer customer = new Customer();
		FileInputStream inputFile = new FileInputStream( "C:/Users/YIN THU AYE/git/ayeayeaye/yintest/src/main/webapp/photo/");  
		MockMultipartFile file1 = new MockMultipartFile("file", "nricFile", "multipart/form-data", inputFile);
		MockMultipartFile file2 = new MockMultipartFile("file", "faceFile", "multipart/form-data", inputFile);
		MockMultipartFile file3 = new MockMultipartFile("file", "houseFile", "multipart/form-data", inputFile);
		
		
		mockMvc.perform(fileUpload("/agent/registered/customer").file(file1).file(file2).file(file3))
				.andExpect(status().isOk())
				.andExpect(content().contentType(MediaType.ALL))
				.andExpect(view().name("success"))
				.andExpect(model().attribute("custNew", instanceOf(Customer.class)))
				.andExpect(model().attribute("addressNew", instanceOf(Address.class)));

	}*/
	

}
