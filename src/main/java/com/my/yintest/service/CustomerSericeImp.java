package com.my.yintest.service;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.my.yintest.model.Customer;
import com.my.yintest.repository.CustomerRepository;


@Service
public class CustomerSericeImp implements CustomerService {

	@Resource
	CustomerRepository repository;

	@Override
	public void saveUser(Customer cust) {
		repository.saveAndFlush(cust);
	}

	@Override
	public int getLastCustId() {
		int lastCustId = repository.getLastCustId();
		return lastCustId;
	}

	@Override
	public ArrayList<Customer> getAllCust() {
		ArrayList<Customer> custList = (ArrayList<Customer>) repository.findAll();
		return custList;
	}
}
