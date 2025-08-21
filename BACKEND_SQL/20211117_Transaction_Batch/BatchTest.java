package com.my.sql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BatchTest {

	public static void main(String[] args) {
		Connection con =null;
		PreparedStatement pstmt = null;
		
		try {
			con= MyConnection.getConnection();
			String insertSQL = "insert into product(prod_no,prod_name,prod_price) values (?,?,?)";
			pstmt= con.prepareStatement(insertSQL);
			for(int i = 5 ; i<=10 ;i++) {
				if(i == 10) {
				pstmt.setString(1, "c00"+i);//c0010
				}else {
					pstmt.setString(1, "c000"+i);//c0005~
				}
				pstmt.setString(2, "커피"+i);
				pstmt.setInt(3, i*100);
				//pstmt.executeUpdate();//바인드변수를 db값에 전달
				pstmt.addBatch();//바인드변수들을 일괄처리작업에 추가.
			}
			pstmt.executeBatch();//바인드변수값을 db에 전달하여 일괄처리.
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			MyConnection.close(pstmt, con);
		}
		

	}

}
