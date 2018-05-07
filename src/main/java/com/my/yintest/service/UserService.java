package com.my.yintest.service;

import java.util.ArrayList;
import java.util.List;

import com.my.yintest.model.Address;
import com.my.yintest.model.User;


public interface UserService {

	List<User> getAllUser();

	void saveUser(User userAgent);

}
