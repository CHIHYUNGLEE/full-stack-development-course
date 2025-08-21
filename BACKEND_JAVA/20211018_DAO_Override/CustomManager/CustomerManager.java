package com.my.customer;

import com.my.customer.dao.CustomerDAO;
import com.my.customer.vo.Customer;

//사용자용 실행용도
public class CustomerManager {

	public static void main(String[] args) {
		CustomerDAO dao;
		dao = new CustomerDAO();// 최대 5명의 고객정보가 저장될 저장소로 초기화.

		/**
		 * 4가지의 고객정보를 입력하다가 quit를 입력하면 종료하기.
		 * 1~4,9를 입력하면 각 숫자에 맞는 작업제공.
		 */
		java.util.Scanner sc;		
		sc = new java.util.Scanner(System.in);	
		String readvalue;		

		while(true) {
			System.out.println("작업부분: 1-고객추가, 2-저장소 정보, 3-고객전체조회, 4-아이디로 검색, 5-이름으로 검색,");
			System.out.println("       6- 고객정보 수정, 7-고객정보 삭제, 9-종료");
			System.out.println("작업을 선택하세요:");
			readvalue = sc.nextLine();

			if ("1".equals(readvalue)) {

				System.out.println(">>고객 추가<<");
				System.out.println();
				System.out.println("아이디 : ");
				String id = sc.nextLine();
				System.out.println("비밀번호 : ");
				String pwd = sc.nextLine();
				System.out.println("이름 : ");
				String name = sc.nextLine();
				System.out.println("주소 : ");
				String address = sc.nextLine();

				Customer c = new Customer(id,pwd,name,address);
				dao.add(c);

				System.out.println(">>고객 추가 성공<<");
				readvalue = sc.nextLine();

			}else if("2".equals(readvalue)){
				System.out.println(">>저장소 조회<<");
				

				dao.printinfo();

			}else if("3".equals(readvalue)){
				System.out.println(">>고객전체정보조회<<");	
				Customer[]allc = dao.findAll();
				//향상된 for문 사용
				//for(Customer c : all) {                
				for(int i = 0;i<allc.length;i++){  
				
					Customer c = allc[i];
					c.printinfo();
				}
				
				

			}else if("4".equals(readvalue)){ 	
				System.out.println(">>아이디로 검색<<");
				System.out.print("아이디 : ");
				String id = sc.nextLine();
				Customer c = dao.idSearch(id);
				if(c == null) {
					System.out.println(id+" 의 고객이 존재하지 않습니다.");
				}else {
					c.printinfo();				
				}
				
				
			}else if("5".equals(readvalue)){
				System.out.println(">>이름으로 검색<<");
				System.out.print("단어 포함 이름: ");
				String searchName = sc.nextLine();
				Customer[]namesearcharr = dao.nameSearch(searchName);
				if(namesearcharr == null) {
					System.out.println("단어 "+searchName+"을 포함한 고객은 존재하지 않습니다.");
				}else {
					for(Customer c2:namesearcharr) {
						c2.printinfo();
					}
				}
			}else if("6".equals(readvalue)){
				System.out.println(">>고객정보 수정<<");
				System.out.print("아이디 : ");
				String id = sc.nextLine();
				
				//조회
				Customer oldc = dao.idSearch(id);
				
				
				if(oldc == null) {
					System.out.println(id+"의 고객이 존재하지 않습니다.");
				}else {
					System.out.println("변경안하려면 enter를 입력하고 변경하려면 값 입력해주세요");
					System.out.print("비밀번호["+oldc.getPwd()+"]:");
					String newpwd = sc.nextLine();
					if(newpwd.equals(oldc.getPwd())){
						System.out.println("기존 비밀번호와 같습니다");
					}
					//System.out.println("입력된 비번값:"+c6pwd);
					System.out.print("이름["+oldc.getName()+"]:");
					String newname = sc.nextLine();
					if(newname.equals(oldc.getName())){
						System.out.println("기존 비밀번호와 같습니다");
					}
					System.out.print("주소["+oldc.getAddress()+"]:");
					String newaddress = sc.nextLine();
					if(newaddress.equals(oldc.getAddress())){
						System.out.println("기존 비밀번호와 같습니다");
					}
					
					Customer newc = new Customer(id,newpwd,newname,newaddress);
					dao.modify(newc);
				}
			}else if("7".equals(readvalue)){
				System.out.println(">>고객정보 삭제<<");
				System.out.println("삭제할 고객정보의 아이디를 입력하세요.");
				System.out.print("아이디: ");
				String id = sc.nextLine();
				
				Customer c = dao.idSearch(id);
				if(c == null) {
					System.out.println(id+"의 아이디를 가진 고객이 존재하지 않습니다.");
				}else {
					dao.delete(id);
				}
			}else if("9".equals(readvalue)){
				System.out.println("시스템을 종료합니다.");	
				System.exit(0);		
			}else {
				System.out.println("현재 선택된 작업은 없습니다.");
			}
		}

		
	
		/**
		 * 각 고객객체를  배열에 순서대로 참조하기.
		 */
//		Customer c1 = new Customer("id1","p1","n1","a1");
//		dao.add(c1);//고객저장소의 0번index에 c1객체 참조시킨다.
//		Customer c2 = new Customer("id2","p2","n2","a2");
//		dao.add(c2);//고객저장소의 1번index에 c1객체 참조시킨다.
//		Customer c3 = new Customer("id3","p3","n3","a3");
//		dao.add(c3);//고객저장소의 2번index에 c1객체 참조시킨다.
//		
//		dao.add(new Customer("id4", "p4", "n4", "a4"));
//		dao.add(new Customer("id5", "p5", "n5", "a5"));
//		dao.add(new Customer("id6", "p6", "n6", "a6"));
//		dao.add(new Customer("id7", "p7", "n7", "a7"));
//
//		
//		dao.printinfo();

//		dao = new CustomerDAO(10);//10명의 고객정보가 저장될 저장소로 초기화.
//		dao.printinfo();
	}

}

