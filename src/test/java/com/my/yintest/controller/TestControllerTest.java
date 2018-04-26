package com.my.yintest.controller;

import com.my.yintest.javabean.CustomerProfile;
import com.my.yintest.model.Address;
import com.my.yintest.model.Customer;
import com.my.yintest.model.Device;
import com.my.yintest.model.Photo;
import com.my.yintest.service.AddressService;
import com.my.yintest.service.CustomerService;
import com.my.yintest.service.PhotoService;

import static org.hamcrest.CoreMatchers.hasItem;
import static org.hamcrest.CoreMatchers.instanceOf;
import static org.mockito.Mockito.verifyZeroInteractions;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.fileUpload;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

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


public class TestControllerTest {
	
	@Mock
	private CustomerService customerService;
	@Mock
	private AddressService addressService;	
	@Mock
	private PhotoService photoService;
	
	
	@InjectMocks
	private TestConroller testConroller;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup()
	{
		MockitoAnnotations.initMocks(this);
		mockMvc = MockMvcBuilders.standaloneSetup(testConroller).build();
	}
	
	@Test
	public void testlocatealldevice() throws Exception{
		
		List<Address> addressList = new ArrayList<>();
		addressList.add(new Address());
		addressList.add(new Address());

		
		when(addressService.getAllAddress()).thenReturn((ArrayList<Address>) addressList);
		
		List<Photo> photoList = new ArrayList<>();
		photoList.add(new Photo()); 
		photoList.add(new Photo()); 
		
		when(photoService.getAllPhoto()).thenReturn((ArrayList<Photo>) photoList);
		
		mockMvc.perform(get("/test/device/locate/all"))
				.andExpect(status().isOk())
				.andExpect(view().name("agent-locate-all-device"))
				.andExpect(model().attribute("addressList", hasItem(instanceOf(Address.class))))
				.andExpect(model().attribute("photoList", hasItem(instanceOf(Photo.class))));

	}
	
	@Test
	public void testaddDevice() throws Exception{
		verifyZeroInteractions(customerService);
		
		List<Customer> cusList = new ArrayList<Customer>();
		cusList.add(new Customer()); 
		cusList.add(new Customer()); 
		cusList.add(new Customer());
		
		when(customerService.getAllCust()).thenReturn((ArrayList<Customer>) cusList);
		
		mockMvc.perform(get("/test/device/add"))
				.andExpect(status().isOk())
				.andExpect(view().name("test-add-device"))
				.andExpect(model().attribute("dev", instanceOf(Device.class)))
				.andExpect(model().attribute("cusList", hasItem(instanceOf(Customer.class)) ));
	}
	
	@Test
	public void testaddedDeviceG() throws Exception{
		verifyZeroInteractions(customerService);

		mockMvc.perform(get("/test/device/added"))
				.andExpect(status().isOk())
				.andExpect(view().name("test-add-device"));
	}

}
