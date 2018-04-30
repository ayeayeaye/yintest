package com.my.yintest.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.my.yintest.model.Address;
import com.my.yintest.model.Payment;
import com.my.yintest.repository.AddressRepository;
import com.my.yintest.repository.PaymentRepository;


@Service
public class PaymentServiceImp implements PaymentService {

	@Resource
	PaymentRepository repository;

	@Override
	public ArrayList<Payment> findPaymentbyDeviceId(Integer deviceId) {
		ArrayList<Payment> paymentList = repository.findPaymentbyDeviceId(deviceId);
		return paymentList;
	}

	@Override
	public void savePayment(Payment payment) {
		repository.saveAndFlush(payment);		
	}
	


}
