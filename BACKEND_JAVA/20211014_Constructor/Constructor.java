class A{
	int iv;
	/*
	 * 기본생성자(default constructor)
	 */ 
	//컴파일시에 생성자가 없다면 매개변수가 없는 생성자를 자동으로 포함시킨다.
	//다음과 같은 생성자코드를 포함시킨다.
	//매개변수가 없는 생성자라고 다 기본 생성자는 아니다.
	//A(){}
	
	A(){}
	A(int iv){
		this.iv = iv;
	}
	void a() {} //이건 그냥 일반 메서드임 생성자 아님.
}




 class Rectangle{
	int x;
	int y;
	int area;
		 
	Rectangle(){}
	
	Rectangle(int x,int y){
		this.x = x;
		this.y = y;
	}
	Rectangle(int z){
//		this.x = z;
//		this.y = z;
		this(z,z); //this생성자 호출:현재객체가 갖고있는 다른 생성자를 호출한다. 개발자쪽 코드양을 줄이기 위한 목적.
	}
	void makeArea() {
		this.area = x*y;
	}
	void printinfo() {
		System.out.println("가로 " + x + " 세로 " + y +"인 사격형의 면적은 "+area+"입니다.");	
	}
}


 
 
public class Constructor {

	public static void main(String[] args) {
		A a1 = new A();
		a1.iv = 1;
		
		A a2 = new A();
		a2.iv = 2;
		
		A a3 = new A();
		a3.iv = 3;
		
		A a4 = new A(4);

		
		
				
		Rectangle r1 = new Rectangle(3,4); //가로길이3 세로길이4인 사각형객체
		Rectangle r2 = new Rectangle(5);
		r1.makeArea();
		r1.printinfo();
		
		r2.makeArea();
		r2.printinfo();
		
		Rectangle r3 = new Rectangle();
		r3.x = 6;
		r3.y = 7;
		r3.makeArea();
		r3.printinfo();
	
	}

}
