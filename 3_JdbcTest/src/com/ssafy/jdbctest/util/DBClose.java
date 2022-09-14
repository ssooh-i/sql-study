package com.ssafy.jdbctest.util;

public class DBClose {
	//DBClose 없어도 굴러감, 업데이트 되면서 바뀜
	public static void close(AutoCloseable...autoCloseables) {
		for(AutoCloseable ac: autoCloseables) {
			if(ac != null) {
				try {
					ac.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	
	/*public static void close(Connection conn, PreparedStatement pstmt) {
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			if(rs != null) rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}*/
	
}
