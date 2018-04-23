package com.my.yintest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.my.yintest.model.Address;


public interface AddressRepository extends JpaRepository<Address, String> {

}
