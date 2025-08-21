package com.my.product.vo;

import java.util.Objects;

public class Product {
	private String prodno;
	private String prodname;
	private int prodprice;
	
	public Product() {
		super();
	}

	public Product(String prodno, String prodname, int prodprice) {
		super();
		this.prodno = prodno;
		this.prodname = prodname;
		this.prodprice = prodprice;
	}

	
	//object 오버라이드
	@Override
	public String toString() {
		return "Product [prodNo=" + prodno + ", prodName=" + prodname + ", prodprice=" + prodprice + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(prodno);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		return Objects.equals(prodno, other.prodno);
	}

	
	
	//set,get
	public String getProdNo() {
		return prodno;
	}

	public void setProdNo(String prodNo) {
		this.prodno = prodNo;
	}

	public String getProdName() {
		return prodname;
	}

	public void setProdName(String prodName) {
		this.prodname = prodName;
	}

	public int getProdprice() {
		return prodprice;
	}

	public void setProdprice(int prodprice) {
		this.prodprice = prodprice;
	}
	
	
	
	
	
	
	
	
}
