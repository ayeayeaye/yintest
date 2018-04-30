package com.my.yintest.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.my.yintest.model.Address;
import com.my.yintest.model.Customer;
import com.my.yintest.model.Payment;


public interface PaymentRepository extends JpaRepository<Payment, String> {

	@Query("SELECT p FROM Payment p WHERE p.payForDevice=:id")
	ArrayList<Payment> findPaymentbyDeviceId(@Param("id") Integer deviceId);

}
