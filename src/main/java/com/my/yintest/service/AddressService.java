package com.my.yintest.service;

import java.util.ArrayList;

import com.my.yintest.model.Address;


public interface AddressService {

	void saveAddress(Address address);

	ArrayList<Address> getAllAddress();



}
