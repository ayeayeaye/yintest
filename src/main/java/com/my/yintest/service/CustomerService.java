package com.my.yintest.service;

import java.util.ArrayList;

import com.my.yintest.model.Customer;

public interface CustomerService {
	
	void saveUser(Customer cust);
	int getLastCustId();
	ArrayList<Customer> getAllCust();

}
