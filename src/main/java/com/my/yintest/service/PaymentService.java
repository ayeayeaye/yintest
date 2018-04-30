package com.my.yintest.service;

import java.util.ArrayList;

import com.my.yintest.model.Address;
import com.my.yintest.model.Payment;


public interface PaymentService {

	ArrayList<Payment> findPaymentbyDeviceId(Integer deviceId);

	void savePayment(Payment payment);


}
