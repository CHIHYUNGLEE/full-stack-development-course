
public class Array2 {

	public static void main(String[] args) {
		//배열초기화
		int []arr = {1,2,3,4};
//		arr = {0,1}; //배열재초기화 안됨.
		arr  = new int[] {0,1}; //배열재초기화
		
		char[]alpha = new char[5];
		alpha[0] = 'A';
		alpha[1] = 'B';
		alpha[2] = 'C';
		alpha[3] = 'D';
		alpha[4] = 'E';

		//반복문 으로 바꾸기.
		
		for(int i=0 ; i < arr.length ; i++) {
			alpha[i] =(char)('A'+ i); 			
		}
		for(int i=0 ; i < arr.length ; i++) {
			alpha[i] =(char)('A'+ i); 		
			System.out.println(i + "-" + alpha[i]+ ",");
		}
		
		System.out.println("---------------------------------------------");
		
		//1~10사이의 배열
		arr = new int[] {1,4,3,2,10,4,2,7,3,1,1};

		//각 숫자의 출현횟수를 출력하시오  
		int cntarr[] = new int[10]; //출현횟수가 저장될 배열
		
		for(int i = 0 ; i < arr.length ; i++) {
			int num = arr[i]; //i=0 num=1, i=1 num=4
			cntarr[num-1]++;//cntarr[1-]++; cntarr[4-1]++	
		}
				
		for(int i=0;i<cntarr.length;i++) {
			System.out.println("각 숫자의 출현횟수:" + cntarr[i]);
		}	
		
		System.out.println("---------------------------------------------");
		
		//중복이 안나오는 로또번호 출력하기.
		int[]lotto = new int[6];
		for(int i=0 ; i<lotto.length;i++) {
			//현재숫자
		lotto[i] = (int)(Math.random()*45)+1;
			for(int j=0;j<i;j++) {
				if(lotto[i]==lotto[j]) {
					i--;
					break;
				}
			}		
		}
				
		for(int i=0 ; i<lotto.length;i++) {
			System.out.println(lotto[i]);
		}
		
		System.out.println("---------------------------------------------");
		
		//2차원 배열
		//각 배열에 *넣기
		char[][]star;
		star = new char[5][5];
		for( int row =0 ; row<star.length ;row++) {
			for(int col = 0; col < star[row].length; col++) {
				star[row][col] = '*';
				
			}
		
		}	
		
		for( int row =0 ; row<star.length ;row++) {
			for(int col = 0; col<star[row].length;col++){
				System.out.print(star[row][col]);	
			}
			System.out.println();
			}
		
		
		System.out.println("---------------------------------------------");
		
		//각 배열에 1~9넣기
		int[][]arr2 = new int[3][3];
		int num = 1;
		for(int row2 = 0 ; row2 < arr2.length ; row2++) {
			
			for(int col2 = 0; col2 < arr2[row2].length ; col2++) {
				arr2[row2][col2] = num;
				num++;
			}
		}
		
		for(int row2 = 0 ; row2<arr2.length ; row2++) {
			for(int col2 = 0; col2<arr2[row2].length;col2++) {
				System.out.print(arr2[row2][col2]);
			}
			System.out.println();
		}
		
		
		
		System.out.println("---------------------------------------------");
		
		//최대, 최소, 정렬하기
		
		//최대값 출력하기.
		int []arr3 = {4,8,3,7,2,5};
		
		int maxnum = 0;
		for(int i=0 ; i<arr3.length ; i++) {
			if (maxnum < arr3[i]) {
				maxnum = arr3[i];
				}		
		}
		System.out.println("최대값 : "+maxnum);
		
		
		
		java.util.Arrays.sort(arr3); //오름차순 정렬
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
