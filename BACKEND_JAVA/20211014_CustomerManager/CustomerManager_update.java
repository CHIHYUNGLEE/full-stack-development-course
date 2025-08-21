/**
 * 고객객체용 클래스이다.
 * 고객정보(ID, 비밀번호, 이름, 주소)
 * @author eno71
 *
 */
class Customer{
	String id;
	String pwd;
	String name;
	String address;
	
	Customer(){}
	/**
	 * 고객정보를 초기화한다.
	 * @param id 아이디
	 * @param pwd 비밀번호
	 * @param name 이름
	 * @param address 주소
	 */
	Customer(String id,String pwd,String name,String address){
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.address = address;
	}	
	/**
	 * 고객정보를 출력한다.
	 */
	void printinfo() {
		System.out.println("아이디 : "+ id + " 비밀번호 : "+pwd+ " 이름 : "+name+" 주소 : "+address);		
	}
}

/**
 * 고객객체를 저장소에 추가,조회,수정,삭제하는 클래스이다.
 * @author eno71
 *
 */
class CustomerDAO{
	int count;
	
	Customer []customers; //고객저장소
	
	CustomerDAO () {
		customers = new Customer[5];
	}
	
	CustomerDAO(int size) {
		 customers = new Customer[size];
	}	
	void printinfo() {
		System.out.println("고객저장소의 크기 : "+customers.length);
		System.out.println("저장된 고객수 : "+count);
		
		for(int i = 0; i<count;i++) {
			Customer c = customers [i];
			System.out.print("["+i+"]");
			c.printinfo();
		}
	}
	
	void add(Customer cusUpdate) {	
		if(count>=customers.length) {
			System.out.println("저장소가 꽉 찼습니다.");
		}else {
		customers[count] = cusUpdate;
		count++;//한줄로 쓸수는 잇으나 증감연산자는 같이 쓰는걸 권하지않음.
		}
	}		
} 









//사용자용 실행용도
public class CustomerManager {

	public static void main(String[] args) {
		CustomerDAO dao;
		dao = new CustomerDAO();// 최대 5명의 고객정보가 저장될 저장소로 초기화.
	
		/**
		 * 4가지의 고객정보를 입력하다가 quit를 입력하면 종료하기.
		 */
		java.util.Scanner sc;
		sc = new java.util.Scanner(System.in);
		String readvalue;
		
		do {
			System.out.println("아이디 : ");
			String id = sc.nextLine();
			System.out.println("비밀번호 : ");
			String pwd = sc.nextLine();
			System.out.println("이름 : ");
			String name = sc.nextLine();
			System.out.println("주소 : ");
			String address = sc.nextLine();
				
		Customer c1 = new Customer(id,pwd,name,address);
		dao.add(c1);
		
		System.out.println("종료하려면 quit을 입력하세요. 계속하려면 그 외의 값을 입력하세요.");
		readvalue = sc.nextLine();
		}while(!readvalue.equals("quit"));
		
		dao.printinfo();

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
