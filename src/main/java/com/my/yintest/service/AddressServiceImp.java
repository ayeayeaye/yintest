package com.my.yintest.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.my.yintest.model.Address;
import com.my.yintest.repository.AddressRepository;


@Service
public class AddressServiceImp implements AddressService {

	@Resource
	AddressRepository repository;
	

	@Override
	public void saveAddress(Address address) {
		repository.saveAndFlush(address);
	}


	@Override
	public ArrayList<Address> getAllAddress() {
		ArrayList<Address> adList = (ArrayList<Address>) repository.findAll();
		return adList;
	}


}
