package com.my.yintest.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.my.yintest.model.Customer;


public interface CustomerRepository extends JpaRepository<Customer, String> {

	@Query("select max(cust.custId) from Customer cust")
	int getLastCustId();


}
