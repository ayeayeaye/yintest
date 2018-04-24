package com.my.yintest.javabean;

import com.my.yintest.model.Address;
import com.my.yintest.model.Customer;
import com.my.yintest.model.Photo;

public class CustomerProfile {

	Customer customer = new Customer();
	Photo photo = new Photo();
	Address address = new Address();

	
		
	public CustomerProfile() {
		super();
		// TODO Auto-generated constructor stub
	}



	public CustomerProfile(Customer customer, Photo photo, Address address) {
		super();
		this.customer = customer;
		this.photo = photo;
		this.address = address;
	}



	public Customer getCustomer() {
		return customer;
	}



	public void setCustomer(Customer customer) {
		this.customer = customer;
	}



	public Photo getPhoto() {
		return photo;
	}



	public void setPhoto(Photo photo) {
		this.photo = photo;
	}



	public Address getAddress() {
		return address;
	}



	public void setAddress(Address address) {
		this.address = address;
	}



	@Override
	public String toString() {
		return "CustomerProfile [customer=" + customer + ", photo=" + photo + ", address=" + address + "]";
	}

	
	
	
}
