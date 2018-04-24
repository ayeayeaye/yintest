package com.my.yintest.model;


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;



@Entity
@Table(name="customer_address")
public class Address {
	
	@Id
	@Column(name="address_id")
	private int addressId;
	@Column(name="road_name")
	private String roadName;
	@Column(name="latitude")
	private String lat;
	@Column(name="longitude")
	private String longt;
	@Column(name="add_by_customer")
	private int addByCust;
	
	@OneToOne (cascade=CascadeType.ALL)
	@JoinColumn(name="add_by_customer", insertable=false, updatable=false)
	private Customer custAddModel;;
	
	
	public Address() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Address(int addressId, String roadName, String lat, String longt, int addByCust, Customer custAddModel) {
		super();
		this.addressId = addressId;
		this.roadName = roadName;
		this.lat = lat;
		this.longt = longt;
		this.addByCust = addByCust;
		this.custAddModel = custAddModel;
	}



	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public String getRoadName() {
		return roadName;
	}

	public void setRoadName(String roadName) {
		this.roadName = roadName;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLongt() {
		return longt;
	}

	public void setLongt(String longt) {
		this.longt = longt;
	}

	public int getAddByCust() {
		return addByCust;
	}

	public void setAddByCust(int addByCust) {
		this.addByCust = addByCust;
	}

	

	public Customer getCustAddModel() {
		return custAddModel;
	}


	public void setCustAddModel(Customer custAddModel) {
		this.custAddModel = custAddModel;
	}


	@Override
	public String toString() {
		return "Address [addressId=" + addressId + ", roadName=" + roadName + ", lat=" + lat + ", longt=" + longt
				+ ", addByCust=" + addByCust + ", custAddModel=" + custAddModel + "]";
	}
	
}