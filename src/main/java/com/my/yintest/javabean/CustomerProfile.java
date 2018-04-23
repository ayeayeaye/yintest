package com.my.yintest.javabean;

import com.my.yintest.model.Address;
import com.my.yintest.model.Customer;
import com.my.yintest.model.Photo;

public class CustomerProfile {

	Customer cust = new Customer();
	Photo photo = new Photo();
	Address address = new Address();
	
		
	public CustomerProfile() {
		super();
		// TODO Auto-generated constructor stub
	}


	public CustomerProfile(Customer cust, Photo photo, Address address) {
		super();
		this.cust = cust;
		this.photo = photo;
		this.address = address;
	}


	public Customer getCust() {
		return cust;
	}


	public void setCust(Customer cust) {
		this.cust = cust;
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
		return "CustomerProfile [cust=" + cust + ", photo=" + photo + ", address=" + address + "]";
	}
	
	
	
}
