
public class Condition {

	public static void main(String[] args) {
		//if(조건문){}  if(논리형){}
		int gend = 1;
		if(gend  == 1 || gend ==3) {
			System.out.println("남자");
		}
		
		//if else
		if(gend==1||gend==3) {
			System.out.println("남자");
		}else {
			System.out.println("여자");
		}
		
		//if else if
		int hour = 16;
		if(hour>12 && hour<=15) {
			System.out.println("점심");
		}else if (hour >=6 && hour<12){
			System.out.println("아침");
		}else {
			System.out.println("저녁");
		}
		
		//실습 : 년도에 해당하는 12지를 출력하시오	
		//년도에 12로 나눈 나머지가 0원숭이 1닭 2개 3돼지 4쥐 5소 6호랑이 7토끼 8용 9뱀 10말 11양
		int year = 2030;
		int mod  = year%12;
		
		if (mod == 0) {
			System.out.println("원숭이");
		}else if (mod == 1) {
			System.out.println("닭");
		}else if (mod == 2) {
			System.out.println("개");
		}else if (mod == 3) {
			System.out.println("돼지");
		}else if (mod == 4) {
			System.out.println("쥐");
		}else if (mod == 5) {
			System.out.println("소");
		}else if (mod == 6) {
			System.out.println("호랑이");
		}else if (mod == 7) {
			System.out.println("토끼");
		}else if (mod == 8) {
			System.out.println("용");
		}else if (mod == 9) {
			System.out.println("뱀");
		}else if (mod == 10) {
			System.out.println("말");
		}else {
			System.out.println("양");
		}
			
		int sal1 =41; //1월 급여
		int sal2 =25;
		int sal3 =25;
		int sal4 =33;
		int sal5 =44;
		int sal6 =55;
		//실습 : 상반기 급여의 월평균을 게산하시요. 평균급여값은 소숫점이하값을 정확히 갖는다.
		double saltotal = sal1 + sal2 + sal3 +sal4 +sal5 +sal6;
		System.out.println(saltotal);
		double salavg = (sal1 + sal2 + sal3 +sal4 +sal5 +sal6)/6.0;
		System.out.println(salavg);
		
		//실습 : 상반기 평균급여가 15미만이면 C등급, 15~30 B등급, 30보다크고 45 A등급, 45초과는 A+등급으로 출력하시오.
		
		
		if (salavg < 15) {
			System.out.println("C등급");
		}else if (salavg>=15 && salavg<=30) {
			System.out.println("B등급");
		}else if (salavg>30 && salavg<=45) {
			System.out.println("A등급");
		}else {
			System.out.println("A+등급");
		}
		
		//문자열을 비교할땐
		String s1 = new String("가나다");
		String s2 = new String("가나다");
		System.out.println(s1==s2); // false
		System.out.println(s1.equals(s2)); //true
		
		//1에서 4사이의 랜덤의 수를 원할때
		double r = Math.random(); //0.0 <=r < 1.0
				System.out.println(r);
		int intr = (int)(r*3)+1;
				System.out.println("컴퓨터가 낸 값 : "+ intr);
				
		if (intr == 1) {
			System.out.println("가위");
		}else if (intr ==2) {
			System.out.println("바위");
		}else {
			System.out.println("보");
		}
			
				
				
		//사용자와 컴퓨터가 낸값이 1인경우는 가위, 2인경우는 바위, 3인경우는 보	
		//intR이 컴퓨터가 낸 값이다.		
		int user = 1;
				System.out.println("사용자가 낸 값 : "+ user);
		if (user == intr) {
			System.out.println(" 비겼습니다.");
		}else if (user - intr%3 == 1) {
			System.out.println("이겼습니다.") ;
		}else {
			System.out.println("졌습니다.");
		}      

		//스위치 --switch 에는 byte,short,int,char,string만 가능. long float double 사용불가
		int animal = year%12;
		switch(animal) {
		case  0 :
			System.out.println("원숭이");
		break;
			
		case  1 : 
			System.out.println("닭");
		break;	
		case 2 : 
			System.out.println("개");
			break;
		case 3 : 
			System.out.println("돼지");
			break;
		case 4 : 
			System.out.println("쥐");
			break;
		case 5 : 
			System.out.println("소");
			break;
	
		default:
			System.out.println("양");
		}
	}

}
