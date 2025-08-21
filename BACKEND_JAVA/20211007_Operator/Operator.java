class Operator{
	public static void main(String[] args){
		//산술연산자 +, -, *, /, %
		int a, b, c;
		a = 2;
		b = 3;
		c = a + b; // 5
		c = a/b; //0
		double c1 = a/b; //0.0
		double c2 = (double)a/b; //0.666666...
		System.out.println(c2);

		short s1, s2, s3;
		s1 = 2;
		s2 = 3;
		//s3 = s1 + s2; // int보다 작은 자료형은 산술연산이 불가하다 산술연산시 int로 자동형변환됨.
		s3=(short)(s1+s2);		

		//증감연산자 ++, --
		byte by = 127;
		by++; //by변수값을 1증가시킨다.
		System.out.println(by); //-128

		a=2;
		b=a++; //++연산자는 다른 연산자랑 같이 쓰는걸 권하지 않음.
		System.out.println(b); // 2		

		a=2;
		b=++a;
		System.out.println(b); // 3		

		//대입연산자 =, +=, -=, *=, /= ,%=
		a=2;
		a=a+5;

		a=2;
		a+=5
		
		//비교연산자 >, <, >=, <=, ==, !=
		a=2;
		b=3;
		boolean result = a>b; //
		System.out.println(result); //false
		System.out.println(a!=b); //true
		System.out.println(a==b); //false

		//논리연산자 &, &&, |, ||, !
		(2<3) && (2%3==1) //산비논순서이므로 false		
		result = 	(2<3) && (2%3==1)
		System.out.println(result); 

		result = true || false;
		result = 2<3 || 2%3==1
		System.out.println(result); //true

		//논리연산자에서 두개는 왼쪽만 연산에 참여해서 빠르나 한개는 둘다 참여해서 느려짐.	
 }
}