package com.my.yintest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.my.yintest.model.Device;

public interface DeviceRepository  extends JpaRepository<Device, String>{

}
