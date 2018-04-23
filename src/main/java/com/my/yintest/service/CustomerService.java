package com.my.yintest.service;

import com.my.yintest.model.Customer;

public interface CustomerService {
	
	void saveUser(Customer cust);
	int getLastCustId();

}
