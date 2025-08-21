
public class Employee {
	String setNo;
	String setName;
	int setSalary;
	
	void setNo(String num) {
		setNo = num;
	}
	void setName(String n) {
		setName = n;
	}
	
	void setSalary(int s) {
		setSalary = s;
	}
	
	void printInfo() {
		System.out.println("사번은 " +setNo);
		System.out.println("사원명은 "+setName);
		System.out.println("급여는 "+setSalary);
		
	}
}
