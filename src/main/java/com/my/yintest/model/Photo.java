package com.my.yintest.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="customer_photo")
public class Photo {
	
	@Id
	@Column(name="photo_id")
	private int photoId;
	
	@Column(name="nric_photo")
	private String nricPhoto;
	
	@Column(name="face_photo")
	private String facePhoto;
	
	@Column(name="house_photo")
	private String housePhoto;
	
	@Column(name="cust_by_photo")
	private int custByPhoto;
	
	@OneToOne (cascade=CascadeType.ALL)
	@JoinColumn(name="photobyuser", insertable=false, updatable=false)
	private Customer custPtoModel;

	public Photo() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public Photo(int photoId, String nricPhoto, String facePhoto, String housePhoto, int custByPhoto,
			Customer custPtoModel) {
		super();
		this.photoId = photoId;
		this.nricPhoto = nricPhoto;
		this.facePhoto = facePhoto;
		this.housePhoto = housePhoto;
		this.custByPhoto = custByPhoto;
		this.custPtoModel = custPtoModel;
	}



	public int getPhotoId() {
		return photoId;
	}

	public void setPhotoId(int photoId) {
		this.photoId = photoId;
	}

	public String getNricPhoto() {
		return nricPhoto;
	}

	public void setNricPhoto(String nricPhoto) {
		this.nricPhoto = nricPhoto;
	}

	public String getFacePhoto() {
		return facePhoto;
	}

	public void setFacePhoto(String facePhoto) {
		this.facePhoto = facePhoto;
	}

	public String getHousePhoto() {
		return housePhoto;
	}

	public void setHousePhoto(String housePhoto) {
		this.housePhoto = housePhoto;
	}

	public int getCustByPhoto() {
		return custByPhoto;
	}

	public void setCustByPhoto(int custByPhoto) {
		this.custByPhoto = custByPhoto;
	}


	public Customer getCustPtoModel() {
		return custPtoModel;
	}



	public void setCustPtoModel(Customer custPtoModel) {
		this.custPtoModel = custPtoModel;
	}



	@Override
	public String toString() {
		return "Photo [photoId=" + photoId + ", nricPhoto=" + nricPhoto + ", facePhoto=" + facePhoto + ", housePhoto="
				+ housePhoto + ", custByPhoto=" + custByPhoto + ", custPtoModel=" + custPtoModel + "]";
	}

}
