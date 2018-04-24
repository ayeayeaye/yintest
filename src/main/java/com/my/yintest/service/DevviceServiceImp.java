package com.my.yintest.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.my.yintest.model.Address;
import com.my.yintest.model.Device;
import com.my.yintest.model.Photo;
import com.my.yintest.repository.AddressRepository;
import com.my.yintest.repository.DeviceRepository;
import com.my.yintest.repository.PhotoRepository;


@Service
public class DevviceServiceImp implements DeviceService {

	@Resource
	DeviceRepository repository;
	

	@Override
	public void saveDevice(Device dev) {
		repository.saveAndFlush(dev);
	}


	@Override
	public ArrayList<Device> getAllDevice() {
		ArrayList<Device> devList = (ArrayList<Device>) repository.findAll();
		return devList;
	}


}
