class Operator{
	public static void main(String[] args){
		//��������� +, -, *, /, %
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
		//s3 = s1 + s2; // int���� ���� �ڷ����� ��������� �Ұ��ϴ� �������� int�� �ڵ�����ȯ��.
		s3=(short)(s1+s2);		

		//���������� ++, --
		byte by = 127;
		by++; //by�������� 1������Ų��.
		System.out.println(by); //-128

		a=2;
		b=a++; //++�����ڴ� �ٸ� �����ڶ� ���� ���°� ������ ����.
		System.out.println(b); // 2		

		a=2;
		b=++a;
		System.out.println(b); // 3		

		//���Կ����� =, +=, -=, *=, /= ,%=
		a=2;
		a=a+5;

		a=2;
		a+=5
		
		//�񱳿����� >, <, >=, <=, ==, !=
		a=2;
		b=3;
		boolean result = a>b; //
		System.out.println(result); //false
		System.out.println(a!=b); //true
		System.out.println(a==b); //false

		//�������� &, &&, |, ||, !
		(2<3) && (2%3==1) //��������̹Ƿ� false		
		result = 	(2<3) && (2%3==1)
		System.out.println(result); 

		result = true || false;
		result = 2<3 || 2%3==1
		System.out.println(result); //true

		//�������ڿ��� �ΰ��� ���ʸ� ���꿡 �����ؼ� ������ �Ѱ��� �Ѵ� �����ؼ� ������.	
 }
}