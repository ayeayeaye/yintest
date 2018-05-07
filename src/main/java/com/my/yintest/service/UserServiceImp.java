package com.my.yintest.service;

import java.util.ArrayList;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.my.yintest.model.User;
import com.my.yintest.repository.UserRepository;


@Service
public class UserServiceImp implements UserService {

	@Resource
	UserRepository repository;

	@Override
	public ArrayList<User> getAllUser() {
		ArrayList<User> userList = (ArrayList<User>) repository.findAll();
		return userList;
	}

	@Override
	public void saveUser(User userAgent) {
		repository.saveAndFlush(userAgent);
	}
	

}
