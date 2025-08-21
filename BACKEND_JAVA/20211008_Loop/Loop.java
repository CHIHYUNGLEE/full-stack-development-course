
public class Loop {

	public static void main(String[] args) {
		//while
		
		int num = 0;
		//num++;//1
		//num++;//2
		//num++;//3
		//...1500번 반복

		//5num 변수값을 1증가하기
		int i = 0; //i는 반복횟수
		while(i<5) {
			num++;
			i++;
			System.out.println("반복횟수 : "+i + ",num변수값 : " + num);
		
		}
		//for(초기값 ; 조건식;증감식){}
		System.out.println("for문 이용");
		int numa = 0;
		for(int a = 0; a < 5 ; ) {
			numa++;
			a++;
			System.out.println("반복횟수 : "+a + ",num변수값 : " + numa);
		}
		
System.out.println("------------------------------------------------------------");				
		
		
		//5번반복하면서 num변수값을 3배 증가하기
		num = 1; 
		i = 0;
		while(i<5) {
			num*=3;
			i++;
			System.out.println("반복횟수 : "+i + ",num변수값 : " + num);
		}
		
		System.out.println("for문 이용");
		numa =1;
		for(int a=0; a<5;) {
			numa*=3;
			a++;
			System.out.println("반복횟수 : "+a + ",num변수값 : " + numa);
		}
		
System.out.println("------------------------------------------------------------");				
		
		
		//while문의 규칙.
		num = 1;
		i = 0;
		int sum=0;
		while(i<10) {
			sum +=num;
			i++;
			num++;
			
		}
		System.out.println("1에서 10까지의 합 : " + sum);
		
		System.out.println("for문 이용");
		
		numa=1;
		int suma = 0;
		for(int a=0 ; a<10 ; a++) {
			suma+=numa;
			numa++;			
		}
		System.out.println("1에서 10까지의 합 : " + suma);
		
		
		
System.out.println("------------------------------------------------------------");				
		
		
		//변수의 최소화
		num = 1;
		sum = 0;
		while(num<=10) {
			sum += num;
			num++;
		}
		
System.out.println("------------------------------------------------------------");		
		
		//실습 1~10까지 숫자를 출력하시오.
		num=1;
		while(num<=10) {
			System.out.println("실습 1~10까지 숫자를 출력하시오 : " + num++);
		}
		//실습 1~10까지의 숫자중 홀수를 출력하시오.
		num=1;
		while(num<10) {
			System.out.println("실습 1~10까지의 숫자중 홀수를 출력하시오 : " + num);
			num+=2;
		}
		
		
		System.out.println("for문 이용 : 1~10까지의 숫자중 홀수를 출력하시오");
		for(numa = 1;numa<10;numa+=2) {
			System.out.println("실습 1~10까지의 숫자중 홀수를 출력하시오 : " + numa);
		}
		
		//실습 1~10에서 홀수의 합 출력하시오.
		num=1;
		int oddsum = 0;
		while(num<=10) {
			oddsum += num;
			num+=2;	
		}
		System.out.println("실습 1~10에서 홀수의 합 출력하시오. : " + oddsum);
		
		//실습 1부터 홀수 10개를 출력하시오.
		num = 1;
		i = 1;
		while(i<=10) {
			i++;
			System.out.println("실습 1부터 홀수 10개를 출력하시오.:" + num);
			num+=2;
		}
		
System.out.println("------------------------------------------------------------");		
		
		//알파벳 대문자 7개 출력하시오.
		char c = 'A';
		while(c<='G') {
			System.out.println("알파벳 대문자 7개 출력하시오 : "+c);
			c++;
		}

		
		
System.out.println("------------------------------------------------------------");		
		
		//키보드로 값 입력하기
		
//		java.util.Scanner sc;
//		sc = new java.util.Scanner(System.in);
//		
//		i= 0;
//		while(i<=10) {
//			System.out.print("입력하시오 : ");
//			String readvalue = sc.nextLine();
//			System.out.println("입력하신 값은 " + readvalue + "입니다");
//		}
//		String readvalue = "";
//		while(!readvalue.equals("quit")) {
//			System.out.print("입력하시오(종료하려면 quit입력하세요) : ");
//			readvalue = sc.nextLine();
//			System.out.println("입력하신 값은 " + readvalue + "입니다");
//		}
		
//		System.out.println("for문을 이용해 키보드 값 입력하기.");
//		for( ;!readvalue.equals("quit"); ) {
//			System.out.print("입력하시오(종료하려면 quit입력하세요) : ");
//			readvalue = sc.nextLine();
//			System.out.println("입력하신 값은 " + readvalue + "입니다");
//		}
//		System.out.println("do while문을 이용해 키보드 값 입력하기.");
//				do {
//					System.out.print("입력하시오(종료하려면 quit입력하세요) : ");
//					readvalue = sc.nextLine();
//					System.out.println("입력하신 값은 " + readvalue + "입니다");
//				}while (!readvalue.equals("quit"));
		
//		System.out.println("while,if문을 이용해 키보드 값 입력하기.");
//		readvalue = "";
//		while(true) {
//			System.out.print("입력하시오(종료하려면 quit입력하세요) : ");
//			readvalue = sc.nextLine();
//			if (readvalue.equals("quit")) {
//				break;
//			}
//			System.out.println("입력하신 값은 " + readvalue + "입니다");
//		}
		
System.out.println("------------------------------------------------------------");		
		
		//2중 반복문
		//구구단 4단 1에서 9까지 출력
		int dan = 4;
		num=1;
		while(num<=9) {
			System.out.println("구구단 4단 1에서 9까지 출력 : " + dan*num);
			num++;
		}
		//구구단 2단에서 8단까지 출력하기. 대신 값들끼리 탭으로 구분
		System.out.println("구구단 2단에서 8단까지 출력하기");
		dan = 2;
		while(dan <= 8) {
			num=1;
			while(num<=9) {
				System.out.print((dan*num) + "\t");
				num++;				
			}
			System.out.println();
			dan++;
		}
		//구구단 출력하는데 대신 10의 배수는 제외할때.1
		System.out.println("구구단 2단에서 8단까지 출력하기 10의 배수는 제외1");
		dan = 2;
		while(dan <= 8) {
			num=1;
			while(num<=9) {
				if(dan*num%10 !=0)
				System.out.print((dan*num) + "\t");
				num++;				
			}
			System.out.println();
			dan++;
		}
		//구구단 출력하는데 대신 10의 배수는 제외할때.2
		System.out.println("구구단 2단에서 8단까지 출력하기 10의 배수는 제외2");
		dan = 2;
		while(dan <= 8) {
			num=1;
			while(num<=9) {
				if(dan*num%10 ==0) {
					num++;
					continue;
				}
				System.out.print((dan*num) + "\t");
				num++;
			}	
			System.out.println();
			dan++;		 
		}
		
System.out.println("------------------------------------------------------------");		
		
		//피보나치 수열값 출력하기.
		//1,1,2,3,5,8,13,21,34,55.....
		System.out.println("피보나치 수열값 10개 출력하기.");
		int bb = 1;//이전이전숫자
		int b = 0;//이전숫자
		int current = bb + b;
		i = 0;
			while(i<=9) {
			System.out.println(current);
			bb=b;
			b = current;
			current = bb + b;
			i++;
			}
			
		//실습 1~30까지중 소수판별
		
		
			
		//숫자 1부터의 합이 100미만인 최대숫자를 출력하시오.
//		System.out.println("while 숫자 1부터의 합이 100미만인 최대숫자를 출력");
		int sumf = 0;
		int numf = 1;
//		while(sumf+numf<13) {	
//			sumf+=numf;
//			numf++;	
//		}		
//		numf--;
//		System.out.println("최대숫자는 "+ numf);
//		
		System.out.println("do while 숫자 1부터의 합이 100미만인 최대숫자를 출력");
		
		do {
			sumf+=numf;
			numf++;
		}while(sumf+numf<13);
		numf--;
		System.out.println("최대숫자는 "+numf);
	}

}


