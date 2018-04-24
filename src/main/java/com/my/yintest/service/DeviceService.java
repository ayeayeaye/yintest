package com.my.yintest.service;

import java.util.ArrayList;

import com.my.yintest.model.Device;

public interface DeviceService {

	void saveDevice(Device dev);

	ArrayList<Device> getAllDevice();
}
