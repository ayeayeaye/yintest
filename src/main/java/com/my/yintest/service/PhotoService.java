package com.my.yintest.service;

import java.util.ArrayList;

import com.my.yintest.model.Photo;


public interface PhotoService {

	void savePhoto(Photo photo);

	ArrayList<Photo> getAllPhoto();

}
