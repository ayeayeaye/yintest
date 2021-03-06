package com.my.yintest.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.my.yintest.model.Address;
import com.my.yintest.model.Photo;
import com.my.yintest.repository.AddressRepository;
import com.my.yintest.repository.PhotoRepository;


@Service
public class PhotoServiceImp implements PhotoService {

	@Resource
	PhotoRepository repository;
	

	@Override
	public void savePhoto(Photo pto) {
		repository.saveAndFlush(pto);
	}


	@Override
	public ArrayList<Photo> getAllPhoto() {
		ArrayList<Photo> ptoList = (ArrayList<Photo>) repository.findAll();
		return ptoList;
	}


}
