package com.my.customer.vo;

/**
 * 고객객체용 클래스이다.
 * 고객정보(ID, 비밀번호, 이름, 주소)
 * @author eno71
 *
 */
public class Customer{
	private String id;
	private String pwd;
	private String name;
	private String address;
	public Customer(){}
	
	/**
	 * 고객정보를 초기화한다.
	 * @param id 아이디
	 * @param pwd 비밀번호
	 * @param name 이름
	 * @param address 주소
	 */
	public Customer(String id,String pwd,String name,String address){
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.address = address;
	}	
	/**
	 * 고객정보를 출력한다.
	 */
	public void printinfo() {
		System.out.println("아이디 : "+ id + " 비밀번호 : "+pwd+ " 이름 : "+name+" 주소 : "+address);		
	}
	
	/**
	 * id,pwd,name,address를 set,get한다.
	 * @param id
	 */
	public void setId(String id) {
		this.id = id;
	}
	
	public String getId() {
		return id;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getPwd() {
		return pwd;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getAddress() {
		return address;
	}
}


