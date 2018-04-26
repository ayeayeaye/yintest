package com.my.yintest.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.my.yintest.model.Customer;


public interface CustomerRepository extends JpaRepository<Customer, String> {

	@Query("select max(cust.custId) from Customer cust")
	int getLastCustId();

	@Query("SELECT c FROM Customer c WHERE c.custId=:id")
	Customer getCustomer(@Param("id") Integer id);
	

}
