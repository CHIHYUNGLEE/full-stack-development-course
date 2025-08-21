package com.my.customer.dao;

import com.my.customer.vo.Customer;

/**
 * 고객객체를 저장소에 추가,조회,수정,삭제하는 클래스이다.
 * @author eno71
 *
 */
public class CustomerDAO{
	
	private Customer []customers; //고객저장소
	private int count;//현재 저장된 고객수

	public CustomerDAO () {
		customers = new Customer[5];
	}

	public CustomerDAO(int size) {
		customers = new Customer[size];
	}


	/**
	 * 고객정보를 업데이트함. - 1
	 * @param cusUpdate
	 */
	public void add(Customer cusadd) {	
		if(count>=customers.length) {
			System.out.println("저장소가 꽉 찼습니다.");
		}else {
			customers[count] = cusadd;
			count++;//한줄로 쓸수는 잇으나 증감연산자는 같이 쓰는걸 권하지않음.
		}
	}
	
	
	/**
	 * 고객저장소의 크기와 고객수 출력 및 고객정보 출력. - 2
	 */
	public void printinfo() {
		System.out.println("고객저장소의 크기 : "+customers.length);
		System.out.println("저장된 고객수 : "+count);
		
		for(int i = 0; i<count;i++) {
			Customer c = customers [i];
			System.out.print("["+i+"]");
			c.printinfo();			
		}
	}
	
	/**
	 * 모든 고객정보 조회. - 3
	 * @return
	 */	
	public Customer[] findAll() {		
		Customer[] allc = new Customer[count]; //정보를 저장할 새 배열을 만듬.그 정보를 allc[].
		
		if(count == 0 ){
			System.out.println("고객정보가 없습니다.");		
		}else{	
			//System.arraycopy(customers, 0, all, 000, count);	
		    for(int i=0;i<count;i++) {
			allc[i] = customers[i];
			}
		}
		return allc;	
	}

	

	/**
	 * 아디를 검색. -4
	 * @param id
	 * @return
	 */
	public Customer idSearch(String id){
		for(int i=0;i<count;i++) {
//			Customer c = customers[i];
//			String cID = c.id;  
//			if(cID.equals(id)) {
//				return c;
//			}
			if(customers[i].getId().equals(id)) {
				return customers[i];
			}
		}
		return null;
	}
	
	
	/**
	 * 단어를 포함하는 이름 검색(contains) - 5
	 * @param searchName
	 * @return
	 */
	public Customer[] nameSearch(String searchName) {
		
		int wordcnt = 0;
		for(int i = 0; i<count ; i++) {
			Customer c = customers[i];
			String cname = c.getName();//저장된 고객이름c.name과 입력된 단어  //customers[i].name.contains(cname)
			if(cname.contains(searchName)) {
				wordcnt++;
			}
		}

		Customer []namesearcharr = new Customer[wordcnt];
		int carrindex = 0;
		for(int i = 0; i<count ; i++) {			
			Customer c = customers[i];
			String cname = c.getName();//저장된 고객이름c.name과 입력된 단어  //customers[i].name.contains(cname)
			if(cname.contains(searchName)) {
				namesearcharr[carrindex] = c;
				carrindex++;
				return namesearcharr;
			}			
		}		
//		Customer []carr1 = new Customer[count];
//		for(int i = 0; i<count ; i++) {			
//			Customer c = customers[i];
//			String cname = c.name;//저장된 고객이름c.name과 입력된 단어  //customers[i].name.contains(cname)
//			if(cname.contains(searchName)) {
//				carr1[carrindex] = c;
//				carrindex++;
//			}			
//		}
//		Customer []carr = null;
//		if(carrIndex > 0) { 
//			carr = new Customer[carrindex];
//			System.arraycopy(carr1, 0, carr, 0, carrIndex);
//		}
		return null;
		}
		/**
		 * 고객의 정보를 수정. - 6
		 * @param newc
		 */
	public void modify (Customer newc){
			Customer oldc = idSearch(newc.getId());
			boolean flag = false;
			if(oldc != null) {
				if(!"".equals(newc.getPwd())) {
						oldc.setPwd(newc.getPwd());
						flag = true;		
				}
				if(!"".equals(newc.getName())) {
					oldc.setName(newc.getName());
					flag = true;
				}
				if(!"".equals(newc.getAddress())) {
					oldc.setAddress(newc.getAddress());
					flag = true;
				}
			}
			
			if(flag) {
				System.out.println("고객정보가 변경되었습니다.");
			}else {
				System.out.println("고객정보가 변경되지않았습니다.");
			}
	
		}
		/**
		 * 고객의 정보를 삭제. - 7
		 * @param deletec
		 */
	public void delete(String id) {
			int  index;//삭제될 정보의 위치를 index
			
			//index를 반복문으로 찾아냄.	
			for(index = 0; index<count ; index++) {
				Customer deletec = customers [index];
				if(deletec.getId().equals(id)) {
					break;
				}
			}
			//index정보를 index+1의 정보로 채우고 하나씩 땡김.
			if(index<count) {
				count--;
				for(int i=index ; i<count;i++) {
					customers[i]=customers[i+1];
				}
			
			//맨 마지막 비게되는 정보는 NULL	
			customers[count] = null;
			}
			System.out.println("고객정보가 삭제되었습니다.");	
		} 
		
} 
