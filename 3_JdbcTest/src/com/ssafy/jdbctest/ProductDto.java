package com.ssafy.jdbctest;

//DTO(Data Transfer Object), VO(Value Object)
//setter & getter , toString() 추가
public class ProductDto {
	private String productId;
	private String productName;
	private int productPrice;
	private String productDesc;
	private String registerDate;

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}


	@Override
	public String toString() {
		return productId + "\t" + productName + " "+"\t" + productPrice + "\t" + productDesc + "\t" + registerDate;
	}
	
	public String getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

}

