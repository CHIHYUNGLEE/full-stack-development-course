import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.Scanner;

public class JBDCTest {
	public static void selectTest() {
		
		//1.jdbc드라이버 로드
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
				
				//2.db와의 연결
				Connection con = null;
				String url= "jdbc:oracle:thin:@localhost:1521:xe"; // localhost대신 ip값도 가능.
				String user= "hr";
				String password= "hr";
				
				Statement stmt = null;//송신
				ResultSet rs = null;//수신
				try {
					con = DriverManager.getConnection(url, user, password);
					System.out.println("DB와 연결 성공");
					
					//3.sql문을 송신
					String selectSQL = "select employee_id, first_name, salary, hire_date from employees";
					stmt = con.createStatement();
					stmt.executeQuery(selectSQL);
					
					//4.결과 수신
					rs = stmt.executeQuery(selectSQL);
					while (rs.next()) {
						int emp_id = rs.getInt("employee_id");
						String f_name = rs.getString("first_name");
						int sal = rs.getInt("salary");
						Date hireDt = rs.getDate("hire_date");
						System.out.println(emp_id+":"+f_name+":"+sal+":"+hireDt);
						
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					
					//5.db연결 접속해제
					if(rs !=null) {
						try {
							rs.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
					if(stmt !=null) {
						try {
							stmt.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
					if(con !=null) {
						try {
							con.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}
	}//end of selecttest
	
	public static void dmlTest() {
		//1.드라이버 로드
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		//2.연결
		Connection con =null;
		String url= "jdbc:oracle:thin:@localhost:1521:xe"; // localhost대신 ip값도 가능.
		String user= "hr";
		String password= "hr";
		
		Statement stmt = null;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			stmt = con.createStatement();
			Scanner sc = new Scanner(System.in);
			System.out.println("고객ID :");
			String id = sc.nextLine();
			System.out.println("고객pwd : ");
			String pwd = sc.nextLine();
			String insertSQL = "insert into customer(id,pwd) values ("+"'"+id+"','"+pwd+"')"; 
			stmt.executeUpdate(insertSQL);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(stmt !=null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con !=null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}	
	}//end of dmltest
	public static void dmlPreparedStatementTest() {
		//1.드라이버 로드
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
				//2.연결
				Connection con =null;
				String url= "jdbc:oracle:thin:@localhost:1521:xe"; // localhost대신 ip값도 가능.
				String user= "hr";
				String password= "hr";
				
				PreparedStatement pstmt = null;
				
				try {
					con = DriverManager.getConnection(url, user, password);
					Scanner sc = new Scanner(System.in);
					System.out.println("고객ID :");
					String id = sc.nextLine();
					System.out.println("고객pwd : ");
					String pwd = sc.nextLine();
					
					
//					String insertSQL = "insert into customer(id,pwd) values ("+"'"+id+"','"+pwd+"')"; 
//					stmt.executeUpdate(insertSQL);
					
					String insertSQL = "insert into customer(id,pwd) values(?,?)"; //?는 바인드변수 : 값을 대신 함.
					pstmt = con.prepareStatement(insertSQL);// sql구문을 미리준비.
					pstmt.setString(1, id);//1번 바인드변수는 id값으로 설정.
					pstmt.setString(2, pwd);//2번 바인드변수는 pwd값으로 설정.
					pstmt.executeUpdate();//실행
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					if(pstmt !=null) {
						try {
							pstmt.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
					if(con !=null) {
						try {
							con.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}	
			}//end of dmltest

	public static void main(String[] args) {
		//selectTest();
		//dmlTest();
		dmlPreparedStatementTest();
		}
}
