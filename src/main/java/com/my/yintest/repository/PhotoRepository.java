package com.my.yintest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.my.yintest.model.Address;
import com.my.yintest.model.Photo;


public interface PhotoRepository extends JpaRepository<Photo, String> {

}
