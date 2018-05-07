package com.my.yintest.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.my.yintest.model.Customer;
import com.my.yintest.model.User;


public interface UserRepository extends JpaRepository<User, String> {


}
