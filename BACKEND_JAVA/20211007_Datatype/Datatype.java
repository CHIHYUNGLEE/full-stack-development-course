class Datatype{
	public static void main(String[] args){
		//������
		byte b;
		b=127;
		//b=128;
		
		int i = 5;	
		System.out.println(i); //5
		System.out.println(5); //5 �����Ϸ��� 5�� int�� �Ǵ�
		
		//long lo1 = 12345678901234;
		long lo2 = 12345678901234L;

		double d = 45.67;
		System.out.println(d); //45.67

		//i=45.67; 
		System.out.println(45.67F); // 

		//������
		char c;
		c = 'A'; 
		c = 49;// '1'�� ����. 
		System.out.println(c);

		c = 44032;
		System.out.println(c);

		//����
		boolean flag;
		//flag = True; �빮�ڶ� �����Ͽ�������.
		flag = true;

		//�ڷ��� ��ȯ
		//�ڵ��� ��ȯ byte -> short -> int -> long -> float -> double
		//		    char	->


		i = b;
		d = i;
		System.out.println(b); //127
		System.out.println(i); //127
		System.out.println(d); //127.0

		i=c; //'��'�� utf-16�� i�� ����.
		System.out.println(i); //44032

		//������ ��ȯ *���� �Ҿ�������� ����.
		i=128;
		//b = i; //error�߻�
		b = (byte)i;  //���������� ��ȯ�� : ()	
		System.out.println(b); //-128

		i =129;
		b = (byte)i;
		System.out.println(b); //-127

		d = 45.67;
		i = (int)d;
		System.out.println(i); //45
 }
}